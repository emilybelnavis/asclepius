//
//  FHIRKitBool.swift
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

/**
 A boolean value: true | false
 
 https://hl7.org/fhir/datatypes.html#boolean
 */

public struct FHIRKitBool: FHIRKitPrimitiveType {
  public typealias BooleanLiteralType = Bool
  public var bool: Self.BooleanLiteralType
  
  public init(_ bool: Self.BooleanLiteralType) {
    self.bool = bool
  }
}

// MARK: - ExpressibleByBooleanLiteral
extension FHIRKitBool: ExpressibleByBooleanLiteral {
  public init(booleanLiteral value: Self.BooleanLiteralType) {
    self.bool = value
  }
}

extension FHIRKitPrimitive: ExpressibleByBooleanLiteral where PrimitiveType == FHIRKitBool {
  public typealias BooleanLiteralType = Bool
  public init(booleanLiteral value: Self.BooleanLiteralType) {
    self.init(FHIRKitBool(value))
  }
}

// MARK: - Codable
extension FHIRKitBool: Codable {
  public init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.singleValueContainer()
    self.bool = try codingKeyContainer.decode(Self.BooleanLiteralType.self)
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.singleValueContainer()
    try codingKeyContainer.encode(bool)
  }
}

// MARK: - Equatable
extension FHIRKitBool: Equatable {
  public static func == (leftSide: FHIRKitBool, rightSide: FHIRKitBool) -> Bool {
    return leftSide.bool == rightSide.bool
  }
  
  public static func == (leftSide: Bool, rightSide: FHIRKitBool) -> Bool {
    return leftSide == rightSide.bool
  }
  
  public static func == (leftSide: FHIRKitBool, rightSide: Bool) -> Bool {
    return leftSide.bool == rightSide
  }
}

// MARK: - Extends Bool

extension Bool {
  public func asPrimitive() -> FHIRKitPrimitive<FHIRKitBool> {
    return FHIRKitPrimitive(FHIRKitBool(self))
  }
}
