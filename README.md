# QRIMatrix

Hardware-accelerated matrix library for Swift

## Developer documentation

- https://developer.apple.com/documentation/accelerate/vdsp
- https://developer.apple.com/documentation/accelerate/vdsp-snv
- https://developer.apple.com/documentation/accelerate/veclib/vforce

## References

- https://github.com/Jounce/Surge
- https://github.com/hollance/Matrix
- https://github.com/stsievert/swix
- https://github.com/cgarciae/NDArray

## Todo

- vImage <-> Matrix helpers with debug Quick Look support
    - https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/CustomClassDisplay_in_QuickLook/CH01-quick_look_for_custom_objects/CH01-quick_look_for_custom_objects.html#//apple_ref/doc/uid/TP40014001-CH2-SW2
- Implement `Functor` typeclass for combining with vDSP operations
    - Inlinable infix functions
- Add vDSP arithmetic helpers...?
    - Also to complex numbers?
- Put vDSP functions somewhere sensible
