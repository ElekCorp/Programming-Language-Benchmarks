#!/bin/bash

#rm -rf build

LANGS="go" # c cpp zig go javascript python"
PROBLEMS="spectral-norm" #"mandelbrot nbody spectral-norm"

dotnet run --project tool -- --task build --langs $LANGS --problems $PROBLEMS --force-rebuild
dotnet run --project tool -- --task test --langs $LANGS --problems $PROBLEMS
dotnet run --project tool -- --task bench --langs $LANGS --problems $PROBLEMS

cd ../website

pnpm i && pnpm content && pnpm build
