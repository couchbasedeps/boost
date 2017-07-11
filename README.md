Couchbasedeps Boost repository
------------------------------

This is a little different than most Couchbasedeps repos, in that it is not
a fork of some upstream repository. Boost is just too huge - if you clone
git://github.com/boostorg/boost and init all the submodules, it's over a
1.5GB download. It's theoretically possible to sync only the modules you
want and build from there, but it's very challenging, so you end up needing
the whole pile.

However, the individual release source tarballs are only around 80MB, which
gives us everything we need. So, this repository just contains those,
unpacked into the "boost-dist" directory.

There are git tags for each release stored.
