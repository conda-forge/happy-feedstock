#!/bin/bash
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="$PREFIX/lib:$LIBRARY_PATH"
export C_INCLUDE_PATH="$PREFIX/include:$C_INCLUDE_PATH"
export CABAL_DIR="$PREFIX"
export LDFLAGS=" -lgmp $LDFLAGS "
export LD="x86_64-conda_cos6-linux-gnu-ld"
ghc-pkg recache
ghc-pkg describe rts
ghc-pkg describe rts > rts.pkg
perl -pi -e 's/$PREFIX\/lib\/ghc-8.2.2\/rts/$PREFIX\/lib\/ghc-8.2.2\/rts \$\{pkgroot\}\/../g' rts.pkg
cat rts.pkg
cabal update
cabal install --prefix=$PREFIX --bindir=$PREFIX/bin --libdir=$PREFIX/lib --ghc-options="-threaded -lgmp -threaded -pgmc x86_64-conda_cos6-linux-gnu-cc -pgml x86_64-conda_cos6-linux-gnu-cc -optl=-'-lgmp -L$PREFIX/lib '" --extra-lib-dirs=$PREFIX/lib --extra-include-dirs=$PREFIX/include happy-1.19.9
