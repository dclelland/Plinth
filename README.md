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

### Types

- [Shape](Sources/Plinth/Shape.swift)
- [Matrix](Sources/Plinth/Matrix.swift)
- [ComplexMatrix](Sources/Plinth/ComplexMatrix.swift)
