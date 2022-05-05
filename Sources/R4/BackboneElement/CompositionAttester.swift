//
//  CompositionAttester.swift
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

/// A participant who has attested to the accuracy or the composition/document
open class CompositionAttester: BackboneElement {
  /// The type of attestation the authenticator offers
  public var mode: FHIRKitPrimitive<CompositionAttestationMode>
  
  /// When the composition was attested
  public var time: FHIRKitPrimitive<FHIRKitDateTime>
  
  /// Who attested the composition
  public var party: Reference?
  
  public init(mode: FHIRKitPrimitive<CompositionAttestationMode>, time: FHIRKitPrimitive<FHIRKitDateTime>) {
    self.mode = mode
    self.time = time
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    mode: FHIRKitPrimitive<CompositionAttestationMode>,
    time: FHIRKitPrimitive<FHIRKitDateTime>,
    party: Reference? = nil
  ) {
    self.init(mode: mode, time: time)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.party = party
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case mode; case _mode
    case time; case _time
    case party
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.mode = try FHIRKitPrimitive<CompositionAttestationMode>(from: codingKeyContainer, forKey: .mode, auxKey: ._mode)
    self.time = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKey: .time, auxKey: ._time)
    self.party = try Reference(from: codingKeyContainer, forKeyIfPresent: .party)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = try encoder.container(keyedBy: CodingKeys.self)
    
    try mode.encode(on: &codingKeyContainer, forKey: .mode, auxKey: ._mode)
    try time.encode(on: &codingKeyContainer, forKey: .time, auxKey: ._time)
    try party?.encode(on: &codingKeyContainer, forKey: .party)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CompositionAttester else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return mode == _other.mode
    && time == _other.time
    && party == _other.party
  }
  
   // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(mode)
    hasher.combine(time)
    hasher.combine(party)
  }
}
