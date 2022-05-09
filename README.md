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
- [Functors](Sources/Plinth/Core/Functors.swift): Not true functors as Swift lacks higher-kinded types; really just convenience higher-order functions for shape-preserving operations.
- [Submatrix](Sources/Plinth/Core/Submatrix.swift): Fast submatrix read/write access using Swift subscripts.
- [Wrappers](Sources/Plinth/Core/Wrappers.swift): Wrappers over most of the basic `vDSP` and `vForce` functions.

### Extensions

#### Transformations

- [Center](Sources/Plinth/Extensions/Transformations/Center.swift)
- [Crop](Sources/Plinth/Extensions/Transformations/Crop.swift)
- [Pad](Sources/Plinth/Extensions/Transformations/Pad.swift)
- [Reshape](Sources/Plinth/Extensions/Transformations/Reshape.swift)
- [Shift](Sources/Plinth/Extensions/Transformations/Shift.swift)

#### Mathematics

- [Exponentiation](Sources/Plinth/Extensions/Mathematics/Exponentiation.swift)
- [Powers](Sources/Plinth/Extensions/Mathematics/Powers.swift)

#### Statistics

- [Gaussian](Sources/Plinth/Extensions/Statistics/Gaussian.swift)
- [Interpolation](Sources/Plinth/Extensions/Statistics/Interpolation.swift)
- [Moments](Sources/Plinth/Extensions/Statistics/Moments.swift)
- [Normalization](Sources/Plinth/Extensions/Statistics/Normalization.swift)
- [Random](Sources/Plinth/Extensions/Statistics/Random.swift)

#### Linear Algebra

- [Diagonal](Sources/Plinth/Extensions/Linear%20Algebra/Diagonal.swift)
- [Division](Sources/Plinth/Extensions/Linear%20Algebra/Division.swift)
- [Eigenvalues](Sources/Plinth/Extensions/Linear%20Algebra/Eigenvalues.swift)
- [Identity](Sources/Plinth/Extensions/Linear%20Algebra/Identity.swift)
- [Inversion](Sources/Plinth/Extensions/Linear%20Algebra/Inversion.swift)
- [Multiplication](Sources/Plinth/Extensions/Linear%20Algebra/Multiplication.swift)
- [Products](Sources/Plinth/Extensions/Linear%20Algebra/Products.swift)
- [Roots](Sources/Plinth/Extensions/Linear%20Algebra/Roots.swift)
- [Transposition](Sources/Plinth/Extensions/Linear%20Algebra/Transposition.swift)

#### Signal Processing

- [Correlation](Sources/Plinth/Extensions/Signal%20Processing/Correlation.swift)
- [FFT](Sources/Plinth/Extensions/Signal%20Processing/FFT.swift)
