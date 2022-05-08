//
//  BackboneElement.swift
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
 Base definition for all elements that are defined inside a resource, but not those in a data type
 */
open class BackboneElement: Element {
  /// Extensions that cannot be ignored even if unrecognized
  public var modifierExtension: [Extension]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case modifierExtension
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.modifierExtension = try [Extension](from: codingKeyContainer, forKeyIfPresent: .modifierExtension)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try modifierExtension?.encode(on: &codingKeyContainer, forKey: .modifierExtension)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? BackboneElement else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return modifierExtension == _other.modifierExtension
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super .hash(into: &hasher)
    hasher.combine(modifierExtension)
  }
}
