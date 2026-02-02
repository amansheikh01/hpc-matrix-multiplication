#!/bin/bash

THREADS_LIST=(1 2 4 8)

echo "====================================================================="
echo " Strong Scaling Analysis – Tiled OpenMP Matrix Multiplication (N=2048)"
echo "====================================================================="
printf "%-10s | %-15s | %-15s | %-15s\n" \
       "Threads" "Time (s)" "Speedup" "Efficiency (%)"
echo "---------------------------------------------------------------------"

# Run with 1 thread first (baseline)
export OMP_NUM_THREADS=1
BASE_OUT=$(./matrix_tiled)
BASE_TIME=$(echo "$BASE_OUT" | grep "Execution time" | awk '{print $(NF-1)}')

printf "%-10d | %-15.4f | %-15s | %-15s\n" 1 "$BASE_TIME" "1.00" "100.00"

# Run for remaining thread counts
for t in 2 4 8; do
    export OMP_NUM_THREADS=$t
    OUT=$(./matrix_tiled)
    TIME=$(echo "$OUT" | grep "Execution time" | awk '{print $(NF-1)}')

    SPEEDUP=$(awk "BEGIN {printf \"%.2f\", $BASE_TIME / $TIME}")
    EFFICIENCY=$(awk "BEGIN {printf \"%.2f\", ($BASE_TIME / $TIME) / $t * 100}")

    printf "%-10d | %-15.4f | %-15s | %-15s\n" \
           "$t" "$TIME" "$SPEEDUP" "$EFFICIENCY"
done

echo "====================================================================="

