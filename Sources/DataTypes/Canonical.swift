//
//  Canonical.swift
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

import Foundation

/**
 A URI that referes to a resource by its canonical URL (resources with a url property). The canonical type
 differes from a URI in that it has special meaning in this specification and in that it may have a version
 appended, separated by a vertical bar "|".
 
 - Note: The type canonical is not used for actual canonical URLs that are the target of these references,
 but for the URIs that refer to them and may have the version suffix in them. Like other URIs, elements of this
 type may have `#fragment` references
 
 http://hl7.org/fhir/datatypes.html#canonical
 */
public struct Canonical: FHIRKitPrimitiveType {
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
    self.init(url ?? URL(string: "invalid:uri")!, version: version)
  }
}


extension Canonical: Codable {
  public init(from decoder: Decoder) throws {
    let _container = try decoder.singleValueContainer()
    let string = try _container.decode(String.self)
    let parts = string.split(separator: "|", maxSplits: 1)
    guard let urlPart = parts.first, let urlInstance = URL(string: String(urlPart)) else {
      throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: _container.codingPath, debugDescription: "Invalid URL in canonical \"\(string)\""))
    }
    
    self.url = urlInstance
    self.version = parts.count > 1 ? String(parts[1]) : nil
  }
  
  public func encode(to encoder: Encoder) throws {
    var _container = encoder.singleValueContainer()
    if let version = version {
      try _container.encode("\(url.absoluteString)|\(version)")
    } else {
      try _container.encode(url)
    }
  }
}

extension Canonical: CustomStringConvertible {
  public var description: String {
    if let version = version, !version.isEmpty {
      return "\(url.absoluteString)|\(version)"
    }
    
    return url.absoluteString
  }
}

extension Canonical: Equatable {
  public static func ==(leftSide: Canonical, rightSide: Canonical) -> Bool {
    if leftSide.url != rightSide.url {
      return false
    }
    
    if leftSide.version != rightSide.version {
      return false
    }
    
    return true
  }
  
  public static func ==(leftSide: String, rightSide: Canonical) -> Bool {
    return leftSide == rightSide.description
  }
  
  public static func ==(leftSide: Canonical, rightSide: String) -> Bool {
    return leftSide.description == rightSide
  }
}

// MARK: -
extension String {
  public func asFHIRKitCanonical() -> Canonical? {
    let (parsedURL, version) = Canonical.parseParts(from: self)
    guard let url = parsedURL else {
      return nil
    }
    
    return Canonical(url, version: version)
  }
  
  public func asFHIRKitCanonicalPrimitive() -> FHIRKitPrimitive<Canonical>? {
    guard let uri = asFHIRKitCanonical() else {
      return nil
    }
    
    return FHIRKitPrimitive(uri)
  }
}
