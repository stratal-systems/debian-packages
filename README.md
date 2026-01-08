# STRATAL SYSTEMS debian packages

These are debian packages of various Free Software projects that
are needed as dependencies of STRATAL SYSTEMS Projects.

These may conflict with official debian packages.
Please only install inside containers.

Download the deb packages here:
- <https://github.com/stratal-systems/debian-packages/releases>

## List of packages

### libhdf5-static-pic

[libHDF5](https://github.com/HDFGroup/hdf5) compiled as static
libraries (.a) with position-independent code.
These are needed for [gateau](https://github.com/tifuun/gateau).

### libgsl-static-pic

[GNU Scientific Library](https://www.gnu.org/software/gsl/)
compiled as static libraries (.a) with position-independent code.
These are needed for [gateau](https://github.com/tifuun/gateau).

## CI

This repo implements basic CI (continuous integration)
via github actions (see .github/workflows).

### `.github/workflows/build-image.yml`

This workflow runs when `Dockerfile` is updated and builds a Debian
container image that can be used to build all packages in this repo.
You can view the built container here:
- <https://github.com/stratal-systems/debian-packages/packages>

### `.github/workflows/build-packages.yml`

This workflow runs on all tagged commits.
It builts all packages in the repo using the Debian container image,
and publishes them to the releases page:
- <https://github.com/stratal-systems/debian-packages/releases>

