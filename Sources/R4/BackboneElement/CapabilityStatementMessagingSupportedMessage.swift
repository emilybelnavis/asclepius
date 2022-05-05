//
//  CapabilityStatementMessagingSupportedMessage.swift
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

/// References to message definitions for messages this system can send or receive
open class CapabilityStatementMessagingSupportMessage: BackboneElement {
  /// The mode of this event declaration - whether application is sender or receiver
  public var mode: FHIRKitPrimitive<EventCapabilityMode>
  
  /// Mesage supported by this system
  public var definition: FHIRKitPrimitive<Canonical>
 
  public init(mode: FHIRKitPrimitive<EventCapabilityMode>, definition: FHIRKitPrimitive<Canonical>) {
    self.mode = mode
    self.definition = definition
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    mode: FHIRKitPrimitive<EventCapabilityMode>,
    definition: FHIRKitPrimitive<Canonical>
  ) {
    self.init(mode: mode, definition: definition)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case mode; case _mode
    case definition; case _definition
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.mode = try FHIRKitPrimitive<EventCapabilityMode>(from: codingKeyContainer, forKey: .mode, auxKey: ._mode)
    self.definition = try FHIRKitPrimitive<Canonical>(from: codingKeyContainer, forKey: .definition, auxKey: ._definition)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try mode.encode(on: &codingKeyContainer, forKey: .mode, auxKey: ._mode)
    try definition.encode(on: &codingKeyContainer, forKey: .definition, auxKey: ._definition)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementMessagingSupportMessage else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return mode == _other.mode
    && definition == _other.definition
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(mode)
    hasher.combine(definition)
  }
}