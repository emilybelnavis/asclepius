//
//  FHIRKitBase64Binary.swift
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
 A stream of bytes, base64 encoded (RFC 4648)
 
 http://hl7.org/fhir/datatypes.html#base64Binary
 */
public struct FHIRKitBase64Binary: FHIRKitPrimitiveType {
  public var dataString: String
  
  public init(_ dataString: String) {
    self.dataString = dataString
  }
  
  public init?(with data: Data) {
    guard let string = String(data: data, encoding: .utf8) else {
      return nil
    }
    
    self.dataString = string
  }
  
  public func data(using encoding: String.Encoding = .utf8) -> Data? {
    return dataString.data(using: encoding)
  }
}

extension FHIRKitBase64Binary: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    self.init(value)
  }
}

extension FHIRKitBase64Binary: Codable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    self.dataString = try container.decode(String.self)
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(dataString)
  }
}

extension FHIRKitBase64Binary: Equatable {
  public static func ==(left: FHIRKitBase64Binary, right: FHIRKitBase64Binary) -> Bool {
    return left.dataString == right.dataString
  }
}
