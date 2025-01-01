#!/bin/bash

rm -rf build

LANGS="c zig go"

dotnet run --project tool -- --task build --langs $LANGS --problems mandelbrot
dotnet run --project tool -- --task test --langs $LANGS --problems mandelbrot
dotnet run --project tool -- --task bench --langs $LANGS --problems mandelbrot

cd ../website

pnpm i && pnpm content && pnpm build
