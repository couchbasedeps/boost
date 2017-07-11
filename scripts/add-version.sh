#!/bin/bash -e

# Script to add a new version of boost to this repository.

VERSION=$1
if [ -z "${VERSION}" ]
then
  echo "Usage: $0 <boost version>"
  exit 1
fi

VERSION_UNDER=${VERSION//\./_}
ROOT=$(dirname $0)/..

echo Downloading Boost ${VERSION}...
curl -L https://sourceforge.net/projects/boost/files/boost/${VERSION}/boost_${VERSION_UNDER}.tar.bz2/download -o /tmp/boost-${VERSION}.tar.bz2

echo Extracting...
cd ${ROOT}
tar xf /tmp/boost-${VERSION}.tar.bz2
rm /tmp/boost-${VERSION}.tar.bz2

echo Replacing old boost-dist...
rm -rf boost-dist
mv boost_${VERSION_UNDER} boost-dist
# Need to remove this package as it has file paths too long to even
# "git clone" successfully on Windows (!)
rm -rf boost-dist/libs/geometry
git add boost-dist
git commit -m "Adding Boost ${VERSION}"
git tag -a -m "Boost ${VERSION}" v${VERSION}

echo "Done!"
echo "Don't forget to use 'git push --tags' when uploading to GitHub"
