FROM debian:bookworm
ENV DEBIAN_FRONTEND=noninteractive
RUN \
	echo 'deb http://deb.debian.org/debian bookworm-backports main' >> \
		/etc/apt/sources.list \
		&& \
	apt update && \
	apt install -y apt-utils `# huh??? ` && \
	:
RUN \
	apt install -y -t bookworm-backports \
		autoconf \
		cmake \
		debhelper \
		gcc \
		git \
		git-annex \
		gpg \
		libcurl4-openssl-dev \
		libtool \
		lintian \
		make \
		zlib1g-dev \
		&& \
	:
RUN \
	cmake --version && \
	gcc --version && \
	ldd --version && \
	:

