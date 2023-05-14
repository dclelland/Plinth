Pod::Spec.new do |spec|
  spec.name                   = "Plinth"
  spec.version                = "2.4.5"
  spec.summary                = "Hardware-accelerated matrix/numeric programming library for Swift."
  # spec.description            = "Hardware-accelerated matrix/numeric programming library for Swift."
  spec.homepage               = "https://github.com/dclelland/Plinth"
  spec.license                = "MIT"
  spec.author                 = { "Daniel Clelland" => "daniel.clelland@gmail.com" }
  spec.ios.deployment_target  = "14.0"
  spec.osx.deployment_target  = "12.0"
  spec.source                 = { :git => "https://github.com/dclelland/Plinth.git", :tag => "2.4.5" }
  spec.source_files           = "Sources/Plinth/**/*.swift"
  # spec.framework            = "Accelerate"
  # spec.dependency             "swift-numerics", "~> 1.4"
end