FROM clouway/java11:jre-alpine

RUN mkdir -p /workspace
RUN mkdir -p /bin
WORKDIR /bin

RUN wget --output-document=wire-compiler.jar "https://repo1.maven.org/maven2/com/squareup/wire/wire-compiler/3.4.0/wire-compiler-3.4.0-jar-with-dependencies.jar"

WORKDIR /workspace

ENTRYPOINT [ "java", "-jar", "/bin/wire-compiler.jar"]