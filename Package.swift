// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "Asclepius",
  platforms: [
    .macOS(.v10_13),
    .iOS(.v15)
  ],
  products: [
    .library(name: "R4", targets: ["R4"]),
    .library(name: "STU3", targets: ["STU3"]),
  ],
  targets: [
    .target(name: "AsclepiusCore"),
    .target(name: "R4", dependencies: ["AsclepiusCore"]),
    .target(name: "STU3", dependencies: ["AsclepiusCore"]),
    .testTarget(name: "AsclepiusCoreTests", dependencies: ["AsclepiusCore"]),
    .testTarget(name: "DateTimeTests", dependencies: ["R4"]),
    .testTarget(name: "PrimitiveTests", dependencies: ["R4"]),
    .testTarget(name: "SequenceTests", dependencies: ["STU3", "R4"])
  ]
)
