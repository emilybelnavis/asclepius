//
//  Group.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import FHIRKitCore

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
  public var active: FHIRKitPrimitive<FHIRKitBool>?
  
  /// identifies the broad classification of the kind of resources the group includes
  public var type: FHIRKitPrimitive<GroupType>
  
  /// descriptive or actual
  public var actual: FHIRKitPrimitive<FHIRKitBool>
  
  /// kind of group members
  public var code: CodableConcept?
  
  /// label for group
  public var name: FHIRKitPrimitive<FHIRKitString>?
  
  /// number of members
  public var quantity: FHIRKitPrimitive<FHIRKitUnsignedInteger>?
  
  /// entity that is the custodian of the group's definition
  public var managingEntity: Reference?
  
  /// include/exclude group members by trait
  public var characteristic: [GroupCharacteristic]?
  
  // who/what is in group
  public var member: [GroupMember]?
  
  public init(type: FHIRKitPrimitive<GroupType>, actual: FHIRKitPrimitive<FHIRKitBool>) {
    self.type = type
    self.actual = actual
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    identifier: [Identifier]? = nil,
    active: FHIRKitPrimitive<FHIRKitBool>? = nil,
    type: FHIRKitPrimitive<GroupType>,
    actual: FHIRKitPrimitive<FHIRKitBool>,
    code: CodableConcept? = nil,
    name: FHIRKitPrimitive<FHIRKitString>? = nil,
    quantity: FHIRKitPrimitive<FHIRKitUnsignedInteger>? = nil,
    managingEntity: Reference? = nil,
    characteristic: [GroupCharacteristic]? = nil,
    member: [GroupMember]? = nil
  ) {
    self.init(type: type, actual: actual)
    self.fhirExtension = fhirExtension
    self.id = id
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
    self.active = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .active, auxKey: ._active)
    self.type = try FHIRKitPrimitive<GroupType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.actual = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKey: .actual, auxKey: ._actual)
    self.code = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.quantity = try FHIRKitPrimitive<FHIRKitUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .quantity, auxKey: ._quantity)
    self.managingEntity = try Reference(from: codingKeyContainer, forKeyIfPresent: .managingEntity)
    self.characteristic = try [GroupCharacteristic](from: codingKeyContainer, forKeyIfPresent: .characteristic)
    self.member = try [GroupMember](from: codingKeyContainer, forKeyIfPresent: .member)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
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
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
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
