#!/bin/bash

THREADS_LIST=(1 2 4 8)

echo "=============================================================="
echo "   OpenMP Matrix Multiplication Benchmark (N = 2048)"
echo "=============================================================="
printf "%-10s | %-15s | %-15s | %-10s\n" "Threads" "Naive (s)" "Tiled (s)" "Speedup"
echo "--------------------------------------------------------------"

for t in "${THREADS_LIST[@]}"; do
    export OMP_NUM_THREADS=$t

    NAIVE_OUT=$(./matrix_omp)
    TILED_OUT=$(./matrix_tiled)

    NAIVE_TIME=$(echo "$NAIVE_OUT" | grep "Execution time" | awk '{print $(NF-1)}')
    TILED_TIME=$(echo "$TILED_OUT" | grep "Execution time" | awk '{print $(NF-1)}')

    SPEEDUP=$(awk "BEGIN {printf \"%.2f\", $NAIVE_TIME / $TILED_TIME}")

    printf "%-10d | %-15.4f | %-15.4f | %-10s\n" \
           "$t" "$NAIVE_TIME" "$TILED_TIME" "$SPEEDUP"
done

echo "=============================================================="
echo "Speedup = Naive_Time / Tiled_Time"

