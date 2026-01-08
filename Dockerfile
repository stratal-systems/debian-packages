FROM debian:bookworm
RUN apt update
RUN apt install -y \
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

