//
//  FHIRKitBase64Binary.swift
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
import FHIRKitCore

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

// MARK: - Codable
extension FHIRKitBase64Binary: Codable {
  public init(from decoder: Decoder) throws {
    let codingContainer = try decoder.singleValueContainer()
    self.dataString = try codingContainer.decode(String.self)
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingContainer = encoder.singleValueContainer()
    try codingContainer.encode(dataString)
  }
}

// MARK: - Equatable
extension FHIRKitBase64Binary: Equatable {
  public static func == (left: FHIRKitBase64Binary, right: FHIRKitBase64Binary) -> Bool {
    return left.dataString == right.dataString
  }
}
