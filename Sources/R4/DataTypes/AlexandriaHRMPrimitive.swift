//
//  AlexandriaHRMPrimitive.swift
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

///Protocol for all FHIR Primitives
// MARK: - Protocol Definition
public protocol AlexandriaHRMPrimitiveType: AlexandriaHRMType {}

extension AlexandriaHRMPrimitiveType {
  public func asPrimitive(with fhirId: String? = nil, fhirExtension: [Extension]? = nil) -> AlexandriaHRMPrimitive<Self> {
    return AlexandriaHRMPrimitive(self, fhirId: id, fhirExtension: fhirExtension)
  }
}

public protocol AlexandriaHRMPrimitiveProtocol: Codable {
  associatedtype PrimitiveType: AlexandriaHRMPrimitiveType
  
  var value: PrimitiveType? { get set }
  var fhirId: String? { get set }
  var fhirExtension: [Extension]? { get set}
  var isNull: Bool { get }
  var hasPrimitiveData: Bool { get }
}

extension AlexandriaHRMPrimitiveProtocol {
  /**
   Returns an array of Extensions matching the desired URL.
   An empty array is returned if there are no extensions that match
   or there are no extensions at all
   */
  public func extensions(for url: String) -> [Extension] {
    let matches = fhirExtension?.filter {
      return $0.url.value?.url.absoluteString == url
    }
    
    return matches ?? []
  }
}

// MARK: - Type Definition

/**
 Wrap any of the FHIR primitive types
 */
public struct AlexandriaHRMPrimitive<PrimitiveType: AlexandriaHRMPrimitiveType>: AlexandriaHRMPrimitiveProtocol {
  public var value: PrimitiveType?
  public var fhirId: String?
  public var fhirExtension: [Extension]?
  
  public init(_ value: PrimitiveType? = nil, fhirId: String? = nil, fhirExtension: [Extension]? = nil) {
    self.value = value
    self.fhirId = fhirId
    self.fhirExtension = fhirExtension
  }
  
  /// Returns `true` if the receiver has nether a value, id, nor extensions
  public var isNull: Bool {
    return value == nil
    && id == nil
    && fhirExtension == nil
  }
  
  /// Returns `true` if the receiver has either an id or extensions
  public var hasPrimitiveData: Bool {
    return id != nil || fhirExtension != nil
  }
  
  /// Convenience debug description
  public var primitiveDescription: String {
    let valueStr = (value == nil) ? "nil value" : "value=\"\(value!)\""
    let idStr = (id == nil) ? "nil id" : "id=\"\(id!)\""
    let extStr = (fhirExtension == nil) ? "nil extensions" : "extensions=\"\(fhirExtension!.count)\""
    return "<\(type(of: self)) \(valueStr), \(idStr), \(extStr)>"
  }
}

// MARK: - Hashable
extension AlexandriaHRMPrimitive: Hashable {
  public static func == (leftSide: AlexandriaHRMPrimitive<PrimitiveType>, rightSide: AlexandriaHRMPrimitive<PrimitiveType>) -> Bool {
    if leftSide.value != rightSide.value {
      return false
    }
    
    if leftSide.id != rightSide.id {
      return false
    }
    
    if leftSide.fhirExtension != rightSide.fhirExtension {
      return false
    }
    return true
  }
  
  public static func == (leftSide: AlexandriaHRMPrimitive<PrimitiveType>, rightSide: PrimitiveType) -> Bool {
    return leftSide.value == rightSide
  }
  
  public static func == (leftSide: PrimitiveType, rightSide: AlexandriaHRMPrimitive<PrimitiveType>) -> Bool {
    return leftSide == rightSide.value
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(value)
    hasher.combine(id)
    hasher.combine(fhirExtension)
  }
}

// MARK: - Codable
extension AlexandriaHRMPrimitive: Codable {
  private enum CodingKeys: String, CodingKey {
    case id
    case fhirExtension
  }
  
  /**
   Decode the primitive from the given container. Right now this is tailored for FHIR's JSON representation and it
   will look for its value on "key" and id or extensions on "_key".
   */
  public init<_Key: CodingKey>(from parentContainer: KeyedDecodingContainer<_Key>, forKey key: _Key, auxKey: _Key? = nil) throws {
    let value = try parentContainer.decodeIfPresent(PrimitiveType.self, forKey: key)
    if let auxKey = auxKey, let primitive = try parentContainer.decodeIfPresent(Self.self, forKey: auxKey) {
      self.init(value, fhirId: primitive.id, fhirExtension: primitive.fhirExtension)
    } else if let value = value {
      self.init(value)
    } else {
      throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: [key], debugDescription: "Must have a value for \"\(key)\" but have none"))
    }
  }
  
  /**
   Decode the primitive from the given container. Right now this is tailored for FHIR's JSON representation and it
   will look for its value on "key" and id or extensions on "_key".
   */
  public init?<_Key: CodingKey>(from parentContainer: KeyedDecodingContainer<_Key>, forKeyIfPresent key: _Key, auxKey: _Key? = nil) throws {
    let value = try parentContainer.decodeIfPresent(PrimitiveType.self, forKey: key)
    if let auxKey = auxKey, let primitive = try parentContainer.decodeIfPresent(Self.self, forKey: auxKey) {
      self.init(value, fhirId: primitive.id, fhirExtension: primitive.fhirExtension)
    } else if let value = value {
      self.init(value)
    } else {
      return nil
    }
  }
  
  /**
   Encode the primitive to the given parent container. Right now this is tailored for FHIR's JSON representation and
   will encode its value to "key" and its id and/or extension, if any, to "_key" given with auxiliaryKey.
   */
  public func encode<_Key>(on parentContainer: inout KeyedEncodingContainer<_Key>, forKey key: _Key, auxKey: _Key? = nil) throws {
    if let value = value {
      try parentContainer.encode(value, forKey: key)
    }
    if hasPrimitiveData {
      if let auxKey = auxKey {
        try parentContainer.encode(self, forKey: auxKey)
      } else {
        throw EncodingError.invalidValue(self, EncodingError.Context(codingPath: [key], debugDescription: "Have id or extension but was not provided an encoding key to serialize to"))
      }
    }
  }
}

// MARK: - Array<AlexandriaHRMPrimitiveProtocol>

// swiftlint:disable identifier_name
extension Array where Element: AlexandriaHRMPrimitiveProtocol {
  public init<_Key: CodingKey>(from parentContainer: KeyedDecodingContainer<_Key>, forKey key: _Key, auxKey: _Key? = nil) throws {
    let values = try parentContainer.decodeIfPresent([Element.PrimitiveType?].self, forKey: key)
    let primitives = (auxKey != nil) ? try parentContainer.decodeIfPresent([Element?].self, forKey: auxKey!): nil
    if let values = values {
      if let primitives = primitives {
        var arr: [Element] = []
        for (i, v) in values.enumerated() {
          let p = primitives[safe: i]
          if let v = v {
            arr.append(v.asPrimitive(with: p??.id, fhirExtension: p??.fhirExtension) as! Element) // swiftlint:disable:this force_cast
          } else if let pidx = p, let p = pidx {
            arr.append(p)
          }
        }
        self = arr
      } else {
        self = values.compactMap { $0?.asPrimitive() as? Element}
      }
    } else if let primitives = primitives {
      self = primitives.compactMap { $0 }
    } else {
      throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: [key], debugDescription: "Must have a value for \"\(key)\" but have none"))
    }
  }
  
  public init?<_Key: CodingKey>(from parentContainer: KeyedDecodingContainer<_Key>, forKeyIfPresent key: _Key, auxKey: _Key? = nil) throws {
    // This is thorny. See testDecodePrimitiveArrayWithID() and testDecodePrimitiveArrayWithOnlyExtension()
    let values = try parentContainer.decodeIfPresent([Element.PrimitiveType?].self, forKey: key)
    let primitives = (auxKey != nil) ? try parentContainer.decodeIfPresent([Element?].self, forKey: auxKey!) : nil
    if let values = values {
      if let primitives = primitives {
        var arr: [Element] = []
        for (i, v) in values.enumerated() {
          let p = primitives[safe: i]
          if let v = v {
            arr.append(v.asPrimitive(with: p??.id, fhirExtension: p??.fhirExtension) as! Element) // swiftlint:disable:this force_cast
          } else if let pidx = p, let p = pidx {
            arr.append(p)
          }
        }
        self = arr
      } else {
        self = values.compactMap { $0?.asPrimitive() as? Element }
      }
    } else if let primitives = primitives {
      self = primitives.compactMap { $0 }
    } else {
      return nil
    }
  }
  
  public func encode<_Key>(on parentContainer: inout KeyedEncodingContainer<_Key>, forKey key: _Key, auxKey: _Key? = nil) throws {
    var values = [Element.PrimitiveType?]()
    var primitives = [Element?]()
    var hasNonnullValues = false
    var hasNonnullPrimitives = false
    for element in self {
      guard !element.isNull else {
        continue
      }
      values.append(element.value)
      primitives.append(element.hasPrimitiveData ? element : nil)
      hasNonnullValues = hasNonnullValues || (element.value != nil)
      hasNonnullPrimitives = hasNonnullPrimitives || element.hasPrimitiveData
    }
    
    if hasNonnullValues {
      try parentContainer.encode(values, forKey: key)
    }
    if hasNonnullPrimitives {
      if let auxKey = auxKey {
        try parentContainer.encode(primitives, forKey: auxKey)
      } else {
        throw EncodingError.invalidValue(self, EncodingError.Context(codingPath: [key], debugDescription: "Have id or extension elements but was not provided an encoding key to serialize to"))
      }
    }
  }
}

// MARK: - Extends Collection
extension Collection {
  subscript(safe index: Index) -> Iterator.Element? {
    guard indices.contains(index) else {
      return nil
    }
    
    return self[index]
  }
}

// MARK: - ExpressibleByLiteral
extension AlexandriaHRMPrimitive: ExpressibleByStringLiteral, ExpressibleByUnicodeScalarLiteral, ExpressibleByExtendedGraphemeClusterLiteral where PrimitiveType: ExpressibleByStringLiteral {
  public typealias StringLiteralType = PrimitiveType.StringLiteralType
  public typealias UnicodeScalarLiteralType = PrimitiveType.UnicodeScalarLiteralType
  public typealias ExtendedGraphemeClusterLiteralType = PrimitiveType.ExtendedGraphemeClusterLiteralType
  
  public init(stringLiteral value: StringLiteralType) {
    self.init(PrimitiveType(stringLiteral: value))
  }
  
  public init(unicodeScalarLiteral value: PrimitiveType.UnicodeScalarLiteralType) {
    self.init(PrimitiveType(unicodeScalarLiteral: value))
  }
  
  public init (extendedGraphemeClusterLiteral value: PrimitiveType.ExtendedGraphemeClusterLiteralType) {
    self.init(PrimitiveType(extendedGraphemeClusterLiteral: value))
  }
}

// MARK: - ExpressibleByIntegerLiteral
extension AlexandriaHRMPrimitive: ExpressibleByIntegerLiteral where PrimitiveType: ExpressibleByIntegerLiteral {
  public typealias IntegerLiteralType = PrimitiveType.IntegerLiteralType
  
  public init(integerLiteral value: PrimitiveType.IntegerLiteralType) {
    self.init(PrimitiveType(integerLiteral: value))
  }
}

// MARK: - ExpressibleByFloatLiteral
extension AlexandriaHRMPrimitive: ExpressibleByFloatLiteral where PrimitiveType: ExpressibleByFloatLiteral {
  public typealias FloatLiteralType = PrimitiveType.FloatLiteralType
  
  public init(floatLiteral value: PrimitiveType.FloatLiteralType) {
    self.init(PrimitiveType(floatLiteral: value))
  }
}
