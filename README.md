README.md

# HACI SORT

Haci Sort is an esoteric-inspired, highly optimized sorting algorithm invented by ADMGNS.

It was designed to overcome the real-time constraints, asynchronous synchronization
overhead, and negative number limitations of the famous "Sleep Sort" by transforming
time-based delays into purely mathematical subtractive reductions.

## Example

 **Initial case:**
 \[12, 3, 5, 2\], min: 2, result: \[\]

**Step 1:**
 \[10, 1, 3, 0\], min: 1, result: \[2\]

**Step 2:**
 \[9, 0, 2\], min: 2, result: \[2, 3\]

**Step 3:**
 \[7, 0\], min: 7, result: \[2, 3, 5\]

**Step 4:**
 \[0\], min: 0, result: \[2, 3, 5, 12\]

At each step, subtract mininim value from elements and also find new minimum value.
If value is 0 (zero), then drop it and add the related item to new list.

## CORE OPERATING PRINCIPLE

Instead of relying on the operating system's scheduler to let threads "sleep",
Haci Sort simulates the linear flow of time by progressively reducing the values of
the array components in discrete steps.

* **Dynamic Stepping:**
  In every pass, the algorithm identifies the minimum element
  (currentMin) within the remaining dataset.

* **Batch Subtraction:**
  It subtracts this currentMin value from all active elements in a single linear pass.

* **Zero-Drop Elimination:**
  Any element whose value drops to exactly 0 (or below 0 due to negative offset
  alignment) is immediately moved to the final Sorted Array.

* **Active Pruning:**
  Elements that hit zero are dropped instantly and never checked
  again, dynamically shrinking the problem size for subsequent iterations.


## THE REAL-WORLD DENSITY ADVANTAGE

While theoretical worst-case analysis places Haci Sort alongside traditional iterative
sort methods, it exhibits unique performance mechanics on dense datasets within a
bounded range —which represents the vast majority of real- world corporate and
scientific data (e.g., test scores, ages, financial transactions).

* **Pigeonhole Optimization:**
  As the number of elements (N) increases within a fixed data range, the frequency of
  duplicate values scales dramatically.

* **Mass Cleansing:**
  Since Haci Sort drops all identical minimum elements in a single mathematical step,
  thousands of duplicate values are sorted and removed simultaneously.

* **Loop Stabilization:**
  This reduces the total outer loop executions to the number of unique elements (K)
  rather than total elements (N), driving the practical runtime complexity down to
  near-linear time (O(N)).


## COMPLEXITY ANALYSIS

    | Scenario       | Complexity | Description                                                               |
    | -------------- | ---------- | ------------------------------------------------------------------------- |
    | Best Case      | O(N)       | All elements in the array are identical (terminates in exactly one pass). |
    | Practical Case | O(N)       | Massive datasets bounded within a standard domain range.                  |
    | Worst Case     | O(NxK)     | All elements are completely unique (K=N) and mathematically spread apart. |


## LICENSE

This project is licensed under the MIT License - see the LICENSE file for details.

**Copyright (c) 2026 ADMGNS**
