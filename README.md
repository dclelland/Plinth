# Plinth

Simple matrix types for Swift with helpers for making vDSP operations.

## References

- https://github.com/Jounce/Surge
- https://github.com/hollance/Matrix
- https://github.com/stsievert/swix
- https://github.com/cgarciae/NDArray

## Dependencies

- https://github.com/apple/swift-numerics

## Todo

- Add documentation on architecture and API to this readme file
- Add wrappers:
    - Convolution with `vDSP.convolve`
    - Complex matrix multiplication with `vDSP_zmmul`
- Add cross correlation functions (see MATLAB `xcorr`, `xcorr2`)
- Add upsampling functions

## Manifest

### [Types](Sources/Plinth)

- [Shape](Sources/Plinth/Shape.swift)
- [Matrix](Sources/Plinth/Matrix.swift)
- [ComplexMatrix](Sources/Plinth/ComplexMatrix.swift)

### [Core](Sources/Plinth/Core)

- [Arithmetic](Sources/Plinth/Core/Arithmetic.swift)
- [Conversions](Sources/Plinth/Core/Conversions.swift)
- [Functors](Sources/Plinth/Core/Functors.swift)
- [Submatrix](Sources/Plinth/Core/Submatrix.swift)
- [Wrappers](Sources/Plinth/Core/Wrappers.swift)

### Extensions

#### [Transformations](Sources/Plinth/Extensions/Transformations)

- [Center](Sources/Plinth/Extensions/Transformations/Center.swift)
- [Crop](Sources/Plinth/Extensions/Transformations/Crop.swift)
- [Pad](Sources/Plinth/Extensions/Transformations/Pad.swift)
- [Reshape](Sources/Plinth/Extensions/Transformations/Reshape.swift)
- [Shift](Sources/Plinth/Extensions/Transformations/Shift.swift)

#### [Mathematics](Sources/Plinth/Extensions/Mathematics/Exponentiation)

- [Exponentiation](Sources/Plinth/Extensions/Mathematics/Exponentiation.swift)
- [Powers](Sources/Plinth/Extensions/Mathematics/Powers.swift)

#### [Statistics](Sources/Plinth/Extensions/Statistics)

- [Gaussian](Sources/Plinth/Extensions/Statistics/Gaussian.swift)
- [Interpolation](Sources/Plinth/Extensions/Statistics/Interpolation.swift)
- [Moments](Sources/Plinth/Extensions/Statistics/Moments.swift)
- [Normalization](Sources/Plinth/Extensions/Statistics/Normalization.swift)
- [Random](Sources/Plinth/Extensions/Statistics/Random.swift)

#### [Linear Algebra](Sources/Plinth/Extensions/Linear%20Algebra)

- [Diagonal](Sources/Plinth/Extensions/Linear Algebra/Diagonal.swift)
- [Division](Sources/Plinth/Extensions/Linear Algebra/Division.swift)
- [Eigenvalues](Sources/Plinth/Extensions/Linear Algebra/Eigenvalues.swift)
- [Identity](Sources/Plinth/Extensions/Linear Algebra/Identity.swift)
- [Inversion](Sources/Plinth/Extensions/Linear Algebra/Inversion.swift)
- [Multiplication](Sources/Plinth/Extensions/Linear Algebra/Multiplication.swift)
- [Products](Sources/Plinth/Extensions/Linear Algebra/Products.swift)
- [Roots](Sources/Plinth/Extensions/Linear Algebra/Roots.swift)
- [Transposition](Sources/Plinth/Extensions/Linear Algebra/Transposition.swift)

#### [Signal Processing](Sources/Plinth/Extensions/Signal Processing)

- [Correlation](Sources/Plinth/Extensions/Signal Processing/Correlation.swift)
- [FFT](Sources/Plinth/Extensions/Signal Processing/FFT.swift)
