//
//  FHIRKitPositiveInteger.swift
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

public struct FHIRKitPositiveInteger: FHIRKitPrimitiveType, FHIRKitIntegerRepresentable {
  public typealias IntegerLiteralType = Int32
  
  public var integer: Self.IntegerLiteralType {
    didSet {
      if integer < 1 {
        integer = oldValue
      }
    }
  }
    
  public init(_ integer: Self.IntegerLiteralType) {
    self.integer = max(1, integer)
  }
  
  public init(integerLiteral value: Self.IntegerLiteralType) {
    self.integer = max(1, value)
  }
}

extension FHIRKitPositiveInteger: Codable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let integer = try container.decode(Self.IntegerLiteralType.self)
    if integer < 1 {
      throw FHIRKitPositiveIntegerError.valueIsLessThanOne
    }
    self.integer = integer
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(integer)
  }
}

// MARK: -

public enum FHIRKitPositiveIntegerError: Error {
  case valueIsLessThanOne
}

// MARK: -

extension Int {
  public func asFHIRKitPositiveIntegerPrimitive() -> FHIRKitPrimitive<FHIRKitPositiveInteger> {
    return FHIRKitPrimitive(FHIRKitPositiveInteger(FHIRKitPositiveInteger.IntegerLiteralType(self)))
  }
}
