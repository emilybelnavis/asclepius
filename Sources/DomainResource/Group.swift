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
    `extension`: [Extension]? = nil,
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
    self.`extension` = `extension`
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.identifier = try [Identifier](from: _container, forKeyIfPresent: .identifier)
    self.active = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .active, auxiliaryKey: ._active)
    self.type = try FHIRKitPrimitive<GroupType>(from: _container, forKey: .type, auxiliaryKey: ._type)
    self.actual = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKey: .actual, auxiliaryKey: ._actual)
    self.code = try CodableConcept(from: _container, forKeyIfPresent: .code)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .name, auxiliaryKey: ._name)
    self.quantity = try FHIRKitPrimitive<FHIRKitUnsignedInteger>(from: _container, forKeyIfPresent: .quantity, auxiliaryKey: ._quantity)
    self.managingEntity = try Reference(from: _container, forKeyIfPresent: .managingEntity)
    self.characteristic = try [GroupCharacteristic](from: _container, forKeyIfPresent: .characteristic)
    self.member = try [GroupMember](from: _container, forKeyIfPresent: .member)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try identifier?.encode(on: &_container, forKey: .identifier)
    try active?.encode(on: &_container, forKey: .active, auxiliaryKey: ._active)
    try type.encode(on: &_container, forKey: .type, auxiliaryKey: ._type)
    try actual.encode(on: &_container, forKey: .actual, auxiliaryKey: ._actual)
    try code?.encode(on: &_container, forKey: .code)
    try name?.encode(on: &_container, forKey: .name, auxiliaryKey: ._name)
    try quantity?.encode(on: &_container, forKey: .quantity, auxiliaryKey: ._quantity)
    try managingEntity?.encode(on: &_container, forKey: .managingEntity)
    try characteristic?.encode(on: &_container, forKey: .characteristic)
    try member?.encode(on: &_container, forKey: .member)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
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
