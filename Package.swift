// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "AlexandriaHRM",
  platforms: [
    .macOS(.v10_13),
    .iOS(.v15)
  ],
  products: [
    .library(name: "R4", targets: ["R4"]),
    .library(name: "STU3", targets: ["STU3"]),
  ],
  targets: [
    .target(name: "AlexandriaHRMCore"),
    .target(name: "R4", dependencies: ["AlexandriaHRMCore"]),
    .target(name: "STU3", dependencies: ["AlexandriaHRMCore"]),
    .testTarget(name: "AlexandriaHRMCoreTests", dependencies: ["AlexandriaHRMCore"]),
    .testTarget(name: "DateTimeTests", dependencies: ["R4"]),
    .testTarget(name: "PrimitiveTests", dependencies: ["R4"]),
    .testTarget(name: "SequenceTests", dependencies: ["STU3", "R4"])
  ]
)
