//
//  GroupMember.swift
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

/// Identifies the resource instances that are members of the group
open class GroupMember: BackboneElement {
  /// reference to the group member
  public var entity: Reference
  
  /// period that member belonged to group
  public var period: Period?
  
  /// if member is no longer in group
  public var inactive: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  public init(entity: Reference) {
    self.entity = entity
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    entity: Reference,
    period: Period? = nil,
    inactive: AlexandriaHRMPrimitive<AlexandriaHRMBool>? = nil
  ) {
    self.init(entity: entity)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.period = period
    self.inactive = inactive
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case entity
    case period
    case inactive; case _inactive
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.entity = try Reference(from: codingKeyContainer, forKey: .entity)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    self.inactive = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .inactive, auxKey: ._inactive)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try entity.encode(on: &codingKeyContainer, forKey: .entity)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    try inactive?.encode(on: &codingKeyContainer, forKey: .inactive, auxKey: ._inactive)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? GroupMember else {
      return false
    }

    guard super.isEqual(to: _other) else {
      return false
    }
    
    return entity == _other.entity
    && period == _other.period
    && inactive == _other.inactive
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(entity)
    hasher.combine(period)
    hasher.combine(inactive)
  }
}
