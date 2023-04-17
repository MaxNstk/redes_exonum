FROM ibmjava:8-sdk

WORKDIR /code

COPY . .

RUN apt-get update && apt install -y openjdk-11-jdk && \
    https://github.com/exonum/exonum-java-binding/releases/download/ejb%2Fv0.10.0/exonum-java-0.10.0-debug-Linux-x86_64.zip && \
    unzip exonum-java-0.10.0-debug-Linux-x86_64.zip && \
    apt-get install libsodium-dev && \
    export EXONUM_HOME=~/exonum-java-0.10.0-debug-Linux-x86_64 && \
    export PATH="$PATH:$EXONUM_HOME/bin" && \
    wget https://dlcdn.apache.org/maven/maven-3/3.9.1/binaries/apache-maven-3.9.1-bin.tar.gz && \



