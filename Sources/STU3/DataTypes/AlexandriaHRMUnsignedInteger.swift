//
//  AsclepiusUnsignedInteger.swift
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
 Any non-negative integer in the range  0 to 2,147,483,647 (31 bits because the positive int is a constraint on
 the signed int in FHIR)
 
 http://hl7.org/fhir/datatypes.html#unsignedInt
 */
public struct AsclepiusUnsignedInteger: AsclepiusPrimitiveType, AsclepiusIntegerRepresentable {
  public typealias IntegerLiteralType = Int32
  
  public var integer: Self.IntegerLiteralType {
    didSet {
      if integer < 0 {
        integer = oldValue
      }
    }
  }
  
  public init(_ integer: Self.IntegerLiteralType) {
    self.integer = max(0, integer)
  }
  
  public init(integerLiteral value: Self.IntegerLiteralType) {
    self.integer = max(0, value)
  }
}

// MARK: Codable
extension AsclepiusUnsignedInteger: Codable {
  public init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.singleValueContainer()
    let integer = try codingKeyContainer.decode(Self.IntegerLiteralType.self)
    
    if integer < 0 {
      throw AsclepiusUnsignedIntegerError.valueIsLessThanZero
    }
    self.integer = integer
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.singleValueContainer()
    try codingKeyContainer.encode(integer)
  }
}

// MARK: - Error Types
public enum AsclepiusUnsignedIntegerError: Error {
  case valueIsLessThanZero
}

// MARK: - Extends Int
extension Int {
  public func asAsclepiusUnsignedIntegerPrimitive() -> AsclepiusPrimitive<AsclepiusUnsignedInteger> {
    return AsclepiusPrimitive(AsclepiusUnsignedInteger(AsclepiusUnsignedInteger.IntegerLiteralType(self)))
  }
}
