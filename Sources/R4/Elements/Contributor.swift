//
//  Contributor.swift
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

import FHIRKitCore

/**
 Contributor information
 
 A contributor to the content of a knowledge asset, including authors, editors, reviewers, and endorsers
 */
open class Contributor: Element {
  /// The type of contributor
  public var type: FHIRKitPrimitive<ContributorType>
  
  /// Name of the contributor
  public var name: FHIRKitPrimitive<FHIRKitString>
  
  /// Contact details for the contributor
  public var contact: [ContactDetail]?
  
  public init(type: FHIRKitPrimitive<ContributorType>, name: FHIRKitPrimitive<FHIRKitString>) {
    self.type = type
    self.name = name
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<ContributorType>,
    name: FHIRKitPrimitive<FHIRKitString>,
    contact: [ContactDetail]? = nil
  ) {
    self.init(type: type, name: name)
    self.fhirExtension = fhirExtension
    self.id = id
    self.contact = contact
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case name; case _name
    case contact
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try FHIRKitPrimitive<ContributorType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.contact = try [ContactDetail](from: codingKeyContainer, forKeyIfPresent: .contact)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try contact?.encode(on: &codingKeyContainer, forKey: .contact)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Contributor else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && name == _other.name
    && contact == _other.contact
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(name)
    hasher.combine(contact)
  }
  
}
