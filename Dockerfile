FROM ubuntu:14.04

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		git \
		unzip \
		curl \
		nano \
		xinetd \
		telnet \
		wget \
	&& rm -rf /var/lib/apt/lists/*

RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz -O \
	/usr/src/jdk-8u102-linux-x64.tar.gz

RUN mkdir -p /usr/lib/jvm

RUN tar -xzf /usr/src/jdk-8u102-linux-x64.tar.gz -C /usr/lib/jvm

RUN ln -s /usr/lib/jvm/jdk1.8.0_102 /usr/lib/jvm/java-8-oracle

RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-8-oracle/bin/java" 1

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle