//
//  Element.swift
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
 The base definition for all elements contained inside a resource. All elements, whether defined as a `Data Type`
 (including primitives) or as a part of a resource structure have this base content; Extensions and an internal ID.
 
 Three kinds of decend
 */
open class Element: FHIRKitType {
  /// Unique id for inter-element referencing
  public var id: FHIRKitPrimitive<FHIRKitString>?
  
  /// Addistional content defined by implementations
  public var fhirExtension: [Extension]?
  
  public init() {
    
  }
  
  public convenience init(fhirExtension: [Extension]? = nil, id: FHIRKitPrimitive<FHIRKitString>? = nil) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case fhirExtension = "extension" // swiftlint:disable:this redundant_string_enum_value
    case id; case _id
  }
  
  /// decodable
  public required init(from decoder: Decoder) throws {
    let codingContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fhirExtension = try [Extension](from: codingContainer, forKeyIfPresent: .fhirExtension)
    self.id = try FHIRKitPrimitive<FHIRKitString>(from: codingContainer, forKeyIfPresent: .id, auxiliaryKey: ._id)
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try fhirExtension?.encode(on: &codingContainer, forKey: .fhirExtension)
    try id?.encode(on: &codingContainer, forKey: .id, auxiliaryKey: ._id)
  }
  
  // MARK: - Equatable
  public static func == (leftSide: Element, rightSide: Element) -> Bool {
    return leftSide.isEqual(to: rightSide)
  }
  
  public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Element else {
      return false
    }
    
    guard type(of: self) == type(of: _other) else {
      return false
    }
    
    return fhirExtension == _other.fhirExtension
    && id == _other.id
  }
  
  // MARK: - Hashable
  public func hash(into hasher: inout Hasher) {
    hasher.combine(fhirExtension)
    hasher.combine(id)
  }
}
