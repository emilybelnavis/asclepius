//
//  CapabilityStatementMessagingSupportedMessage.swift
//  Asclepius
//  Module: STU3
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

/// References to message definitions for messages this system can send or receive
open class CapabilityStatementMessagingSupportMessage: BackboneElement {
  /// The mode of this event declaration - whether application is sender or receiver
  public var mode: AsclepiusPrimitive<EventCapabilityMode>
  
  /// Mesage supported by this system
  public var definition: AsclepiusPrimitive<Canonical>
 
  public init(mode: AsclepiusPrimitive<EventCapabilityMode>, definition: AsclepiusPrimitive<Canonical>) {
    self.mode = mode
    self.definition = definition
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    mode: AsclepiusPrimitive<EventCapabilityMode>,
    definition: AsclepiusPrimitive<Canonical>
  ) {
    self.init(mode: mode, definition: definition)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case mode; case _mode
    case definition; case _definition
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.mode = try AsclepiusPrimitive<EventCapabilityMode>(from: codingKeyContainer, forKey: .mode, auxKey: ._mode)
    self.definition = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKey: .definition, auxKey: ._definition)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try mode.encode(on: &codingKeyContainer, forKey: .mode, auxKey: ._mode)
    try definition.encode(on: &codingKeyContainer, forKey: .definition, auxKey: ._definition)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(mode)
    hasher.combine(definition)
  }
}
