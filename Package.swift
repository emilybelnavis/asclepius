// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "FHIRKit",
  platforms: [
    .macOS(.v12),
    .iOS(.v15)
  ],
  products: [
    .library(name: "R5", targets: ["R5"]),
    .library(name: "R4", targets: ["R4"]),
    .library(name: "STU3", targets: ["STU3"]),
    .library(name: "DSTU2", targets: ["DSTU2"])
  ],
  targets: [
    .target(name: "FHIRKitCore", dependencies: [], path: "Sources/FHIRKitCore"),
    .target(name: "R5", dependencies: ["FHIRKitCore"], path: "Sources/R5"),
    .target(name: "R4", dependencies: ["FHIRKitCore"], path: "Sources/R4"),
    .target(name: "STU3", dependencies: ["FHIRKitCore"], path: "Sources/STU3"),
    .target(name: "DSTU2", dependencies: ["FHIRKitCore"], path: "Sources/DSTU2"),
    .testTarget(name: "FHIRKitCoreTests", dependencies: ["FHIRKitCore"]),
    .testTarget(name: "DateTimeTests", dependencies: ["R5", "R4", "STU3", "DSTU2"]),
    .testTarget(name: "SequenceTests", dependencies: ["R5", "R4", "STU3", "DSTU2"]),
    .testTarget(name: "PrimitiveTests", dependencies: ["R5", "R4", "STU3", "DSTU2"])
  ]
)
