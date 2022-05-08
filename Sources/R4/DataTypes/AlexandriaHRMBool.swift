//
//  AlexandriaHRMBool.swift
//  AlexandriaHRM
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
import AlexandriaHRMCore

/**
 A boolean value: true | false
 
 https://hl7.org/fhir/datatypes.html#boolean
 */

public struct AlexandriaHRMBool: AlexandriaHRMPrimitiveType {
  public typealias BooleanLiteralType = Bool
  public var bool: Self.BooleanLiteralType
  
  public init(_ bool: Self.BooleanLiteralType) {
    self.bool = bool
  }
}

// MARK: - ExpressibleByBooleanLiteral
extension AlexandriaHRMBool: ExpressibleByBooleanLiteral {
  public init(booleanLiteral value: Self.BooleanLiteralType) {
    self.bool = value
  }
}

extension AlexandriaHRMPrimitive: ExpressibleByBooleanLiteral where PrimitiveType == AlexandriaHRMBool {
  public typealias BooleanLiteralType = Bool
  public init(booleanLiteral value: Self.BooleanLiteralType) {
    self.init(AlexandriaHRMBool(value))
  }
}

// MARK: - Codable
extension AlexandriaHRMBool: Codable {
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
extension AlexandriaHRMBool: Equatable {
  public static func == (leftSide: AlexandriaHRMBool, rightSide: AlexandriaHRMBool) -> Bool {
    return leftSide.bool == rightSide.bool
  }
  
  public static func == (leftSide: Bool, rightSide: AlexandriaHRMBool) -> Bool {
    return leftSide == rightSide.bool
  }
  
  public static func == (leftSide: AlexandriaHRMBool, rightSide: Bool) -> Bool {
    return leftSide.bool == rightSide
  }
}

// MARK: - Extends Bool

extension Bool {
  public func asPrimitive() -> AlexandriaHRMPrimitive<AlexandriaHRMBool> {
    return AlexandriaHRMPrimitive(AlexandriaHRMBool(self))
  }
}
