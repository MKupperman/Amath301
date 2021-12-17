# Compound Operators

You may have seen a `+=` floaitng around in code. That's a compound operator!

The modern use of `+=` comes originally from C, pretty much every language other than Matlab  (C, C++, Go, Python, Ruby, Java, R, Julia, etc). Both Matlab and Python do not support increment/decrement operators `++` and `--` which you may see in lower level compiled languages.

Historically, there are 3 popular ways to increment a variable. These are mostly seen in lower level languages, where you need to do lots of arithmetic with indexes (e.g. if you had to write your own matrix multiplication/operation codes).

## The big three increment operations

"The big three" options to add one to a variable in programming:

* `x = x + 1` "direct method"  (every language)
* `x+=1` compound operator (Python, not in Matlab)
* `x++` increment operator (low level languages only)

All take `x` and add `1` to it. At a super low level (closer to the electrons moving around the CPU through logic gates part of computing than writing your Matlab/Python code), these are implemented with different CPU instructions (thus one may be faster than the other 2 for specific things), even though they do all give the same high level result.

We really don't have to worry about any of this when we're writing Python or Matlab code, but if we go chasing speed to a lower level languages, we get more things to optimize/worry about.

## Python supports four compound operators

Python supports four compound operators:

* `+=` Addition
* `-=` Subtraction
* `*=` Multiplication
* `/=` Division

The similar looking `!=` (Python) or `~=` (Matlab) are logical comparison not equals to operators.
