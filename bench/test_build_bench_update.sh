#!/bin/bash

rm -rf build

dotnet run --project tool -- --task build --langs c --problems mandelbrot
dotnet run --project tool -- --task test --langs c --problems mandelbrot
dotnet run --project tool -- --task bench --langs c --problems mandelbrot

cd ../website

sudo pnpm i && pnpm content && pnpm build
