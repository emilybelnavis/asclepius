//
//  ContactDetail.swift
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

open class ContactDetail: Element {
  /// name of an individual to contact
  public var name: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// contact details for individual or organization
  public var telecom: [ContactPoint]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    name: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    telecom: [ContactPoint]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.name = name
    self.telecom = telecom
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case telecom
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.telecom = try [ContactPoint](from: codingKeyContainer, forKeyIfPresent: .telecom)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try telecom?.encode(on: &codingKeyContainer, forKey: .telecom)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContactDetail else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name && telecom == _other.telecom
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(telecom)
  }
}
