//
//  FHIRKitPositiveInteger.swift
//  FHIRKit
//  Module: R4
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
import FHIRKitCore

/// Any positive integer in the range 1..2,147,483,647
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

// MARK: - Codable
extension FHIRKitPositiveInteger: Codable {
  public init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.singleValueContainer()
    let integer = try codingKeyContainer.decode(Self.IntegerLiteralType.self)
    if integer < 1 {
      throw FHIRKitPositiveIntegerError.valueIsLessThanOne
    }
    self.integer = integer
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.singleValueContainer()
    try codingKeyContainer.encode(integer)
  }
}

// MARK: - Error Types

public enum FHIRKitPositiveIntegerError: Error {
  case valueIsLessThanOne
}

// MARK: - Extend Int

extension Int {
  public func asFHIRKitPositiveIntegerPrimitive() -> FHIRKitPrimitive<FHIRKitPositiveInteger> {
    return FHIRKitPrimitive(FHIRKitPositiveInteger(FHIRKitPositiveInteger.IntegerLiteralType(self)))
  }
}
