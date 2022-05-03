//
//  FHIRKitURI.swift
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
 A Uniform Resource Locator (RFC 1738). Note URLs are accessed directly using the speficied protocol.
 Common URL protocols are `http{s}:`, `ftp:`,  `mailto:`, and `mllp:`, though many others
 are defined.
 */
public struct FHIRKitURI: FHIRKitPrimitiveType {
  public var url: URL
  
  public init(_ url: URL) {
    self.url = url
  }
}

// MARK: - ExpressibleByStringLiteral
extension FHIRKitURI: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    let url = URL(string: value) ?? URL(string: "invalid:uri")!
    self.init(url)
  }
}

// MARK: - Codable
extension FHIRKitURI: Codable {
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
extension FHIRKitURI: CustomStringConvertible {
  public var description: String {
    return url.absoluteString
  }
}

// MARK: - Equatable
extension FHIRKitURI: Equatable {
  public static func == (leftSide: FHIRKitURI, rightSide: FHIRKitURI) -> Bool {
    return leftSide.url == rightSide.url
  }
  
  public static func == (leftSide: URL, rightSide: FHIRKitURI) -> Bool {
    return leftSide == rightSide.url
  }
  
  public static func == (leftSide: FHIRKitURI, rightSide: URL) -> Bool {
    return leftSide.url == rightSide
  }
}

// MARK: - Extends String
extension String {
  public func asFHIRKitURI() -> FHIRKitURI? {
    guard let url = URL(string: self) else {
      return nil
    }
    return FHIRKitURI(url)
  }
  
  public func asFHIRKitURIPrimitive() -> FHIRKitPrimitive<FHIRKitURI>? {
    guard let uri = asFHIRKitURI() else {
      return nil
    }
    return FHIRKitPrimitive(uri)
  }
}

extension URL {
  public func asFHIRKitURIPrimitive() -> FHIRKitPrimitive<FHIRKitURI> {
    return FHIRKitPrimitive(FHIRKitURI(self))
  }
}
