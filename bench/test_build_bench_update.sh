#!/bin/bash

rm -rf build

LANGS="c zig fortran cpp "
PROBLEMS="mandelbrot nbody spectral-norm"

dotnet run --project tool -- --task build --langs $LANGS --problems $PROBLEMS
dotnet run --project tool -- --task test --langs $LANGS --problems $PROBLEMS
dotnet run --project tool -- --task bench --langs $LANGS --problems $PROBLEMS

cd ../website

pnpm i && pnpm content && pnpm build
