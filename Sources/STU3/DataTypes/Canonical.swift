//
//  Canonical.swift
//  AlexandriaHRM
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
import AlexandriaHRMCore

/**
 A URI that referes to a resource by its canonical URL (resources with a url property). The canonical type
 differes from a URI in that it has special meaning in this specification and in that it may have a version
 appended, separated by a vertical bar "|".
 
 - Note: The type canonical is not used for actual canonical URLs that are the target of these references,
 but for the URIs that refer to them and may have the version suffix in them. Like other URIs, elements of this
 type may have `#fragment` references
 
 http://hl7.org/fhir/datatypes.html#canonical
 */
public struct Canonical: AlexandriaHRMPrimitiveType {
  public var url: URL
  public var version: String?
  
  public init(_ url: URL, version: String? = nil) {
    self.url = url
    self.version = version
  }
  
  fileprivate static func parseParts(from string: String) -> (url: URL?, version: String?) {
    let parts = string.split(separator: "|", maxSplits: 1)
    if let urlPart = parts.first, let url = URL(string: String(urlPart)) {
      return (url, parts.count > 1 ? String(parts[1]) : nil)
    }
    
    return (nil, parts.count > 1 ? String(parts[1]): nil)
  }
}

extension Canonical: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    let (url, version) = Self.parseParts(from: value)
    self.init(url ?? URL(string: "invalfhirId:uri")!, version: version)
  }
}

// MARK: - Codable
extension Canonical: Codable {
  public init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.singleValueContainer()
    let string = try codingKeyContainer.decode(String.self)
    let parts = string.split(separator: "|", maxSplits: 1)
    
    guard let urlPart = parts.first, let urlInstance = URL(string: String(urlPart)) else {
      throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingKeyContainer.codingPath, debugDescription: "Invalid URL in canonical \"\(string)\""))
    }
    
    self.url = urlInstance
    self.version = parts.count > 1 ? String(parts[1]) : nil
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.singleValueContainer()
    if let version = version {
      try codingKeyContainer.encode("\(url.absoluteString)|\(version)")
    } else {
      try codingKeyContainer.encode(url)
    }
  }
}

// MARK: - CustomStringConvertible
extension Canonical: CustomStringConvertible {
  public var description: String {
    if let version = version, !version.isEmpty {
      return "\(url.absoluteString)|\(version)"
    }
    
    return url.absoluteString
  }
}

// MARK: - Equatable
extension Canonical: Equatable {
  public static func == (leftSide: Canonical, rightSide: Canonical) -> Bool {
    if leftSide.url != rightSide.url {
      return false
    }
    
    if leftSide.version != rightSide.version {
      return false
    }
    
    return true
  }
  
  public static func == (leftSide: String, rightSide: Canonical) -> Bool {
    return leftSide == rightSide.description
  }
  
  public static func == (leftSide: Canonical, rightSide: String) -> Bool {
    return leftSide.description == rightSide
  }
}

// MARK: -
extension String {
  public func asAlexandriaHRMCanonical() -> Canonical? {
    let (parsedURL, version) = Canonical.parseParts(from: self)
    guard let url = parsedURL else {
      return nil
    }
    return Canonical(url, version: version)
  }
  
  public func asAlexandriaHRMCanonicalPrimitive() -> AlexandriaHRMPrimitive<Canonical>? {
    guard let uri = asAlexandriaHRMCanonical() else {
      return nil
    }
    return AlexandriaHRMPrimitive(uri)
  }
}
