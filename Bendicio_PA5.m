%% ECE 2112: Advanced Computer Programming and Algorithms
%Name: Sedric Lance B. Bendicio
%Section: 2ECE-A
%Date Submitted: 10/27/2026

%EXPERIMENT 5: INTRODUCTION TO MATLAB PROGRAMMING
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
disp('Compute solution using inv(A)');
x_inv = inv(A) * b;
disp(x_inv);

disp('================ Solution: Cramer''s Rule ================');
disp('3. Method 2: Cramer''s Rule');
det_A = det(A);
x_cramer = zeros(4, 1);

% loop each column, replacing it with vector b to compute determinants
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