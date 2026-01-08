#!/bin/sh

pkgs="libhdf5-static-pic libgsl-static-pic"

# echo to stderr
eecho() {
	echo "$@" >&2
}

# echo to stderr and exit with error
die() {
	eecho "$@"
	exit 1
}

cd_ass() {
	cd "$1" || die "Failed to cd into ${2:-$1}"
}

export DH_VERBOSE=1 

for pkg in $pkgs
do
	eecho "Processing $pkg"
	if ls ./pkg/"${pkg}"*.deb
	then
		eecho "exists, skipping."
		continue
	fi

	cd_ass "./pkg/${pkg}"
	dpkg-buildpackage -b || die "Failed to build $pkg"
	cd_ass ../..
done

eecho "Done!"

