//
//  AsclepiusBool.swift
//  Asclepius
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
import AsclepiusCore

/**
 A boolean value: true | false
 
 https://hl7.org/fhir/datatypes.html#boolean
 */

public struct AsclepiusBool: AsclepiusPrimitiveType {
  public typealias BooleanLiteralType = Bool
  public var bool: Self.BooleanLiteralType
  
  public init(_ bool: Self.BooleanLiteralType) {
    self.bool = bool
  }
}

// MARK: - ExpressibleByBooleanLiteral
extension AsclepiusBool: ExpressibleByBooleanLiteral {
  public init(booleanLiteral value: Self.BooleanLiteralType) {
    self.bool = value
  }
}

extension AsclepiusPrimitive: ExpressibleByBooleanLiteral where PrimitiveType == AsclepiusBool {
  public typealias BooleanLiteralType = Bool
  public init(booleanLiteral value: Self.BooleanLiteralType) {
    self.init(AsclepiusBool(value))
  }
}

// MARK: - Codable
extension AsclepiusBool: Codable {
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
extension AsclepiusBool: Equatable {
  public static func == (leftSide: AsclepiusBool, rightSide: AsclepiusBool) -> Bool {
    return leftSide.bool == rightSide.bool
  }
  
  public static func == (leftSide: Bool, rightSide: AsclepiusBool) -> Bool {
    return leftSide == rightSide.bool
  }
  
  public static func == (leftSide: AsclepiusBool, rightSide: Bool) -> Bool {
    return leftSide.bool == rightSide
  }
}

// MARK: - Extends Bool

extension Bool {
  public func asPrimitive() -> AsclepiusPrimitive<AsclepiusBool> {
    return AsclepiusPrimitive(AsclepiusBool(self))
  }
}
