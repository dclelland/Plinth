# Plinth

Simple matrix types for Swift with helpers for making vDSP operations.

## References

- https://github.com/Jounce/Surge
- https://github.com/hollance/Matrix
- https://github.com/stsievert/swix
- https://github.com/cgarciae/NDArray

## Todo

- Arithmetic infix operators for `Complex`/`Matrix` operations

## Example

```swift
let input: ComplexMatrix<Double> = [[ .one,  .i],
                                    [-.one, -.i]]

let phase = input.fmap(vDSP.phase)

let frequencies = input.fmap { inputVector in
    let log2N = vDSP_Length(log2(Double(input.shape.count)))
    let log2N0 = vDSP_Length(log2(Double(input.shape.columns)))
    let log2N1 = vDSP_Length(log2(Double(input.shape.rows)))
    let setup = vDSP_create_fftsetupD(log2N, FFTRadix(kFFTRadix2))!
    vDSP_fft2d_zipD(setup, &inputVector, 1, 0, log2N0, log2N1, FFTDirection(kFFTDirection_Forward))
    vDSP_destroy_fftsetupD(setup)
}

print(phase.elements) // [0.0, 1.5707963267948966, 3.141592653589793, -1.5707963267948966]
print(frequencies.elements) // [Complex<Double>(0.0, 0.0), Complex<Double>(0.0, 0.0), Complex<Double>(2.0, 2.0), Complex<Double>(2.0, -2.0)]
```
