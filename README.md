# ECE 2112: Advanced Computer Programming and Algorithms

## Experiment 5: Introduction to MATLAB Programming

**Student Name:** Bendicio, Sedric Lance B.  
**Section:** 2ECE-A  
**Date Submitted:** October 27, 2026  

---

## Table of Contents

1. [Objectives](#i-objectives)
2. [Repository Contents](#ii-repository-contents)
3. [Experiment Overview](#iii-experiment-overview)
4. [Detailed Problem Solutions & Discussion](#iv-detailed-problem-solutions--discussion)
   - [Problem A: Transpose Operations](#problem-a-transpose-operations)
   - [Problem B: Two Methods for a Linear System](#problem-b-two-methods-for-a-linear-system)
5. [Constraints & Compliance Checklist](#v-constraints--compliance-checklist)
6. [How to Run](#vi-how-to-run)

---

## I. Objectives

At the end of this laboratory activity, the student should be able to:

1. Create real and complex matrices in MATLAB.
2. Distinguish transpose from complex-conjugate transpose operations.
3. Express a simultaneous linear system in matrix form.
4. Solve and check a linear system using the inverse method and Cramer's Rule.

---

## II. Repository Contents

* `Bendicio_PA5.m`: Executed MATLAB script containing clearly labeled sections, matrix initializations, matrix transpose comparisons, Cramer's Rule loop, numerical checks, and conceptual comments.
* `README.md`: Comprehensive documentation containing problem breakdowns, methodology, MATLAB code snippets, test outputs, numerical verification, and execution instructions.

---

## III. Experiment Overview

This experiment explores fundamental matrix operations and linear algebra solutions within MATLAB. It examines the operational differences between transpose operators when applied to real versus complex matrices, and implements two classic numerical techniques for solving a 4 × 4 system of simultaneous linear equations (`A*x = b`):

1. **Matrix Inverse Method:** `x = inv(A) * b`
2. **Cramer's Rule:** `x_j = det(A_j) / det(A)`, where `A_j` is `A` with its j-th column replaced by `b`

The accuracy of the computed solutions is validated through matrix determinant verification and Euclidean norm evaluations.

---

## IV. Detailed Problem Solutions & Discussion

### Problem A: Transpose Operations

#### Problem Statement

1. Define the real matrix `R` and complex matrix `Z` exactly as specified:

```text
R = [  5  -2   0   7;
       1   3  -4   2;
       6   0   8  -1 ];

Z = [  2+3i   -1+4i   5-2i;
      -3+1i    6      2+5i ];
```

2. For each matrix, compute and display all three transpose expressions:
   - `transpose(A)`
   - `A'`
   - `A.'`
3. Answer the following analytical questions:
   - **a.** Which operations give identical results for the real matrix `R`?
   - **b.** Which two operations give identical results for the complex matrix `Z`?
   - **c.** What additional operation is performed by the apostrophe operator (`'`) when the matrix contains complex entries?

#### Methods Used

* `transpose(A)`: Computes the standard (non-conjugate) matrix transpose.
* `A'`: Computes the complex-conjugate transpose (Hermitian transpose).
* `A.'`: Computes the array non-conjugate transpose.

#### MATLAB Code Implementation

```matlab
%% Problem A: Transpose Operations
disp('1. Initializations:');
disp('================ Matrix R ================');
R = [ 5  -2   0   7;
      1   3  -4   2;
      6   0   8  -1];

disp('================ Matrix Z ================');
Z = [ 2+3i  -1+4i  5-2i;
     -3+1i   6     2+5i];

disp('2. Compute transpose expressions for Real Matrix R');
disp('--- transpose(R) ---');
disp(transpose(R))

disp('--- R'' ---');
disp(R')

disp('--- R.'' ---');
disp(R.')

disp('3. Compute transpose expressions for Complex Matrix Z');
disp('--- transpose(Z) ---');
disp(transpose(Z))

disp('--- Z'' ---');
disp(Z')

disp('--- Z.'' ---');
disp(Z.')
```

#### Test Cases & Outputs

**Matrix R Results (Real Matrix):**

`transpose(R)`, `R'`, and `R.'` all produce identical output:

```text
R^T = [  5   1   6
        -2   3   0
         0  -4   8
         7   2  -1 ]
```

**Matrix Z Results (Complex Matrix):**

`transpose(Z)` and `Z.'` produce the non-conjugate transpose:

```text
Z.' = [  2+3i   -3+1i
        -1+4i    6
         5-2i    2+5i ]
```

`Z'` produces the complex-conjugate (Hermitian) transpose:

```text
Z' = [  2-3i   -3-1i
       -1-4i    6
        5+2i    2-5i ]
```

#### Conceptual Answers & Discussion
```matlab
%{
=========================================================================
ANSWERS TO QUESTIONS:

a. Which operations give identical results for the real matrix R?
   All three operations: transpose(R), R', and R.', yield identical results 
   for matrix R because all of its elements are real numbers.

b. Which two operations give identical results for the complex matrix Z?
   transpose(Z) and Z.' give identical results, as both perform a standard 
   (non-conjugate) matrix transpose.

c. What additional operation is performed by the apostrophe operator (') 
   when the matrix contains complex entries?
   The apostrophe operator (') computes the complex conjugate of each entry 
   in addition to transposing the matrix, producing the complex-conjugate 
   transpose (Hermitian transpose).
=========================================================================
%}
```

* **Question a (Identical operations for Real Matrix `R`):**  
  All three operations: `transpose(R)`, `R'`, and `R.'` yield identical results for matrix `R` because all of its elements are real numbers.
* **Question b (Identical operations for Complex Matrix `Z`):**  
  `transpose(Z)` and `Z.'` give identical results, as both perform a standard (non-conjugate) matrix transpose.
* **Question c (Behavior of Apostrophe Operator `'` on Complex Matrix):**  
  The apostrophe operator (`'`) computes the complex conjugate of each entry in addition to transposing the matrix, producing the complex-conjugate transpose (Hermitian transpose).

---

### Problem B: Two Methods for a Linear System

#### Problem Statement

Solve the simultaneous system of linear equations:

```text
 2*x1 -   x2 + 3*x3 + 2*x4 = 16
   x1 + 4*x2 - 2*x3 +   x4 = -7
 3*x1 + 2*x2 +   x3 -   x4 =  6
-2*x1 + 3*x2 + 4*x3 + 2*x4 =  7
```

1. Construct the coefficient matrix `A` and right-hand side vector `b`:

```text
A = [  2  -1   3   2        b = [ 16
       1   4  -2   1              -7
       3   2   1  -1               6
      -2   3   4   2 ]             7 ]
```

2. **Method 1 (Inverse Method):** Compute solution vector `x_inv` using `inv(A) * b`.
3. **Method 2 (Cramer's Rule):** Replace one column of `A` at a time with vector `b`, compute determinants, and store results in `x_cramer`.
4. **Numerical Verification:**
   - Display solution vectors `x_inv` and `x_cramer`.
   - Compute and display `det(A)` (must be non-zero).
   - Display error norm `norm(x_inv - x_cramer)` and residual norm `norm(A * x_inv - b)`. Both must evaluate near zero within floating-point precision.

#### Methods Used

* `inv(A)`: Computes the matrix inverse of `A`.
* `det(A)`: Computes the matrix determinant of `A`.
* `zeros(4, 1)`: Pre-allocates memory for solution vector `x_cramer`.
* `for j = 1:4 ... end`: Iterates across columns of `A` to substitute column `j` with vector `b` for the Cramer's Rule calculation `x_j = det(A_j) / det(A)`.
* `norm(v)`: Calculates the Euclidean (2-norm) vector norm for precision checking.

#### MATLAB Code Implementation

```matlab
%% Problem B: Two Methods for a Linear System

A = [ 2  -1   3   2;
      1   4  -2   1;
      3   2   1  -1;
     -2   3   4   2];

b = [16; -7; 6; 7];

disp('1. Display system components');
disp('================ Matrix A ================');
disp(A);

disp('================ Vector b ================');
disp(b);

disp('================ Solution: Inverse Method ================');
disp('2. Method 1: Inverse Method');
x_inv = inv(A) * b;
disp(x_inv);

disp('================ Solution: Cramer''s Rule ================');
disp('3. Method 2: Cramer''s Rule');
det_A = det(A);
x_cramer = zeros(4, 1);

% Loop each column, replacing it with vector b to compute determinants
for j = 1:4
    A_temp = A;          % Create a copy of matrix A
    A_temp(:, j) = b;    % Replace the j-th column with vector b
    x_cramer(j) = det(A_temp) / det_A;
end

disp(x_cramer);

disp('================ Numerical Checks ================');
disp('Determinant of A, det(A) = ');
disp(det_A);

disp('Display norm of difference between both solution vectors');
diff_norm = norm(x_inv - x_cramer);
disp('norm(x_inv - x_cramer) = ');
disp(diff_norm);

disp('Display residual norm');
residual_norm = norm(A * x_inv - b);
disp('norm(A * x_inv - b) = ');
disp(residual_norm);
```

#### Test Cases & Outputs

**Solution Vector Outputs:**

```text
x_inv =       x_cramer =
   2.0000        2.0000
  -1.0000       -1.0000
   3.0000        3.0000
   1.0000        1.0000
```

**Determinant & Numerical Checks:**

| Metric / Parameter | Numerical Output | Required Criterion | Verification Status |
| --- | --- | --- | --- |
| `det(A)` | `280` | `det(A) ~= 0` | Passed |
| `norm(x_inv - x_cramer)` | `7.6919e-16` | Approximately `0` | Passed |
| `norm(A * x_inv - b)` | `4.3512e-15` | Approximately `0` | Passed |

#### Technical Discussion

The non-zero determinant (`det(A) = 280`) confirms that coefficient matrix `A` is invertible (non-singular), guaranteeing a unique solution. Both the Inverse Method (`inv(A) * b`) and Cramer's Rule yield identical integer solutions:

```text
x1 = 2,  x2 = -1,  x3 = 3,  x4 = 1
```

The error norm `norm(x_inv - x_cramer)` is approximately 0, showing consistency between both solution techniques. Additionally, the residual norm `norm(A * x_inv - b)` is approximately 0, confirming that the computed variables solve the simultaneous equation system accurately.

---

## V. Constraints & Compliance Checklist

* [x] **No Computed Typing:** All answers and solutions are dynamically computed using MATLAB functions.
* [x] **No Backslash (`\`) Operator:** Solved strictly using `inv(A)` and Cramer's Rule as instructed.
* [x] **Section Formatting:** `Bendicio_PA5.m` includes clear `%%` section headers and organized `disp()` commands.
* [x] **Non-Zero Determinant Check:** `det(A) = 280`, which is not zero.
* [x] **Norm Checks Validated:** Both difference and residual norms evaluate to approximately zero within double-precision limits.
* [x] **Conceptual Explanations Included:** Transpose behaviors are fully explained in MATLAB comments inside the script.

---

## VI. How to Run

1. **Clone the Repository:**

```bash
git clone https://github.com/moriaean/ECE2112_PA5.git
cd ECE2112_PA5
```

2. **Launch MATLAB:**  
Open MATLAB (R2020a or newer) and set the active working directory to the repository folder.

3. **Execute Script:**  
Run the script directly in the MATLAB Command Window:

```matlab
Bendicio_PA5
```

Or open `Bendicio_PA5.m` in the MATLAB Editor and press **Run** (`F5`).

4. **Review Outputs:**  
Examine the MATLAB Command Window output to inspect the matrix transpositions, solution vectors, determinant value, and numerical norm checks.
