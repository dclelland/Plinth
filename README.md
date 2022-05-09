# Plinth

Simple matrix types for Swift with helpers for making vDSP operations.

## Todo

- Add documentation on architecture and API to this readme file
- Add wrappers:
    - Convolution with `vDSP.convolve`
    - Complex matrix multiplication with `vDSP_zmmul`
- Add cross correlation functions (see MATLAB `xcorr`, `xcorr2`)
- Add upsampling functions

## Dependencies

- https://github.com/apple/swift-numerics

## References/prior art

- https://github.com/Jounce/Surge
- https://github.com/hollance/Matrix
- https://github.com/stsievert/swix
- https://github.com/cgarciae/NDArray
- https://github.com/apple/swift-numerics/issues/6

## Manifest

### Types

- [Shape](Sources/Plinth/Shape.swift): Defines the shape of a matrix in terms of rows and columns.
- [Matrix](Sources/Plinth/Matrix.swift): Generic matrix struct with `Scalar` type argument and `shape` and `elements` properties.
- [ComplexMatrix](Sources/Plinth/ComplexMatrix.swift) Generic complex matrix struct encapsulating two `real` and `imaginary` matrices.

### Core

- [Arithmetic](Sources/Plinth/Core/Arithmetic.swift): `+` and `-` prefix operators and `+`, `-`, `*`, `/` infix operators implementing fast pointwise arithmetic for all combinations of `Scalar`, `Complex`, `Matrix` and `ComplexMatrix`, where `Scalar` is `Float` or `Double`.
- [Conversions](Sources/Plinth/Core/Conversions.swift): Type conversions between `UInt8`, `UInt16`, `UInt32`, `Int8`, `Int16`, `Int32`, `Float` and `Double`.
- [Functors](Sources/Plinth/Core/Functors.swift): Higher-order functions for shape-preserving operations. Not true functors as Swift lacks higher-kinded types...
- [Submatrix](Sources/Plinth/Core/Submatrix.swift): Fast submatrix read/write access using Swift subscripts.
- [Wrappers](Sources/Plinth/Core/Wrappers.swift): Wrappers over most of the basic `vDSP` and `vForce` functions.

### Extensions

#### Transformations

- [Center](Sources/Plinth/Extensions/Transformations/Center.swift): Find the center point of a matrix, given a rounding rule.
- [Crop](Sources/Plinth/Extensions/Transformations/Crop.swift): Crop a matrix towards the center, given a rounding rule.
- [Pad](Sources/Plinth/Extensions/Transformations/Pad.swift): Zero-pad a matrix away from the center, given a rounding rule.
- [Reshape](Sources/Plinth/Extensions/Transformations/Reshape.swift): Apply a new shape to a matrix, or reshape it as a single row or column.
- [Shift](Sources/Plinth/Extensions/Transformations/Shift.swift): Apply a circular shift to a matrix.

#### Mathematics

- [Powers](Sources/Plinth/Extensions/Mathematics/Powers.swift): `**` infix operator implementing fast pointwise power operations for `Scalar` and `Matrix`. Includes special functions for taking integer powers of matrices, for use when successive application of `vDSP.multiply` will be faster than `vForce.pow` (which is quite an expensive operation).
- [Exponentiation](Sources/Plinth/Extensions/Mathematics/Exponentiation.swift): Complex exponentials.
- [Interpolation](Sources/Plinth/Extensions/Statistics/Interpolation.swift): Linear interpolate values from a given range to/from `0.0...1.0`, similar to C++'s `std::ilerp`.

#### Statistics

- [Random](Sources/Plinth/Extensions/Statistics/Random.swift): Generate matrices populated with random noise.
- [Gaussian](Sources/Plinth/Extensions/Statistics/Gaussian.swift): Generate matrices populated with Gaussian noise (derived from the [comp.lang.c FAQ](http://c-faq.com/lib/gaussian.html)).
- [Moments](Sources/Plinth/Extensions/Statistics/Moments.swift): Calculate central and standardized moments; `variance`, `standardDeviation`, `skewness`, and `kurtosis`.
- [Normalization](Sources/Plinth/Extensions/Statistics/Normalization.swift): Normalize a matrix using either its `minimum()` and `maximum()` values or so that its `mean()` is centered on zero.

#### Linear Algebra

- [Identity](Sources/Plinth/Extensions/Linear%20Algebra/Identity.swift): Generate identity matrices.
- [Diagonal](Sources/Plinth/Extensions/Linear%20Algebra/Diagonal.swift): Generate diagonal matrices.
- [Transposition](Sources/Plinth/Extensions/Linear%20Algebra/Transposition.swift): Transpose a matrix (with Accelerate's `vDSP_mtrans`/`vDSP_mtransD`).
- [Inversion](Sources/Plinth/Extensions/Linear%20Algebra/Inversion.swift): Calculate the inverse of a matrix (with LAPACK's `sgetri_`/`dgetri_`).
- [Multiplication](Sources/Plinth/Extensions/Linear%20Algebra/Multiplication.swift): Matrix multiplication (with Accelerate's `vDSP_mmul`/`vDSP_mmulD`); `<*>` infix operator.
- [Division](Sources/Plinth/Extensions/Linear%20Algebra/Division.swift): Left and right matrix division; `/>` and `</` infix operators.
- [Products](Sources/Plinth/Extensions/Linear%20Algebra/Products.swift): Inner and outer products.
- [Eigenvalues](Sources/Plinth/Extensions/Linear%20Algebra/Eigenvalues.swift): Calculate the eigenvalues of a matrix (with LAPACK's `sgeev_`/`dgeev_`).
- [Roots](Sources/Plinth/Extensions/Linear%20Algebra/Roots.swift): Calculate the roots of a polynomial by taking the eigenvalues of a companion matrix.

#### Signal Processing

- [Correlation](Sources/Plinth/Extensions/Signal%20Processing/Correlation.swift)
- [FFT](Sources/Plinth/Extensions/Signal%20Processing/FFT.swift)
