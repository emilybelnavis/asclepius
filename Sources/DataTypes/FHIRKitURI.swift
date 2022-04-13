//
//  FHIRKitURI.swift
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

public struct FHIRKitURI: FHIRKitPrimitiveType {
  public var url: URL
  
  public init(_ url: URL) {
    self.url = url
  }
}

extension FHIRKitURI: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    let url = URL(string: value) ?? URL(string: "invalid:uri")!
    self.init(url)
  }
}

extension FHIRKitURI: Codable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    self.url = try container.decode(URL.self)
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(url)
  }
}

extension FHIRKitURI: CustomStringConvertible {
  public var description: String {
    return url.absoluteString
  }
}

extension FHIRKitURI: Equatable {
  public static func ==(l: FHIRKitURI, r: FHIRKitURI) -> Bool {
    return l.url == r.url
  }
  
  public static func ==(l: URL, r: FHIRKitURI) -> Bool {
    return l == r.url
  }
  
  public static func ==(l: FHIRKitURI, r: URL) -> Bool {
    return l.url == r
  }
}

// MARK: -
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
