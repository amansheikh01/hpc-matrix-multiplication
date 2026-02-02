# HPC Matrix Multiplication using OpenMP

This project demonstrates high-performance matrix multiplication using OpenMP,
including benchmarking and strong scaling analysis.

## Features
- Naive OpenMP matrix multiplication
- Cache-optimized (tiled) OpenMP implementation
- Automated benchmarking scripts
- Strong scaling and efficiency analysis

## Project Structure
hpc-matrix-multiplication/
├── src/
│   ├── matrix_mul_omp.c
│   ├── matrix_mul_tiled.c
│   ├── run_benchmark.sh
│   ├── run_strong_scaling.sh
│   ├── benchmark_results.txt
│   └── strong_scaling_results.txt
├── results/
└── README.md

## How to Compile
cd src
gcc -O3 -fopenmp matrix_mul_omp.c -o matrix_omp
gcc -O3 -fopenmp matrix_mul_tiled.c -o matrix_tiled

## How to Run
cd src
./run_benchmark.sh
./run_strong_scaling.sh

## Key Observations
- Cache tiling significantly improves performance
- Strong scaling efficiency decreases with higher threads
- Memory bandwidth becomes the limiting factor

## Technologies Used
- C
- OpenMP
- GCC
- Bash
- Linux (WSL)

## Author
Aman Bashir Sheikh

