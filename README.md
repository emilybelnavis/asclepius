# Asclepius

[![Build Status](https://img.shields.io/circleci/build/github/samanthaerachelb/asclepius/main?logo=circleci&style=flat-square)](https://app.circleci.com/pipelines/github/samanthaerachelb/asclepius)&nbsp;
[![Code Quality](https://img.shields.io/codacy/grade/e43cbd23b1804b629d07053d2294d7fc?logo=codacy&style=flat-square)](https://app.codacy.com/gh/samanthaerachelb/asclepius/dashboard?branch=main)&nbsp;
[![Maintainability](https://img.shields.io/codeclimate/maintainability-percentage/samanthaerachelb/asclepius?logo=codeclimate&style=flat-square)](https://codeclimate.com/github/samanthaerachelb/asclepius)
![License](https://img.shields.io/github/license/samanthaerachelb/asclepius?style=flat-square)

Asclepius is a library that implements the HL7 Fast Healthcare Interoperability
Resources ([HL7 FHIR][hl7_fhir]) standard in Swift.

Asclepius is currently being written to support the latest *stable* version of
the FHIR Specification (v4.0.1: R4 - Mixed [Normative][balloting] and
[STU][balloting])

## Features

- Native FHIR Support
  - Date/Time parsing, validation, and bi-directional `NSDate` conversion
  - Enforced non-nullability of mandatory parameters
  - Enums for most code systems
  - Enums to support `value[x]` types
  - Date/Time parsing, validation, and bi-directional `NSDate` conversion
  - Swift `Codable` support

### Planned Features

- Implementation of separate targets for `STU3` and `R4`
versions of the FHIR standard.

Date | Sequence | Version | Description
:--- | :------- | :------ | :----------
2019-10-30 | R4 Sequence | 4.0.1 | FHIR Release #4: First Normative Content
2019-10-24 | STU 3 Sequence | 3.0.2 | FHIR Release 3 (STU) with 2 technical errata

## Requirements

Asclepius works with Swift 5.2 and later.

## Installation

[Swift Package Manager][spm] is the recommended way to add Asclepius to your
project. Just add the following to your `Package.swift` file to add AlexandriaHRM
as a dependency:

```swift
dependencies: [
  .package(url: "https://github.com/samanthaerachelb/Asclepius.git"
           upToNextMajor(from: "0.1.0"))
]
```

## Usage

Learn how to use Asclepius in the "How To" section (coming soon™)

## License
This work is licensed under the [Apache 2.0 License][license].

FHIR® is the registered trademark of Health Level 7 (HL7) and is used with the
permission of HL7. Use of the HL7 trademark does not constitute endorsement
of this product by HL7

[hl7_fhir]: https://hl7.org/fhir/
[spm]: https://github.com/apple/swift-package-manager
[license]: https://github.com/samanthaerachelb/Asclepius/blob/main/license
[balloting]: https://confluence.hl7.org/display/HL7/HL7+Balloting
