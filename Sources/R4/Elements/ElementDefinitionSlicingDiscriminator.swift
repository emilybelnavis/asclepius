//
//  ElementDefinitionSlicingDiscriminator.swift
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

import AlexandriaHRMCore

/**
 Element values that are used to distinguish the slices. Designates which child elements are used to discriminate
 between the slices when processing an instance. If one or more discriminators are provided, the value of the
 child elements SHALL completely distinguish which slice the element in the resource matches based on the
 allowed values for thos elements in each of the slices
 */
open class ElementDefinitionSlicingDiscriminator: Element {
  /// How the element value is interpreted when discrimination is evaluated
  public var type: AlexandriaHRMPrimitive<DiscriminatorType>
  
  /// Path to element value
  public var path: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  public init(type: AlexandriaHRMPrimitive<DiscriminatorType>, path: AlexandriaHRMPrimitive<AlexandriaHRMString>) {
    self.type = type
    self.path = path
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: AlexandriaHRMPrimitive<DiscriminatorType>,
    path: AlexandriaHRMPrimitive<AlexandriaHRMString>
  ) {
    self.init(type: type, path: path)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case path; case _path
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try AlexandriaHRMPrimitive<DiscriminatorType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.path = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .path, auxKey: ._path)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try path.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionSlicingDiscriminator else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && path == _other.path
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(path)
  }
}
