FROM ibmjava:8-sdk

RUN mkdir -p ~/bin

WORKDIR /bin

RUN apt-get update && apt install unzip && \
    wget https://github.com/exonum/exonum-java-binding/releases/download/ejb%2Fv0.10.0/exonum-java-0.10.0-debug-Linux-x86_64.zip && \
    unzip exonum-java-0.10.0-debug-Linux-x86_64.zip && \
    apt-get install libsodium-dev

RUN apt-get install openjdk-11-jdk && \
    wget https://dlcdn.apache.org/maven/maven-3/3.9.1/binaries/apache-maven-3.9.1-bin.zip && \
    unzip apache-maven-3.9.1-bin.zip

RUN export EXONUM_HOME=~/bin/exonum-java-0.10.0-debug && \
    export PATH="$PATH:$EXONUM_HOME/bin" && \
    export MAVEM_HOME=~/bin/apache-maven-3.9.1 && \
    export PATH="$PATH:$MAVEM_HOME/bin"

RUN mvn archetype:generate \
    -DinteractiveMode=false \
    -DarchetypeGroupId=com.exonum.binding \
    -DarchetypeArtifactId=exonum-java-binding-service-archetype \
    -DarchetypeVersion=0.10.0 \
    -DgroupId=com.example.myservice \
    -DartifactId=my-service \
    -Dversion=1.0.0

RUN mvn archetype:generate \
    -DarchetypeGroupId=com.exonum.binding \
    -DarchetypeArtifactId=exonum-java-binding-service-archetype \
    -DarchetypeVersion=0.10.0