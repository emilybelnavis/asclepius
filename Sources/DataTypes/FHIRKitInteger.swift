//
//  FHIRKitInteger.swift
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

/// A signed integer in the range -2,147,483,648..2,147,483,647 (32-bit; for larger values, use `FHIRKitDecimal`)
public struct FHIRKitInteger: FHIRKitPrimitiveType, FHIRKitIntegerRepresentable {
  public typealias IntegerLiteralType = Int32
  public var integer: Self.IntegerLiteralType
  
  public init(_ integer: Self.IntegerLiteralType) {
    self.integer = integer
  }
  
  public init(integerLiteral value: Self.IntegerLiteralType) {
    self.integer = value
  }
}

// MARK: - Codable
extension FHIRKitInteger: Codable {
  public init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.singleValueContainer()
    self.integer = try codingKeyContainer.decode(Self.IntegerLiteralType.self)
  }
 
  public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.singleValueContainer()
    try codingKeyContainer.encode(integer)
  }
}

// MARK: - Extends Int

extension Int {
  public func asFHIRKitIntegerPrimitive() -> FHIRKitPrimitive<FHIRKitInteger> {
    return FHIRKitPrimitive(FHIRKitInteger(FHIRKitInteger.IntegerLiteralType(self)))
  }
}
