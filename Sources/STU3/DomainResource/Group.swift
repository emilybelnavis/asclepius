//
//  Group.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/**
 Represents a defined collection of entities that may be discussed or acted upon collectively, but which are
 not expected to act collectively, and are not formally or legally recognized; i.e. a collection of entties that isn't
 an organization
 */
open class Group: DomainResource {
  override open class var resourceType: ResourceType { return .group }
  
  /// Unique ID
  public var identifier: [Identifier]?
  
  /// whether this group's record is in active use
  public var active: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  /// identifies the broad classification of the kind of resources the group includes
  public var type: AlexandriaHRMPrimitive<GroupType>
  
  /// descriptive or actual
  public var actual: AlexandriaHRMPrimitive<AlexandriaHRMBool>
  
  /// kind of group members
  public var code: CodeableConcept?
  
  /// label for group
  public var name: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// number of members
  public var quantity: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>?
  
  /// entity that is the custodian of the group's definition
  public var managingEntity: Reference?
  
  /// include/exclude group members by trait
  public var characteristic: [GroupCharacteristic]?
  
  // who/what is in group
  public var member: [GroupMember]?
  
  public init(type: AlexandriaHRMPrimitive<GroupType>, actual: AlexandriaHRMPrimitive<AlexandriaHRMBool>) {
    self.type = type
    self.actual = actual
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    identifier: [Identifier]? = nil,
    active: AlexandriaHRMPrimitive<AlexandriaHRMBool>? = nil,
    type: AlexandriaHRMPrimitive<GroupType>,
    actual: AlexandriaHRMPrimitive<AlexandriaHRMBool>,
    code: CodeableConcept? = nil,
    name: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    quantity: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>? = nil,
    managingEntity: Reference? = nil,
    characteristic: [GroupCharacteristic]? = nil,
    member: [GroupMember]? = nil
  ) {
    self.init(type: type, actual: actual)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.identifier = identifier
    self.active = active
    self.code = code
    self.name = name
    self.quantity = quantity
    self.managingEntity = managingEntity
    self.characteristic = characteristic
    self.member = member
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case identifier
    case active; case _active
    case type; case _type
    case actual; case _actual
    case code
    case name; case _name
    case quantity; case _quantity
    case managingEntity
    case characteristic
    case member
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.identifier = try [Identifier](from: codingKeyContainer, forKeyIfPresent: .identifier)
    self.active = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .active, auxKey: ._active)
    self.type = try AlexandriaHRMPrimitive<GroupType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.actual = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKey: .actual, auxKey: ._actual)
    self.code = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    self.name = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.quantity = try AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .quantity, auxKey: ._quantity)
    self.managingEntity = try Reference(from: codingKeyContainer, forKeyIfPresent: .managingEntity)
    self.characteristic = try [GroupCharacteristic](from: codingKeyContainer, forKeyIfPresent: .characteristic)
    self.member = try [GroupMember](from: codingKeyContainer, forKeyIfPresent: .member)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try active?.encode(on: &codingKeyContainer, forKey: .active, auxKey: ._active)
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try actual.encode(on: &codingKeyContainer, forKey: .actual, auxKey: ._actual)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try quantity?.encode(on: &codingKeyContainer, forKey: .quantity, auxKey: ._quantity)
    try managingEntity?.encode(on: &codingKeyContainer, forKey: .managingEntity)
    try characteristic?.encode(on: &codingKeyContainer, forKey: .characteristic)
    try member?.encode(on: &codingKeyContainer, forKey: .member)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Group else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return identifier == _other.identifier
    && active == _other.active
    && type == _other.type
    && actual == _other.actual
    && code == _other.code
    && name == _other.name
    && quantity == _other.quantity
    && managingEntity == _other.managingEntity
    && characteristic == _other.characteristic
    && member == _other.member
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(identifier)
    hasher.combine(active)
    hasher.combine(type)
    hasher.combine(actual)
    hasher.combine(code)
    hasher.combine(name)
    hasher.combine(quantity)
    hasher.combine(managingEntity)
    hasher.combine(characteristic)
    hasher.combine(member)
  }
}
