#!/bin/bash
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="$PREFIX/lib:$LIBRARY_PATH"
export C_INCLUDE_PATH="$PREFIX/include:$C_INCLUDE_PATH"
export CABAL_DIR="$PREFIX"
export LDFLAGS=" -L$PREFIX/lib "
ghc-pkg recache
cabal update
cabal install --prefix=$PREFIX --bindir=$PREFIX/bin --libdir=$PREFIX/lib --ghc-options="-threaded -lgmp -threaded -pgmc x86_64-conda_cos6-linux-gnu-cc -pgml x86_64-conda_cos6-linux-gnu-cc" --extra-lib-dirs=$PREFIX/lib --extra-include-dirs=$PREFIX/include happy-1.19.9
