//
//  ContactPoint.swift
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
 Details of a Technology mediated contact point (phone, fax, email, etc.)
 */
open class ContactPoint: Element {
  /// Telecommunications form for contact point
  public var system: AlexandriaHRMPrimitive<ContactPointSystem>?
  
  /// The actual contact point details
  public var value: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Identifies the purpose for the contact point
  public var use: AlexandriaHRMPrimitive<ContactPointUse>?
  
  /// Specified preferred order of use (1 = highest)
  public var rank: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>?
  
  /// Time period when the contact point was/is in use
  public var period: Period?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    system: AlexandriaHRMPrimitive<ContactPointSystem>? = nil,
    value: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    use: AlexandriaHRMPrimitive<ContactPointUse>? = nil,
    rank: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>? = nil,
    period: Period? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.system = system
    self.value = value
    self.use = use
    self.rank = rank
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case system; case _system
    case value; case _value
    case use; case _use
    case rank; case _rank
    case period
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.system = try AlexandriaHRMPrimitive<ContactPointSystem>(from: codingKeyContainer, forKeyIfPresent: .system, auxKey: ._system)
    self.value = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    self.use = try AlexandriaHRMPrimitive<ContactPointUse>(from: codingKeyContainer, forKeyIfPresent: .use, auxKey: ._use)
    self.rank = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: ._rank, auxKey: ._rank)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try system?.encode(on: &codingKeyContainer, forKey: .system, auxKey: ._system)
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try use?.encode(on: &codingKeyContainer, forKey: .use, auxKey: ._use)
    try rank?.encode(on: &codingKeyContainer, forKey: .rank, auxKey: ._rank)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContactPoint else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return system == _other.system
    && value == _other.value
    && use == _other.use
    && rank == _other.rank
    && period == _other.period
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(system)
    hasher.combine(value)
    hasher.combine(use)
    hasher.combine(rank)
    hasher.combine(period)
  }
}
