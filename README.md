# Plinth

Hardware-accelerated matrix/numeric programming library for Swift.

```swift
let frumb: Matrix<Double> = .random(shape: .square(length: 4), in: -1.0...1.0)
let brumf = frumb <*> frumb.transposed()
```

Plinth's philosophy is to do "the simplest thing that works". For example, many of the arithmetic/numeric functions are implemented twice – for both `Matrix<Float>` and `Matrix<Double>`. Instead of managing this through a morass of typeclasses, we just copy and paste the implementation and change the type argument.

## Installation

### Swift Package Manager

Simply add Plinth to your `Package.swift` file: 

```swift
let package = Package(
    name: "Example",
    dependencies: [
        .package(url: "https://github.com/dclelland/Plinth.git", from: "2.0.0"),
    ],
    targets: [
        .target(name: "Example", dependencies: ["Plinth"])
    ]
)
```

Then import Plinth into your Swift files:

```swift
import Plinth
```

Or for full [`ComplexMatrix`](#complexmatrix) support you should also import [`swift-numerics`](https://github.com/apple/swift-numerics), as that's where the [`Complex`](https://github.com/apple/swift-numerics/blob/main/Sources/ComplexModule/Complex.swift) type lives. 

```swift
import Plinth
import Numerics
```

## Links

### Dependencies

- [apple/swift-numerics](https://github.com/apple/swift-numerics)

### References/prior art

- https://github.com/apple/swift-numerics/issues/6 (discussion on adding a `ShapedArray` type to `swift-numerics`)
- [Jounce/Surge](https://github.com/Jounce/Surge)
- [hollance/Matrix](https://github.com/hollance/Matrix)
- [stsievert/swix](https://github.com/stsievert/swix)
- [cgarciae/NDArray](https://github.com/cgarciae/NDArray)

## Todo

- [x] Implement Equality/Comparisons extension
- [x] Implement both `.zeros` and `.ones` initializers
- [x] Implement exception handling for LAPACK calls
- [ ] Implement wrappers for `vDSP.fill`, `vDSP.clear`, `vDSP.window`, `vDSP.ramp`, `vDSP.stereoRamp`
- [x] Implement wrapper for `vDSP.convolve`
- [ ] Implement API for specifying seeds for LAPACK random number generator calls.
    - Note the LAPACK specifications: "ISEED is INTEGER array, dimension (4). On entry, the seed of the random number generator; the array elements must be between 0 and 4095, and ISEED(4) must be odd."
- [x] Revisit `Eigendecomposition.sorted`, is sorting the eigenvalues by real component or the magnitude preferable?
- [ ] Write notes on architecture and API design
- [ ] Write code examples
- [ ] ~~Add Cocoapods support~~ Can't do this, `swift-numerics` only supports SPM. Perhaps I should make my own `Complex` type.

# Documentation

## Types

### [Shape](Sources/Plinth/Shape.swift)

Defines the shape of a matrix using `rows` and `columns` properties.

```swift
public struct Shape {
    
    public let rows: Int
    public let columns: Int
    
}
```

This includes a number of convenience properties like `count`, `length` and `breadth`; as well as convenience initializers `.row(length:)`, `.column(length:)` and `.square(length:)`. 

### [Matrix](Sources/Plinth/Matrix.swift)

Generic matrix struct with `Scalar` type argument and `shape` and `elements` properties. Elements are stored as a single array in row-major format.

```swift
public struct Matrix<Scalar> {
    
    public let shape: Shape
    public var elements: [Scalar]
    
}
```

This also includes a large number of convenience initializers and implementations of typical typeclasses such as `Codable` and `ExpressibleByArrayLiteral`.

The `elements` property is directly mutable but this is ideally to be avoided; matrix regularity is not enforced, except during encoding to or decoding from a serialization format.

There is a computed property `state` which can be used to check if the matrix is considered to be malformed:

```swift
let malformed = Matrix<Double>(
    shape: .init(rows: 2, columns: 2),
    elements: [1.0, 2.0, 3.0, 4.0, 5.0]
)

print(malformed.state)
```

```
> Malformed: Mismatched shape and elements; 2×2 != 5
```

### [ComplexMatrix](Sources/Plinth/ComplexMatrix.swift)

Generic complex matrix struct encapsulating two separate matrices for the `real` and `imaginary` parts.

```swift
public struct ComplexMatrix<Scalar> where Scalar: Real {
    
    public var real: Matrix<Scalar>
    public var imaginary: Matrix<Scalar>
    
}
```

This also includes a large number of convenience initializers and implementations of typical typeclasses such as `Codable` and `ExpressibleByArrayLiteral`.

The `real` and `imaginary` properties are also directly mutable; `ComplexMatrix` has its own `state` property which can be used to check if the parts are mismatched or malformed.

## Core

### [Arithmetic](Sources/Plinth/Core/Arithmetic.swift)

`+` and `-` prefix operators and `+`, `-`, `*`, `/` infix operators.

Implements fast pointwise arithmetic for combinations of `Scalar`, `Complex<Scalar>`, `Matrix<Scalar>` and `ComplexMatrix<Scalar>`, where `Scalar` is `Float` or `Double`.

### [Conversions](Sources/Plinth/Core/Conversions.swift)

Fast type conversions between the integer types `UInt8`, `UInt16`, `UInt32`, `Int8`, `Int16`, `Int32` and the floating point types `Float` and `Double`.

### [Functors](Sources/Plinth/Core/Functors.swift)

Higher-order functions for shape-preserving operations on a matrix's elements.

Includes support for complex matrix operations on [`DSPSplitComplex`](https://developer.apple.com/documentation/accelerate/dspsplitcomplex)/[`DSPDoubleSplitComplex`](https://developer.apple.com/documentation/accelerate/dspdoublesplitcomplex).

> Disclaimer: These are not true functors, Swift lacks higher-kinded types...

### [Submatrix](Sources/Plinth/Core/Submatrix.swift)

Fast submatrix read/write access using a Swift subscript interface.

> Uses Accelerate's [`vDSP_mmov`](https://developer.apple.com/documentation/accelerate/1449950-vdsp_mmov)/[`vDSP_mmovD`](https://developer.apple.com/documentation/accelerate/1449956-vdsp_mmovd).

### [Wrappers](Sources/Plinth/Core/Wrappers.swift)

Wrappers over most of the basic `vDSP` and `vForce` functions in Accelerate.

## Transformations

### [Center](Sources/Plinth/Extensions/Transformations/Center.swift)

Find the center point of a matrix, given a rounding rule.

### [Crop](Sources/Plinth/Extensions/Transformations/Crop.swift)

Crop a matrix towards the center, given a rounding rule.

### [Pad](Sources/Plinth/Extensions/Transformations/Pad.swift)

Zero-pad a matrix away from the center, given a rounding rule.

### [Reshape](Sources/Plinth/Extensions/Transformations/Reshape.swift)

Apply a new shape to a matrix, or reshape it as a single row or column.

This also supports both `.rowMajor` and `.columnMajor` orderings.

### [Shift](Sources/Plinth/Extensions/Transformations/Shift.swift)

Apply a circular shift to a matrix.

### [Concatenate](Sources/Plinth/Extensions/Transformations/Concatenate.swift)

Concatentate multiple matrices together, row-wise or column-wise.

## Mathematics

### [Comparisons](Sources/Plinth/Extensions/Mathematics/Comparisons.swift)

`<`, `<=`, `>`, `>=`, `==`, `!==` infix operators.

Pointwise comparison or equality checks, returning `0.0` for `false` and `1.0` for `true`.

### [Interpolation](Sources/Plinth/Extensions/Mathematics/Interpolation.swift)

Linear interpolate values from a given range to/from `0.0...1.0`.

> This is similar to C++'s [`std::lerp`](https://en.cppreference.com/w/cpp/numeric/lerp).

### [Powers](Sources/Plinth/Extensions/Mathematics/Powers.swift)

`**` infix operator.

Implements fast pointwise power operations for `Scalar` and `Matrix`.

Includes special functions for taking integer powers of matrices, for use when recursive application of `vDSP.multiply` will be faster than `vForce.pow` (which is quite an expensive operation).

This also supports negative integers by applying `vForce.reciprocal` to the result.

### [Ramps](Sources/Plinth/Extensions/Mathematics/Ramps.swift)

Generate matrices which ramp from the start to end of a range of values, along cartesian or polar coordinates.

## Statistics

### [Random](Sources/Plinth/Extensions/Statistics/Random.swift)

Generate matrices populated with random noise using the Swift random number generators or LAPACK functions for faster generation within set distributions.

> Uses LAPACK's [`slarnv_`](https://www.netlib.org/lapack/explore-html/d5/dd2/group__larnv_ga46eb9295314bab79acf8821078c29d18.html)/[`dlarnv_`](https://www.netlib.org/lapack/explore-html/d5/dd2/group__larnv_ga768743496c909a18850020a8ce0382b4.html) for real matrices and [`clarnv_`](https://www.netlib.org/lapack/explore-html/d5/dd2/group__larnv_ga72a1ed9b1c8b1417e5d20234c3b7683d.html)/[`zlarnv_`](https://www.netlib.org/lapack/explore-html/d5/dd2/group__larnv_ga6c82846cc4856910b261619be101560c.html) for complex matrices.

### [Gaussian](Sources/Plinth/Extensions/Statistics/Gaussian.swift)

Generate matrices populated with Gaussian noise using the Swift random number generators.

> This is derived from an answer on the [comp.lang.c FAQ](http://c-faq.com/lib/gaussian.html).

### [Moments](Sources/Plinth/Extensions/Statistics/Moments.swift)

Calculate central and standardized moments; convenience methods for `variance`, `standardDeviation`, `skewness`, and `kurtosis`.

### [Normalization](Sources/Plinth/Extensions/Statistics/Normalization.swift)

Normalize a matrix to `0.0...1.0` using its `minimum()` and `maximum()` values; or shift it so that its `mean()` is centered on zero.

## Linear Algebra

### [Zeros](Sources/Plinth/Extensions/Linear%20Algebra/Zeros.swift)

Generate matrices populated by zeros.

### [Ones](Sources/Plinth/Extensions/Linear%20Algebra/Ones.swift)

Generate matrices populated by ones.

### [Identity](Sources/Plinth/Extensions/Linear%20Algebra/Identity.swift)

Generate identity matrices.

### [Diagonal](Sources/Plinth/Extensions/Linear%20Algebra/Diagonal.swift)

Generate diagonal matrices.

### [Transposition](Sources/Plinth/Extensions/Linear%20Algebra/Transposition.swift)

Transpose a matrix.

> Uses Accelerate's [`vDSP_mtrans`](https://developer.apple.com/documentation/accelerate/1449988-vdsp_mtrans)/[`vDSP_mtransD`](https://developer.apple.com/documentation/accelerate/1450422-vdsp_mtransd).

### [Inversion](Sources/Plinth/Extensions/Linear%20Algebra/Inversion.swift)

Calculate the inverse of a matrix.

> Uses LAPACK's [`sgetri_`](http://www.netlib.org/lapack/explore-html/d8/ddc/group__real_g_ecomputational_ga1af62182327d0be67b1717db399d7d83.html)/[`dgetri_`](http://www.netlib.org/lapack/explore-html/dd/d9a/group__double_g_ecomputational_ga56d9c860ce4ce42ded7f914fdb0683ff.html) for real matrices and [`cgetri_`](http://www.netlib.org/lapack/explore-html/d4/d7e/group__complex_g_ecomputational_gae22ce12a3734b080ad8369ebf7e9c3a7.html)/[`zgetri_`](http://www.netlib.org/lapack/explore-html/d3/d01/group__complex16_g_ecomputational_gab490cfc4b92edec5345479f19a9a72ca.html) for complex matrices.

### [Multiplication](Sources/Plinth/Extensions/Linear%20Algebra/Multiplication.swift)

`<*>` infix operator.

Implements matrix multiplication.

> Uses Accelerate's [`vDSP_mmul`](https://developer.apple.com/documentation/accelerate/1449984-vdsp_mmul)/[`vDSP_mmulD`](https://developer.apple.com/documentation/accelerate/1450386-vdsp_mmuld) for real matrices and [`vDSP_zmmul`](https://developer.apple.com/documentation/accelerate/1449712-vdsp_zmmul)/[`vDSP_zmmulD`](https://developer.apple.com/documentation/accelerate/1450796-vdsp_zmmuld) for complex matrices.

### [Division](Sources/Plinth/Extensions/Linear%20Algebra/Division.swift)

`/>` and `</` infix operators.

Implements left and right matrix division (multiplying by the inverse of a matrix). 

### [Square Root](Sources/Plinth/Extensions/Mathematics/SquareRoot.swift)

Complex square roots.

> Formula taken from MATLAB's [`sqrt`](https://www.mathworks.com/help/matlab/ref/sqrt.html) function.

### [Exponentiation](Sources/Plinth/Extensions/Mathematics/Exponentiation.swift)

Complex exponentials.

> Formula taken from MATLAB's [`exp`](https://www.mathworks.com/help/matlab/ref/exp.html) function.

### [Products](Sources/Plinth/Extensions/Linear%20Algebra/Products.swift)

Inner and outer products.

### [Eigendecomposition](Sources/Plinth/Extensions/Linear%20Algebra/Eigendecomposition.swift)

Calculate the eigendecomposition of a matrix. Includes support for only calculating the necessary components. Also includes support for sorting the eigenvectors by properties of the eigenvalues.

> Uses LAPACK's [`sgeev_`](http://www.netlib.org/lapack/explore-html/d3/dfb/group__real_g_eeigen_ga104525b749278774f7b7f57195aa6798.html)/[`dgeev_`](http://www.netlib.org/lapack/explore-html/d9/d8e/group__double_g_eeigen_ga66e19253344358f5dee1e60502b9e96f.html).
> Swift implementation cribbed from [Surge](https://github.com/Jounce/Surge/blob/master/Sources/Surge/Linear%20Algebra/Matrix.swift#L944).

### [Roots](Sources/Plinth/Extensions/Linear%20Algebra/Roots.swift)

Calculate the roots of a polynomial by taking the eigenvalues of a companion matrix.

## Image Processing

### [Bitmaps](Sources/Plinth/Extensions/Image%20Processing/Bitmaps.swift)

Conversion to and from floating point formats in the range `0.0...1.0` to 8-bit bitmaps in the range `0...255`.

### [Images](Sources/Plinth/Extensions/Image%20Processing/Images.swift)

Conversion to and from `vImage.PixelBuffer`, `CGImage`, `CIImage`, `NSImage`, and `UIImage`.

## Signal Processing

### [FFT](Sources/Plinth/Extensions/Signal%20Processing/FFT.swift)

Forward and inverse two-dimensional fourier transforms.

Includes support for creating, reusing, and destroying your own [`FFTSetup`](https://developer.apple.com/documentation/accelerate/fftsetup)/[`FFTSetupD`](https://developer.apple.com/documentation/accelerate/fftsetupd) structure.

Some of the inverse fourier transform methods implement energy conservation by dividing by the size of the matrix.

> Uses Accelerate's [`vDSP_fft2d_zip`](https://developer.apple.com/documentation/accelerate/1450430-vdsp_fft2d_zip)/[`vDSP_fft2d_zipD`](https://developer.apple.com/documentation/accelerate/1450508-vdsp_fft2d_zipd).

### [FFTShift](Sources/Plinth/Extensions/Signal%20Processing/FFTShift.swift)

Apply a circular rotation to a frequency-domain matrix so that the DC/DC signal is at the top left of the lower right quadrant.

### [FFTRamp](Sources/Plinth/Extensions/Signal%20Processing/FFTRamp.swift)

Generate ramps aligned to the 2D FFT layout, for use when masking 2D FFT signals.

### [Autocorrelation](Sources/Plinth/Extensions/Signal%20Processing/Autocorrelation.swift)

Calculate the autocorrelation of a matrix by taking the product of the spectrum with its complex conjugate or magnitudes.

### [Autoconvolution](Sources/Plinth/Extensions/Signal%20Processing/Autoconvolution.swift)

Calculate the autoconvolution of a matrix by taking the square of the spectrum or its magnitudes.

### [Convolution](Sources/Plinth/Extensions/Signal%20Processing/Convolution.swift)

Calculate convolutions using 3x3, 5x5 and image kernels.
