//
//  FHIRKitPrimitive.swift
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

/**
 Protocol for all FHIR Primitives
 */

public protocol FHIRKitPrimitiveType: FHIRKitType {}

extension FHIRKitPrimitiveType {
  public func asPrimitive(with id: String? = nil, extension: [Extension]? = nil) -> FHIRKitPrimitive<Self> {
    return FHIRKitPrimitive(self, id: id, extension: `extension`)
  }
}

public protocol FHIRKitPrimitiveProtocol: Codable {
  associatedtype PrimitiveType: FHIRKitPrimitiveType
  
  var value: PrimitiveType? { get set }
  var id: String? { get set }
  var `extension`: [Extension]? { get set}
  var isNull: Bool { get }
  var hasPrimitiveData: Bool { get }
}

extension FHIRKitPrimitiveProtocol {
  /**
   Returns an array of Extensions matching the desired URL.
   An empty array is returned if there are no extensions that match
   or there are no extensions at all
   */
  public func extensions(for url: String) -> [Extension] {
    let matches = `extension`?.filter {
      return $0.url.value?.url.absoluteString == url
    }
    
    return matches ?? []
  }
}

// MARK: - FHIRKitPrimitive

/**
 Wrap any of the FHIR primitive types
 */
public struct FHIRKitPrimitive<PrimitiveType: FHIRKitPrimitiveType>: FHIRKitPrimitiveProtocol {
  public var value: PrimitiveType?
  public var id: String?
  public var `extension`: [Extension]?
  
  public init(_ value: PrimitiveType? = nil, id: String? = nil, extension: [Extension]? = nil) {
    self.value = value
    self.id = id
    self.extension = `extension`
  }
  
  /// Returns `true` if the receiver has nether a value, id, nor extensions
  public var isNull: Bool {
    return value == nil && id == nil && `extension` == nil
  }
  
  /// Returns `true` if the receiver has either an id or extensions
  public var hasPrimitiveData: Bool {
    return id != nil || `extension` != nil
  }
  
  /// Convenience debug description
  public var primitiveDescription: String {
    let valueStr = (value == nil) ? "nil value" : "value=\"\(value!)\""
    let idStr = (id == nil) ? "nil id" : "id=\"\(id!)\""
    let extStr = (`extension` == nil) ? "nil extensions" : "extensions=\"\(`extension`!.count)\""
    return "<\(type(of: self)) \(valueStr), \(idStr), \(extStr)>"
  }
}

// MARK: - Hashable
extension FHIRKitPrimitive: Hashable {
  public static func == (leftSide: FHIRKitPrimitive<PrimitiveType>, rightSide: FHIRKitPrimitive<PrimitiveType>) -> Bool {
    if leftSide.value != rightSide.value {
      return false
    }
    
    if leftSide.id != rightSide.id {
      return false
    }
    
    if leftSide.extension != rightSide.extension {
      return false
    }
    return true
  }
  
  public static func == (leftSide: FHIRKitPrimitive<PrimitiveType>, rightSide: PrimitiveType) -> Bool {
    return leftSide.value == rightSide
  }
  
  public static func == (leftSide: PrimitiveType, rightSide: FHIRKitPrimitive<PrimitiveType>) -> Bool {
    return leftSide == rightSide.value
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(value)
    hasher.combine(id)
    hasher.combine(`extension`)
  }
}

// MARK: - Codable
extension FHIRKitPrimitive: Codable {
  private enum CodingKeys: String, CodingKey {
    case id
    case `extension`
  }
  
  /**
   Decode the primitive from the given container. Right now this is tailored for FHIR's JSON representation and it
   will look for its value on "key" and id or extensions on "_key".
   */
  public init<_Key: CodingKey>(from parentContainer: KeyedDecodingContainer<_Key>, forKey key: _Key, auxiliaryKey: _Key? = nil) throws {
    let value = try parentContainer.decodeIfPresent(PrimitiveType.self, forKey: key)
    if let auxiliaryKey = auxiliaryKey, let primitive = try parentContainer.decodeIfPresent(Self.self, forKey: auxiliaryKey) {
      self.init(value, id: primitive.id, extension: primitive.extension)
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
  public init?<_Key: CodingKey>(from parentContainer: KeyedDecodingContainer<_Key>, forKeyIfPresent key: _Key, auxiliaryKey: _Key? = nil) throws {
    let value = try parentContainer.decodeIfPresent(PrimitiveType.self, forKey: key)
    if let auxiliaryKey = auxiliaryKey, let primitive = try parentContainer.decodeIfPresent(Self.self, forKey: auxiliaryKey) {
      self.init(value, id: primitive.id, extension: primitive.extension)
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
  public func encode<_Key>(on parentContainer: inout KeyedEncodingContainer<_Key>, forKey key: _Key, auxiliaryKey: _Key? = nil) throws {
    if let value = value {
      try parentContainer.encode(value, forKey: key)
    }
    if hasPrimitiveData {
      if let auxiliaryKey = auxiliaryKey {
        try parentContainer.encode(self, forKey: auxiliaryKey)
      } else {
        throw EncodingError.invalidValue(self, EncodingError.Context(codingPath: [key], debugDescription: "Have id or extension but was not provided an encoding key to serialize to"))
      }
    }
  }
}

// MARK: - Array<FHIRKitPrimitiveProtocol>

// swiftlint:disable identifier_name
extension Array where Element: FHIRKitPrimitiveProtocol {
  public init<_Key: CodingKey>(from parentContainer: KeyedDecodingContainer<_Key>, forKey key: _Key, auxiliaryKey: _Key? = nil) throws {
    let values = try parentContainer.decodeIfPresent([Element.PrimitiveType?].self, forKey: key)
    let primitives = (auxiliaryKey != nil) ? try parentContainer.decodeIfPresent([Element?].self, forKey: auxiliaryKey!): nil
    if let values = values {
      if let primitives = primitives {
        var arr: [Element] = []
        for (i, v) in values.enumerated() {
          let p = primitives[safe: i]
          if let v = v {
            arr.append(v.asPrimitive(with: p??.id, extension: p??.extension) as! Element) // swiftlint:disable:this force_cast
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
  
  public init?<_Key: CodingKey>(from parentContainer: KeyedDecodingContainer<_Key>, forKeyIfPresent key: _Key, auxiliaryKey: _Key? = nil) throws {
    // This is thorny. See testDecodePrimitiveArrayWithID() and testDecodePrimitiveArrayWithOnlyExtension()
    let values = try parentContainer.decodeIfPresent([Element.PrimitiveType?].self, forKey: key)
    let primitives = (auxiliaryKey != nil) ? try parentContainer.decodeIfPresent([Element?].self, forKey: auxiliaryKey!) : nil
    if let values = values {
      if let primitives = primitives {
        var arr: [Element] = []
        for (i, v) in values.enumerated() {
          let p = primitives[safe: i]
          if let v = v {
            arr.append(v.asPrimitive(with: p??.id, extension: p??.extension) as! Element) // swiftlint:disable:this force_cast
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
  
  public func encode<_Key>(on parentContainer: inout KeyedEncodingContainer<_Key>, forKey key: _Key, auxiliaryKey: _Key? = nil) throws {
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
      if let auxiliaryKey = auxiliaryKey {
        try parentContainer.encode(primitives, forKey: auxiliaryKey)
      } else {
        throw EncodingError.invalidValue(self, EncodingError.Context(codingPath: [key], debugDescription: "Have id or extension elements but was not provided an encoding key to serialize to"))
      }
    }
  }
}

extension Collection {
  subscript(safe index: Index) -> Iterator.Element? {
    guard indices.contains(index) else {
      return nil
    }
    
    return self[index]
  }
}

// MARK: - ExpressibleByLiteral
extension FHIRKitPrimitive: ExpressibleByStringLiteral, ExpressibleByUnicodeScalarLiteral, ExpressibleByExtendedGraphemeClusterLiteral where PrimitiveType: ExpressibleByStringLiteral {
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

extension FHIRKitPrimitive: ExpressibleByIntegerLiteral where PrimitiveType: ExpressibleByIntegerLiteral {
  public typealias IntegerLiteralType = PrimitiveType.IntegerLiteralType
  
  public init(integerLiteral value: PrimitiveType.IntegerLiteralType) {
    self.init(PrimitiveType(integerLiteral: value))
  }
}

extension FHIRKitPrimitive: ExpressibleByFloatLiteral where PrimitiveType: ExpressibleByFloatLiteral {
  public typealias FloatLiteralType = PrimitiveType.FloatLiteralType
  
  public init(floatLiteral value: PrimitiveType.FloatLiteralType) {
    self.init(PrimitiveType(floatLiteral: value))
  }
}
