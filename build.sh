#!/usr/bin/env bash
#
# Build (and optionally push) Docker images defined by image.yaml files.
#
# Usage:
#   ./build.sh <dir> [--push]        Build a single image
#   ./build.sh --all [--push]        Build every image in the repo
#
# Examples:
#   ./build.sh go-runtime/3_20_4
#   ./build.sh java17/jre-jammy --push
#   ./build.sh --all
#
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"

# ---------------------------------------------------------------------------
# Parse image.yaml (portable, no yq needed)
# ---------------------------------------------------------------------------
parse_yaml() {
  local file="$1"
  REGISTRY=$(grep '^registry:' "$file" | awk '{print $2}')
  IMAGE=$(grep '^image:' "$file" | awk '{print $2}')
  TAG=$(grep '^tag:' "$file" | awk '{print $2}' | tr -d '"')
  PLATFORMS=$(grep '^ *- ' "$file" | awk '{print $2}' | tr '\n' ',' | sed 's/,$//')
  FULL_IMAGE="$REGISTRY/$IMAGE:$TAG"
}

# ---------------------------------------------------------------------------
# Build one image directory
# ---------------------------------------------------------------------------
build_image() {
  local dir="$1"
  local push="${2:-false}"

  if [ ! -f "$dir/image.yaml" ]; then
    echo "ERROR: $dir/image.yaml not found" >&2
    return 1
  fi

  parse_yaml "$dir/image.yaml"

  echo "===> Building $FULL_IMAGE"
  echo "     Context:   $dir"
  echo "     Platforms: $PLATFORMS"

  if [ "$push" = "true" ]; then
    echo "     Push:      yes (multi-arch)"
    docker buildx build \
      --platform "$PLATFORMS" \
      -t "$FULL_IMAGE" \
      --push \
      "$dir"
  else
    # Local build: use --load with the current machine's platform only
    # (--load does not support multi-platform)
    echo "     Push:      no (local build, use --push for multi-arch)"
    docker buildx build \
      --load \
      -t "$FULL_IMAGE" \
      "$dir"
  fi

  echo ""
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
PUSH=false
ALL=false
DIRS=()

for arg in "$@"; do
  case "$arg" in
    --push) PUSH=true ;;
    --all)  ALL=true ;;
    *)      DIRS+=("$arg") ;;
  esac
done

if [ "$ALL" = true ]; then
  while IFS= read -r yaml; do
    DIRS+=("$(dirname "$yaml")")
  done < <(find "$ROOT" -name image.yaml -not -path '*/.git/*' | sort)
fi

if [ ${#DIRS[@]} -eq 0 ]; then
  echo "Usage: $0 <dir> [--push]"
  echo "       $0 --all [--push]"
  exit 1
fi

for dir in "${DIRS[@]}"; do
  # Resolve relative paths
  if [[ "$dir" != /* ]]; then
    dir="$ROOT/$dir"
  fi
  build_image "$dir" "$PUSH"
done

echo "Done."
