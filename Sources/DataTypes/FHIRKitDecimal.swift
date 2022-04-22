//
//  FHIRKitDecimal.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

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
public struct FHIRKitDecimal: FHIRKitPrimitiveType, ExpressibleByFloatLiteral {
  public typealias FloatLiteralType = Double
  public var decimal: Decimal
  
  public init(_ decimal: Decimal) {
    self.decimal = decimal
  }
  
  public init(floatLiteral value: Self.FloatLiteralType) {
    self.decimal = Decimal(floatLiteral: value)
  }
}

extension FHIRKitDecimal: Codable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    self.decimal = try container.decode(Decimal.self)
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(decimal)
  }
}

extension FHIRKitDecimal: Equatable {
  public static func ==(l: FHIRKitDecimal, r: FHIRKitDecimal) -> Bool {
    return l.decimal == r.decimal
  }
}

// MARK: -
extension Double {
  public func asFHIRKitDecimalPrimitive() -> FHIRKitPrimitive<FHIRKitDecimal> {
    return FHIRKitPrimitive(FHIRKitDecimal(floatLiteral: FHIRKitDecimal.FloatLiteralType(self)))
  }
}
