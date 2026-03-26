# docker-containers

A collection of Docker images built and pushed via GitHub Actions CI/CD.

## How it works

Each image lives in its own directory with:
- `Dockerfile` — the image definition
- `image.yaml` — build metadata (registry, image name, tag, platforms)

On every push to `master`/`main`, the CI workflow auto-detects which image directories changed and builds+pushes only those images.

Pull requests build images without pushing (validation only).

### image.yaml format

```yaml
registry: europe-west3-docker.pkg.dev/cwregistry/base   # or: clouway
image: golang
tag: alpine3204-runtime
platforms:
  - linux/amd64
  - linux/arm64
```

## Local builds

```bash
# Build a single image
./build.sh go-runtime/3_20_4

# Build and push
./build.sh go-runtime/3_20_4 --push

# Build all images
./build.sh --all
```

## Adding a new image

1. Create a directory with a `Dockerfile`
2. Add an `image.yaml` with registry, image name, tag, and platforms
3. Commit and push — CI handles the rest

## CI/CD secrets required

| Secret | Description |
|--------|-------------|
| `GCP_WORKLOAD_IDENTITY_PROVIDER` | GCP Workload Identity provider for Artifact Registry |
| `GCP_SERVICE_ACCOUNT` | GCP service account for Artifact Registry push |
| `DOCKERHUB_USERNAME` | Docker Hub username (for `clouway/*` images) |
| `DOCKERHUB_TOKEN` | Docker Hub access token |

## Images

### GCP Artifact Registry (`europe-west3-docker.pkg.dev/cwregistry/base`)

| Image | Tag | Directory |
|-------|-----|-----------|
| golang | alpine3204-runtime | go-runtime/3_20_4 |
| golang | alpine3204-stemming-runtime | go-runtime/3_20_4_stemming_rules |
| golang | alpine3132-runtime | go-runtime |
| java11 | jre-alpine-20231113 | java11/jre |
| postgresql | 17-bookworm-timescaledb | postgresql/17-bookwarm |

### Docker Hub (`clouway`)

| Image | Tag | Directory |
|-------|-----|-----------|
| java11 | jdk-alpine | java11/jdk |
| java11 | zulu-alpine | java11/zulu |
| java17 | jre-jammy | java17/jre-jammy |
| gcloud-datastore-emulator | 0.0.1 | datastore-emulator |
| firestore-emulator | alpine | firestore-emulator |
| redis | 6.2.2-debian-10-r4-search | redis |
| redis-cli | 6.2.4 | redis-cli |
| redis-cluster | 6.2.6-debian-10-r24-search | redis-cluster |
| golang | tesseract | go-tesseract |
| wire-compiler | latest | wire-compiler |
| bazel-build | latest | bazel-build |
