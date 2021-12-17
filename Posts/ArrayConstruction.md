# How to make Matrices programmatically

Now that we're squarely dealing with matrices, let's take a minute and summarize some common methods for obtaining matrices.
We like to build matrices programmatically, rather than typing in numbers all the time. If the size of our matrix changes, we don't want to have to write a new code for each new size.

Consider the problem of building an $$ n \times m$$ matrix (or 2-dimensional Numpy array).
We have some popular functions and recipes for popular cases.

## Matlab

Make a matrix of zeros with `zeros(n,m)`. Zeros is often used to obtain a matrix which you will then place entries into. It's a concept called "pre-allocation" and is used to (significantly) improve performance (speed).

```matlab
>> zeros(2,3)

ans =

     0     0     0
     0     0     0

```

Make a matrix of ones with `ones(n,m)`.

```matlab
>> ones(3,2)

ans =

     1     1
     1     1
     1     1
```

Make a matrix with a constant (not zero and not one) values using the `ones` function.

```matlab
>> -pi * ones(3,2)

ans =

   -3.1416   -3.1416
   -3.1416   -3.1416
   -3.1416   -3.1416
```

Build a matrix with a specific value on the diagonal, and zeros elsewhere with `diag`. Place the values you want on the main diagonal as the first argument to `diag`.

```matlab
>> diag(2 * ones(1,4))

ans =

     2     0     0     0
     0     2     0     0
     0     0     2     0
     0     0     0     2
```

We can place values on diagonals above and below the main diagonal by providing a second argument to `diag`. (Note that we pass in a $$n \times n$$ matrix and obtain a $$n+1 \times n +1$$ matrix.)

```matlab
>> diag(2 * ones(1,4), 1)

ans =

     0     2     0     0     0
     0     0     2     0     0
     0     0     0     2     0
     0     0     0     0     2
     0     0     0     0     0
```

For the next few examples, we use the magic square,

```matlab
magic(4)

ans =

    16     2     3    13
     5    11    10     8
     9     7     6    12
     4    14    15     1
```

Obtain a matrix with off diagonal entries of another matrix by calling `diag` twice:

```matlab
>> x = magic(4);  % Use your own matrix here
>> diag(diag(x))

ans =

    16     0     0     0
     0    11     0     0
     0     0     6     0
     0     0     0     1
```

Similarly, we can take a matrix and set the diagonal elements to zero by

```matlab
x = magic(4);  % your matrix here
x - diag(diag(x))

ans =

     0     2     3    13
     5     0    10     8
     9     7     0    12
     4    14    15     0
```

## Python

The [API](https://en.wikipedia.org/wiki/API) in Numpy is heavily inspired by Matlab. As a result, the commands are very similar. The Numpy functions support n-dimensional arrays, so we specify a shape parameter, rather than just 2 arguments as we do in Matlab.

Build an array of zeros with `np.zeros((n,m))`

```python
>>> np.zeros((2,3))
array([[0., 0., 0.],
       [0., 0., 0.]])

```

Make a matrix of ones with `np.ones((n,m))`.

```python
>>> np.ones(3,2)
array([[1., 1.],
       [1., 1.],
       [1., 1.]])
```

Make a matrix with a constant (not zero and not one) values using the `np.ones` function and multiplying by a constant.

```python
>>> np.pi * np.ones((3,2))
array([[3.14159265, 3.14159265],
       [3.14159265, 3.14159265],
       [3.14159265, 3.14159265]])
```

Build a matrix with a specific value on the diagonal, and zeros elsewhere with `np.diag`. Place the values you want on the main diagonal as the first argument to `diag`. Unline Matlab, we need to ensure that the argument to diag is one dimensional (the shape is `(k,)`) and not a flat 2-dimensional array (shape `(k,1,)`).

```python
>>> np.diag(np.ones((4)))
array([[1., 0., 0., 0.],
       [0., 1., 0., 0.],
       [0., 0., 1., 0.],
       [0., 0., 0., 1.]])
```

The extra set of parentheses around `3` is not needed. In matlab, `ones(k)` will give a $$k \times k$$ matrix, it will give a vector of length `k` in python.

```python
>>> np.diag(np.ones(4))
array([[1., 0., 0., 0.],
       [0., 1., 0., 0.],
       [0., 0., 1., 0.],
       [0., 0., 0., 1.]])
```

We can place values on diagonals above and below the main diagonal by providing a second argument to `diag`. (Note that we pass in a $$n \times n$$ matrix and obtain a $$n+1 \times n +1$$ matrix.)

```python
>>> np.diag(2 * np.ones(4), 1)
array([[0., 2., 0., 0., 0.],
       [0., 0., 2., 0., 0.],
       [0., 0., 0., 2., 0.],
       [0., 0., 0., 0., 2.],
       [0., 0., 0., 0., 0.]])
```

For the next few examples, we use the following example matrix

```python
>>> np.arange(4 ** 2).reshape(4,4)
array([[ 0,  1,  2,  3],
       [ 4,  5,  6,  7],
       [ 8,  9, 10, 11],
       [12, 13, 14, 15]])
```

Obtain a matrix with off diagonal entries of another matrix by calling `diag` twice:

```python
>>> x = np.arange(4 ** 2).reshape(4,4)  % Use your own matrix here
>>> diag(diag(x))
array([[ 0,  0,  0,  0],
       [ 0,  5,  0,  0],
       [ 0,  0, 10,  0],
       [ 0,  0,  0, 15]])
```

Similarly, we can take a matrix and set the diagonal elements to zero by

```python
>>> x = np.arange(4 ** 2).reshape(4,4)
>>> x - np.diag(np.diag(x))
array([[ 0,  1,  2,  3],
       [ 4,  0,  6,  7],
       [ 8,  9,  0, 11],
       [12, 13, 14,  0]])
```
