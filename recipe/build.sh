#!/bin/bash
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="$PREFIX/lib:$LIBRARY_PATH"
export C_INCLUDE_PATH="$PREFIX/include:$C_INCLUDE_PATH"
export CABAL_DIR="$PREFIX"
export LD=x86_64-conda_cos6-linux-gnu-ld
ghc-pkg recache
cabal update
cabal install --prefix=$PREFIX --bindir=$PREFIX/bin --libdir=$PREFIX/lib --ghc-options="-threaded" --extra-lib-dirs=$PREFIX/lib --extra-include-dirs=$PREFIX/include happy-1.19.9
