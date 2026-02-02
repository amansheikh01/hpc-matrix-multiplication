<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   
</head>
<body>


<h1> High-Performance Matrix Multiplication Using OpenMP</h1>
<p>
This project presents a comprehensive study of high-performance matrix
multiplication on shared-memory architectures using <b>OpenMP</b>.
It focuses on performance optimisation, benchmarking, and strong scaling
analysis of parallel matrix multiplication algorithms implemented in C.
</p>

<hr>

<h2>Project Objectives</h2>
<ul>
  <li>To implement parallel matrix multiplication using OpenMP</li>
  <li>To analyse performance improvements through cache-aware optimisations</li>
  <li>To study strong scaling behaviour on multicore processors</li>
  <li>To understand the impact of memory bandwidth and thread scalability</li>
</ul>

<hr>

<h2>Features</h2>
<ul>
  <li>Naive OpenMP matrix multiplication implementation</li>
  <li>Cache-optimised (tiled) matrix multiplication</li>
  <li>Automated benchmarking using shell scripts</li>
  <li>Strong scaling and efficiency evaluation</li>
</ul>

<hr>

<h2>Project Structure</h2>

<pre>
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
</pre>

<hr>

<h2>Implementation Overview</h2>

<p>
The project includes two matrix multiplication strategies:
</p>

<ul>
  <li>
    <b>Naive OpenMP Implementation</b> — A straightforward parallelisation
    of the triple-nested loop matrix multiplication using OpenMP directives.
  </li>
  <li>
    <b>Tiled (Cache-Optimised) Implementation</b> — A block-based approach
    designed to improve cache locality and reduce memory access latency.
  </li>
</ul>

<hr>

<h2>How to Compile</h2>

<pre>
cd src
gcc -O3 -fopenmp matrix_mul_omp.c -o matrix_omp
gcc -O3 -fopenmp matrix_mul_tiled.c -o matrix_tiled
</pre>

<hr>

<h2>How to Run</h2>

<pre>
cd src
./run_benchmark.sh
./run_strong_scaling.sh
</pre>

<hr>

<h2>Benchmark Results (N = 2048)</h2>

<p>
The following table compares execution time between a naive OpenMP implementation
and a cache-optimised tiled implementation. The reported speedup is calculated as
the ratio of naive execution time to tiled execution time.
</p>

<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>Threads</th>
        <th>Naive Time (s)</th>
        <th>Tiled Time (s)</th>
        <th>Speedup</th>
    </tr>
    <tr>
        <td>1</td>
        <td>87.9724</td>
        <td>10.1177</td>
        <td>8.69</td>
    </tr>
    <tr>
        <td>2</td>
        <td>44.8283</td>
        <td>5.5742</td>
        <td>8.04</td>
    </tr>
    <tr>
        <td>4</td>
        <td>34.9294</td>
        <td>3.4970</td>
        <td>9.99</td>
    </tr>
    <tr>
        <td>8</td>
        <td>32.6481</td>
        <td>2.1029</td>
        <td>15.53</td>
    </tr>
</table>

<p>
These results demonstrate that cache tiling significantly reduces memory access
latency and improves data locality, leading to substantial performance gains.
The benefits become increasingly pronounced as the number of threads increases.
</p>

<hr>

<h2>Strong Scaling Analysis (Tiled OpenMP, N = 2048)</h2>

<p>
Strong scaling evaluates how execution time decreases as the number of threads
increases for a fixed problem size. The following table reports runtime, speedup,
and parallel efficiency for the tiled OpenMP implementation.
</p>

<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>Threads</th>
        <th>Time (s)</th>
        <th>Speedup</th>
        <th>Efficiency (%)</th>
    </tr>
    <tr>
        <td>1</td>
        <td>8.0001</td>
        <td>1.00</td>
        <td>100.00</td>
    </tr>
    <tr>
        <td>2</td>
        <td>4.5733</td>
        <td>1.75</td>
        <td>87.47</td>
    </tr>
    <tr>
        <td>4</td>
        <td>2.8410</td>
        <td>2.82</td>
        <td>70.40</td>
    </tr>
    <tr>
        <td>8</td>
        <td>2.1627</td>
        <td>3.70</td>
        <td>46.24</td>
    </tr>
</table>

<p>
The results indicate diminishing parallel efficiency as thread count increases,
primarily due to memory bandwidth saturation and synchronisation overheads.
Nevertheless, the implementation exhibits good scalability up to moderate
thread counts.
</p>

<hr>

<h2>Key Observations</h2>
<ul>
  <li>Cache tiling significantly reduces execution time</li>
  <li>Near-linear speedup is observed at lower thread counts</li>
  <li>Parallel efficiency decreases as memory bandwidth becomes a bottleneck</li>
  <li>Performance gains are more prominent for larger matrix sizes</li>
</ul>

<hr>

<h2>Technologies Used</h2>
<ul>
  <li>C Programming Language</li>
  <li>OpenMP</li>
  <li>GCC Compiler</li>
  <li>Bash Scripting</li>
  <li>Linux / WSL Environment</li>
</ul>

<hr>

<h2>Author</h2>

<h2>Author</h2>

<p>
<strong>Aman Bashir Sheikh</strong><br>
Email: <a href="mailto:aman.b.sheikh119@gmail.com">aman.b.sheikh119@gmail.com</a><br>
LinkedIn: 
<a href="https://www.linkedin.com/in/aman-sheikh-aa701b253" target="_blank">
www.linkedin.com/in/aman-sheikh-aa701b253
</a>
</p>


</body>
</html>
