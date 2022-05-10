//
//  AsclepiusDecimal.swift
//  Asclepius
//  Module: STU3
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation
import AsclepiusCore

/**
 Rational numbers that have a decimal representation. See below about the precision of the number:
 
 The precision of the decimal value has significance:
 - e.g. 0.010 is regarded as different to 0.01, and the original precision should be preserved
 - Implementations SHALL handle decimal values in ways that preserve and respect the precision of the value as
 represented for presentation purposes
 - Implementations are not required to perform calculations with these numbers differently, though they may choose to do
 so (i.e. preserve significance)
 - See implementation comments for XML, JSON and RDF
 - In object code, implementations that might meet this constraint are GMP implementations or equivalents to Java
 BigDecimal that implement arbitrary precision, or a combination of a (64 bit) floating point value with a precision
 field
 - Note that large and/or highly precise values are extremely rare in medicine. One element where highly precise decimals
 may be encountered is the Location coordinates. Irrespective of this, the limits documented in XML Schema apply
 
 http://hl7.org/fhir/datatypes.html#decimal
 */
public struct AsclepiusDecimal: AsclepiusPrimitiveType, ExpressibleByFloatLiteral {
  public typealias FloatLiteralType = Double
  public var decimal: Decimal
  
  public init(_ decimal: Decimal) {
    self.decimal = decimal
  }
  
  // swiftlint:disable compiler_protocol_init
  public init(floatLiteral value: Self.FloatLiteralType) {
    self.decimal = Decimal(floatLiteral: value)
  }
}

// MARK: - Codable
extension AsclepiusDecimal: Codable {
  public init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.singleValueContainer()
    self.decimal = try codingKeyContainer.decode(Decimal.self)
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.singleValueContainer()
    try codingKeyContainer.encode(decimal)
  }
}

// MARK: - Equatable
extension AsclepiusDecimal: Equatable {
  public static func == (leftSide: AsclepiusDecimal, rightSide: AsclepiusDecimal) -> Bool {
    return leftSide.decimal == rightSide.decimal
  }
}

// MARK: - Extends Double
extension Double {
  public func asAsclepiusDecimalPrimitive() -> AsclepiusPrimitive<AsclepiusDecimal> {
    return AsclepiusPrimitive(AsclepiusDecimal(floatLiteral: AsclepiusDecimal.FloatLiteralType(self)))
  }
}
