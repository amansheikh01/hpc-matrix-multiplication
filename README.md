<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>High-Performance Matrix Multiplication Using OpenMP</title>
</head>
<body>



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

<h2>Benchmark Results</h2>

<p>
The following table presents execution times obtained for different matrix
sizes and thread counts. The tiled implementation consistently outperforms
the naive approach due to improved cache utilisation.
</p>

<table border="1" cellpadding="8" cellspacing="0">
  <thead>
    <tr>
      <th>Matrix Size</th>
      <th>Threads</th>
      <th>Naive OpenMP Time (s)</th>
      <th>Tiled OpenMP Time (s)</th>
      <th>Speedup</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1024 × 1024</td>
      <td>1</td>
      <td>2.45</td>
      <td>1.72</td>
      <td>1.42×</td>
    </tr>
    <tr>
      <td>1024 × 1024</td>
      <td>4</td>
      <td>0.82</td>
      <td>0.46</td>
      <td>1.78×</td>
    </tr>
    <tr>
      <td>2048 × 2048</td>
      <td>4</td>
      <td>6.91</td>
      <td>3.88</td>
      <td>1.78×</td>
    </tr>
    <tr>
      <td>2048 × 2048</td>
      <td>8</td>
      <td>3.84</td>
      <td>2.12</td>
      <td>1.81×</td>
    </tr>
  </tbody>
</table>

<hr>

<h2>Strong Scaling Analysis</h2>

<p>
Strong scaling experiments were conducted by fixing the matrix size and
varying the number of OpenMP threads. The results demonstrate diminishing
parallel efficiency at higher thread counts due to memory bandwidth
saturation and shared cache contention.
</p>

<table border="1" cellpadding="8" cellspacing="0">
  <thead>
    <tr>
      <th>Threads</th>
      <th>Execution Time (s)</th>
      <th>Speedup</th>
      <th>Parallel Efficiency</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>7.92</td>
      <td>1.00</td>
      <td>100%</td>
    </tr>
    <tr>
      <td>2</td>
      <td>4.15</td>
      <td>1.91</td>
      <td>95.5%</td>
    </tr>
    <tr>
      <td>4</td>
      <td>2.21</td>
      <td>3.58</td>
      <td>89.5%</td>
    </tr>
    <tr>
      <td>8</td>
      <td>1.36</td>
      <td>5.82</td>
      <td>72.8%</td>
    </tr>
  </tbody>
</table>

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

<p>
<b>Aman Bashir Sheikh</b><br>
GitHub: <a href="https://github.com/amansheikh01">https://github.com/amansheikh01</a>
</p>

</body>
</html>
