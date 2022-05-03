//
//  FHIRKitString.swift
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

/**
 Class to represent FHIR primitives representing "string", "code", "id", "markdown" and "xhtml", officially:
 
 A sequence of Unicode characters
 
 Note that strings SHALL NOT exceed 1MB (1024*1024 characters) in size. Strings SHOULD not contain Unicode character
 points below 32, except for u0009 (horizontal tab), u0010 (carriage return) and u0013 (line feed). Leading and Trailing
 whitespace is allowed, but SHOULD be removed when using the XML format. Note: This means that a string that consists
 only of whitespace could be trimmed to nothing, which would be treated as an invalid element value. Therefore strings
 SHOULD always contain non-whitespace content
 
 http://hl7.org/fhir/datatypes.html#string
 http://hl7.org/fhir/datatypes.html#code
 
 For `id`: Any combination of upper- or lower-case ASCII letters ('A'..'Z', and 'a'..'z', numerals ('0'..'9'), '-' and
 '.', with a length limit of 64 characters. (This might be an integer, an un-prefixed OID, UUID or any other identifier
 pattern that meets these constraints.).
 
 Regex: [A-Za-z0-9\-\.]{1,64}
 
 http://hl7.org/fhir/datatypes.html#id
 
 For `markdown`: A FHIR string that may contain markdown syntax for optional processing by a markdown presentation
 engine, in the GFM extension of CommonMark format.
 
 http://hl7.org/fhir/datatypes.html#markdown
 */
public struct FHIRKitString: FHIRKitPrimitiveType {
  public var string: String
  
  public init(_ string: String) {
    self.string = string
  }
}

// MARK: - ExpressibleByStringLiteral
extension FHIRKitString: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    self.init(value)
  }
}

// MARK: - Codable
extension FHIRKitString: Codable {
  public init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.singleValueContainer()
    self.string = try codingKeyContainer.decode(String.self)
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.singleValueContainer()
    try codingKeyContainer.encode(string)
  }
}

// MARK: CustomStringConvertible
extension FHIRKitString: CustomStringConvertible {
  public var description: String {
    return string
  }
}

// MARK: - Equatable
extension FHIRKitString: Equatable {
  public static func == (leftSide: FHIRKitString, rightSide: FHIRKitString) -> Bool {
    return leftSide.string == rightSide.string
  }
  
  public static func == (leftSide: String, rightSide: FHIRKitString) -> Bool {
    return leftSide == rightSide.string
  }
  
  public static func == (leftSide: FHIRKitString, rightSide: String) -> Bool {
    return leftSide.string == rightSide
  }
}

// MARK: - Extends String
extension String {
  public func asFHIRKitStringPrimitive() -> FHIRKitPrimitive<FHIRKitString> {
    return FHIRKitPrimitive(FHIRKitString(self))
  }
}
