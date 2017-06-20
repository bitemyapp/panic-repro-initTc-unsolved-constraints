# panic-repro-initTc-unsolved-constraints

To reproduce the error:

- Have [Stack](http://haskellstack.org) installed
- `stack setup`
- `stack build`

Get an error something like:

```
$ stack build
panic-repro-initTc-unsolved-constraints-0.0.0.1: build (lib)
Preprocessing library panic-repro-initTc-unsolved-constraints-0.0.0.1...
[3 of 3] Compiling Lib              ( src/Lib.hs, .stack-work/dist/x86_64-linux/Cabal-1.24.2.0/build/Lib.o )
ghc: panic! (the 'impossible' happened)
  (GHC version 8.0.2 for x86_64-unknown-linux):
	initTc: unsolved constraints
  WC {wc_insol =
        [W] over_amEW :: t_amEV[tau:1] (CHoleCan: over)
        [W] ix_amF5 :: t_amF4[tau:1] (CHoleCan: ix)}

Please report this as a GHC bug:  http://www.haskell.org/ghc/reportabug


--  While building package panic-repro-initTc-unsolved-constraints-0.0.0.1 using:
      /home/callen/.stack/setup-exe-cache/x86_64-linux/Cabal-simple_mPHDZzAJ_1.24.2.0_ghc-8.0.2 --builddir=.stack-work/dist/x86_64-linux/Cabal-1.24.2.0 build lib:panic-repro-initTc-unsolved-constraints --ghc-options " -ddump-hi -ddump-to-file"
    Process exited with code: ExitFailure 1
```
