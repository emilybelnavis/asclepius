//
//  Element.swift
//  Asclepius
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

import AsclepiusCore

/**
 The base definition for all elements contained inside a resource. All elements, whether defined as a `Data Type`
 (including primitives) or as a part of a resource structure have this base content; Extensions and an internal ID.
 
 Three kinds of decend
 */
open class Element: AsclepiusType {
  /// Unique id for inter-element referencing
  public var fhirId: AsclepiusPrimitive<AsclepiusString>?
  
  /// Addistional content defined by implementations
  public var fhirExtension: [Extension]?
  
  public init() {
    
  }
  
  public convenience init(fhirExtension: [Extension]? = nil, fhirId: AsclepiusPrimitive<AsclepiusString>? = nil) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case fhirExtension = "extension"
    case fhirId = "id"; case _fhirId = "_id"
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fhirExtension = try [Extension](from: codingKeyContainer, forKeyIfPresent: .fhirExtension)
    self.fhirId = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .fhirId, auxKey: ._fhirId)
  }
  
  public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try fhirExtension?.encode(on: &codingKeyContainer, forKey: .fhirExtension)
    try fhirId?.encode(on: &codingKeyContainer, forKey: .fhirId, auxKey: ._fhirId)
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
    && fhirId == _other.fhirId
  }
  
  // MARK: - Hashable
  public func hash(into hasher: inout Hasher) {
    hasher.combine(fhirExtension)
    hasher.combine(fhirId)
  }
}

// MARK: - Extends Element
public extension Element {
  func extensions(for url: String) -> [Extension] {
    let matches = fhirExtension?.filter {
      return $0.url.value?.url.absoluteString == url
    }
    return matches ?? []
  }
}
