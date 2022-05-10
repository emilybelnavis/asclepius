//
//  AsclepiusURI.swift
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
 A Uniform Resource Locator (RFC 1738). Note URLs are accessed directly using the speficied protocol.
 Common URL protocols are `http{s}:`, `ftp:`,  `mailto:`, and `mllp:`, though many others
 are defined.
 */
public struct AsclepiusURI: AsclepiusPrimitiveType {
  public var url: URL
  
  public init(_ url: URL) {
    self.url = url
  }
}

// MARK: - ExpressibleByStringLiteral
extension AsclepiusURI: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    let url = URL(string: value) ?? URL(string: "invalfhirId:uri")!
    self.init(url)
  }
}

// MARK: - Codable
extension AsclepiusURI: Codable {
  public init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.singleValueContainer()
    self.url = try codingKeyContainer.decode(URL.self)
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.singleValueContainer()
    try codingKeyContainer.encode(url)
  }
}

// MARK: - CustomStringConvertible
extension AsclepiusURI: CustomStringConvertible {
  public var description: String {
    return url.absoluteString
  }
}

// MARK: - Equatable
extension AsclepiusURI: Equatable {
  public static func == (leftSide: AsclepiusURI, rightSide: AsclepiusURI) -> Bool {
    return leftSide.url == rightSide.url
  }
  
  public static func == (leftSide: URL, rightSide: AsclepiusURI) -> Bool {
    return leftSide == rightSide.url
  }
  
  public static func == (leftSide: AsclepiusURI, rightSide: URL) -> Bool {
    return leftSide.url == rightSide
  }
}

// MARK: - Extends String
extension String {
  public func asAsclepiusURI() -> AsclepiusURI? {
    guard let url = URL(string: self) else {
      return nil
    }
    return AsclepiusURI(url)
  }
  
  public func asAsclepiusURIPrimitive() -> AsclepiusPrimitive<AsclepiusURI>? {
    guard let uri = asAsclepiusURI() else {
      return nil
    }
    return AsclepiusPrimitive(uri)
  }
}

extension URL {
  public func asAsclepiusURIPrimitive() -> AsclepiusPrimitive<AsclepiusURI> {
    return AsclepiusPrimitive(AsclepiusURI(self))
  }
}
