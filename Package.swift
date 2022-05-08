// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "AlexandriaHRM",
  platforms: [
    .macOS(.v10_13),
    .iOS(.v15)
  ],
  products: [
    .library(name: "R5", targets: ["R5"]),
    .library(name: "R4", targets: ["R4"]),
    .library(name: "STU3", targets: ["STU3"]),
    .library(name: "DSTU2", targets: ["DSTU2"])
  ],
  targets: [
    .target(name: "AlexandriaHRMCore", dependencies: [], path: "Sources/AlexandriaHRMCore"),
    .target(name: "R5", dependencies: ["AlexandriaHRMCore"], path: "Sources/R5"),
    .target(name: "R4", dependencies: ["AlexandriaHRMCore"], path: "Sources/R4"),
    .target(name: "STU3", dependencies: ["AlexandriaHRMCore"], path: "Sources/STU3"),
    .target(name: "DSTU2", dependencies: ["AlexandriaHRMCore"], path: "Sources/DSTU2"),
    .testTarget(name: "AlexandriaHRMCoreTests", dependencies: ["AlexandriaHRMCore"]),
    .testTarget(name: "DateTimeTests", dependencies: ["DSTU2", "STU3", "R4", "R5"]),
    .testTarget(name: "SequenceTests", dependencies: ["DSTU2", "STU3", "R4", "R5"]),
    .testTarget(name: "PrimitiveTests", dependencies: ["DSTU2", "STU3", "R4", "R5"])
  ]
)
