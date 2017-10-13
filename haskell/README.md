# What this is
This is a small haskell utility for generating pretty explanation trees based on document encodings. All data used in the paper in the parent directory is encoded, manually, in the DocEncodings.hs file

# Installation
To install this script you must have both [stack](https://docs.haskellstack.org/en/stable/README/) and [cabal](https://www.haskell.org/cabal/). Then just clone this directory.

# How to run
To run any examples, go to the haskell root directory (the directory with the .cabal file). Then run the following:

```
[doyougnu@7thChamber XOP_Encoding]$ cd haskell/

[doyougnu@7thChamber haskell]$ ls
app  LICENSE  README.md  Setup.hs  src  stack.yaml  test  xop.cabal

[doyougnu@7thChamber haskell]$ stack setup
stack will use a sandboxed GHC it installed
For more information on paths, see 'stack path' and 'stack exec env'
To use this GHC and packages outside of a project, consider using:
stack ghc, stack ghci, stack runghc, or stack exec

[doyougnu@7thChamber haskell]$ stack build
xop-0.1.0.0: build (lib + exe)
Preprocessing library xop-0.1.0.0...
Preprocessing executable 'xop-exe' for xop-0.1.0.0...
[1 of 1] Compiling Main             ( app/Main.hs, .stack-work/dist/x86_64-linux-ncurses6-nopie/Cabal-1.24.2.0/build/xop-exe/xop-exe-tmp/Main.o )
Linking .stack-work/dist/x86_64-linux-ncurses6-nopie/Cabal-1.24.2.0/build/xop-exe/xop-exe ...
xop-0.1.0.0: copy/register
Installing library in
/home/doyougnu/Research/XOP_Encoding/haskell/.stack-work/install/x86_64-linux-ncurses6-nopie/lts-9.1/8.0.2/lib/x86_64-linux-ghc-8.0.2/xop-0.1.0.0-5n7BsGsn8v0JtsHikHEciz
Installing executable(s) in
/home/doyougnu/Research/XOP_Encoding/haskell/.stack-work/install/x86_64-linux-ncurses6-nopie/lts-9.1/8.0.2/bin
Registering xop-0.1.0.0...

[doyougnu@7thChamber haskell]$ stack ghci
The following GHC options are incompatible with GHCi and have not been passed to it: -threaded
Configuring GHCi with the following packages: xop
Using main module: 1. Package `xop' component exe:xop-exe with main-is file: /home/doyougnu/Research/XOP_Encoding/haskell/app/Main.hs
GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
[1 of 3] Compiling StackTree        ( /home/doyougnu/Research/XOP_Encoding/haskell/src/StackTree.hs, interpreted )
[2 of 3] Compiling ExplanationTree  ( /home/doyougnu/Research/XOP_Encoding/haskell/src/ExplanationTree.hs, interpreted )
[3 of 3] Compiling DocEncodings     ( /home/doyougnu/Research/XOP_Encoding/haskell/src/DocEncodings.hs, interpreted )
Ok, modules loaded: DocEncodings, ExplanationTree, StackTree.
[4 of 4] Compiling Main             ( /home/doyougnu/Research/XOP_Encoding/haskell/app/Main.hs, interpreted )
Ok, modules loaded: DocEncodings, ExplanationTree, Main, StackTree.
Loaded GHCi configuration from /tmp/ghci16543/ghci-script
*Main DocEncodings ExplanationTree StackTree> prettyTree $ toTree avt01
Aspect DataStructure
+- Aspect Problem
|  +- Move Description
|  +- Move Example
|  +- Move Proposal
|  `- Aspect Solution
|     +- Move InVivo
|     +- Aspect Property
...

```
