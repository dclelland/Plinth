# Plinth

Simple matrix types for Swift with helpers for making vDSP operations.

## References

- https://github.com/Jounce/Surge
- https://github.com/hollance/Matrix
- https://github.com/stsievert/swix
- https://github.com/cgarciae/NDArray

## Todo list

- Implement additional `fmap` methods on `ComplexMatrix` for mapping over split vectors
- Infix functions for `fmap` calls

## Example

```swift
var input: ComplexMatrix<Double> = [[ .one,  .i],
                                    [-.one, -.i]]

var output: ComplexMatrix<Double> = .zeros(size: input.size)

let size = input.size

input.withUnsafeMutableSplitComplexVector { inputVector in
    output.withUnsafeMutableSplitComplexVector { outputVector in
        let log2N = vDSP_Length(log2(Double(size.count)))
        let log2N0 = vDSP_Length(log2(Double(size.columns)))
        let log2N1 = vDSP_Length(log2(Double(size.rows)))
        let setup = vDSP_create_fftsetupD(log2N, FFTRadix(kFFTRadix2))!
        vDSP_fft2d_zopD(setup, &inputVector, 1, 0, &outputVector, 1, 0, log2N0, log2N1, .forward)
        vDSP_destroy_fftsetupD(setup)
    }
}

let magnitudes: Matrix<Double> = output.withUnsafeMutableSplitComplexVector { outputVector in
    var result: Matrix<Double> = .zeros(size: size)
    vDSP.squareMagnitudes(outputVector, result: &result)
    return result
}

print(magnitudes.elements) // [0.0, 0.0, 8.0, 8.0]
```
