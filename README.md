# AlexandriaHRM

[![Build Status](https://img.shields.io/circleci/build/github/samanthaerachelb/AlexandriaHRM/main?logo=circleci&style=flat-square)](https://app.circleci.com/pipelines/github/samanthaerachelb/AlexandriaHRM)&nbsp;
[![Code Quality](https://img.shields.io/codacy/grade/e43cbd23b1804b629d07053d2294d7fc?logo=codacy&style=flat-square)](https://app.codacy.com/gh/samanthaerachelb/AlexandriaHRM/dashboard?branch=main)&nbsp;
[![Maintainability](https://img.shields.io/codeclimate/maintainability-percentage/samanthaerachelb/AlexandriaHRM?logo=codeclimate&style=flat-square)](https://codeclimate.com/github/samanthaerachelb/AlexandriaHRM)
![License](https://img.shields.io/github/license/samanthaerachelb/AlexandriaHRM?style=flat-square)

AlexandriaHRM is a Health Records Management (HRM) library that implements the HL7 Fast Healthcare
Interoperability Resources ([HL7 FHIR][hl7_fhir]) standard for healthcare interoperability in Swift.

AlexandriaHRM is currently being written to support the latest *stable* version of the
FHIR Specification (v4.0.1: R4 - Mixed [Normative][balloting] and [STU][balloting])

## Features

- Native FHIR Support
  - Date/Time parsing, validation, and bi-directional `NSDate` conversion
  - Enforced non-nullability of mandatory parameters
  - Enums for most code systems
  - Enums to support `value[x]` types
  - Date/Time parsing, validation, and bi-directional `NSDate` conversion
  - Swift `Codable` support

### Planned Features

- Implementation of separate targets for `DSTU2`, `STU3`, `R4` and `R5`
versions of the FHIR standard.

Date | Sequence | Version | Description
:--- | :------- | :------ | :----------
2020-08-20 | R5 Sequence | 4.6.0 | FHIR Release #5: Preview #3
2019-10-30 | R4 Sequence | 4.0.1 | FHIR Release #4: First Normative Content
2019-10-24 | STU 3 Sequence | 3.0.2 | FHIR Release 3 (STU) with 2 technical errata
2015-10-24 | DSTU 2 Sequence | 1.0.2 | DSTU 2 (Official version) with 1 technical errata

## Requirements

AlexandriaHRM works with Swift 5.1 and later.

## Installation

[Swift Package Manager][spm] is the recommended way to add AlexandriaHRM to your
project. Just add the following to your `Package.swift` file to add AlexandriaHRM
as a dependency:

```swift
dependencies: [
  .package(url: "https://github.com/samanthaerachelb/AlexandriaHRM.git"
           upToNextMajor(from: "0.1.0"))
]
```

## Usage

Learn how to use AlexandriaHRM in the "How To" section (coming soon™)

## License
This work is licensed under the [Apache 2.0 License][license].

FHIR® is the registered trademark of Health Level 7 (HL7) and is used with the
permission of HL7. Use of the HL7 trademark does not constitute endorsement
of this product by HL7

[hl7_fhir]: https://hl7.org/fhir/
[spm]: https://github.com/apple/swift-package-manager
[license]: https://github.com/samanthaerachelb/AlexandriaHRM/blob/main/license
[balloting]: https://confluence.hl7.org/display/HL7/HL7+Balloting
