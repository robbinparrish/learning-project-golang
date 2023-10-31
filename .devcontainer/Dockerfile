FROM debian:12.2

ENV DEBIAN_FRONTEND=noninteractive

# Perform an update.
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get clean all

# Install common utilities and tools.
RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
	bash curl wget tar zip bzip2 xz-utils \
	unzip make ca-certificates gnupg \
	git git-core openssh-client vim

# Install GO.
ENV GO_LANG_VERSION=1.21.3
ENV PATH=/usr/local/go/bin:${PATH}
RUN wget https://go.dev/dl/go${GO_LANG_VERSION}.linux-amd64.tar.gz && \
	tar -zxf go${GO_LANG_VERSION}.linux-amd64.tar.gz -C /usr/local/ && \
	rm -f go${GO_LANG_VERSION}.linux-amd64.tar.gz && \
	mkdir -p /etc/profile.d/ && \
	echo "export PATH=/usr/local/go/bin:${PATH}" | tee /etc/profile.d/go-env.sh && \
	go version

# Create default user.
ENV USER_ID=1000
ENV USER_NAME=devuser
RUN addgroup --gid ${USER_ID} ${USER_NAME} && \
	adduser --disabled-password --gecos "" \
	    --uid ${USER_ID} --gid ${USER_ID} ${USER_NAME}

# Install additonal go modules.
ENV GOPATH=/home/${USER_NAME}/go
ADD ./install-additional-tools.sh /tmp
RUN mkdir -p ${GOPATH} && \
	bash /tmp/install-additional-tools.sh && \
	chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}

# Set default user.
ENV HOME /home/devuser
USER devuser

CMD /bin/bash
