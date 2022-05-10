//
//  AsclepiusInteger.swift
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

/// A signed integer in the range -2,147,483,648..2,147,483,647 (32-bit; for larger values, use `AsclepiusDecimal`)
public struct AsclepiusInteger: AsclepiusPrimitiveType, AsclepiusIntegerRepresentable {
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
extension AsclepiusInteger: Codable {
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
  public func asAsclepiusIntegerPrimitive() -> AsclepiusPrimitive<AsclepiusInteger> {
    return AsclepiusPrimitive(AsclepiusInteger(AsclepiusInteger.IntegerLiteralType(self)))
  }
}
