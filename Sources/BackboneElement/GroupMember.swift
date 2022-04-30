//
//  GroupMember.swift
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

/// Identifies the resource instances that are members of the group
open class GroupMember: BackboneElement {
  /// reference to the group member
  public var entity: Reference
  
  /// period that member belonged to group
  public var period: Period?
  
  /// if member is no longer in group
  public var inactive: FHIRKitPrimitive<FHIRKitBool>?
  
  public init(entity: Reference) {
    self.entity = entity
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    entity: Reference,
    period: Period? = nil,
    inactive: FHIRKitPrimitive<FHIRKitBool>? = nil
  ) {
    self.init(entity: entity)
    self.fhirExtension = fhirExtension
    self.id = id
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
    self.inactive = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .inactive, auxKey: ._inactive)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try entity.encode(on: &codingKeyContainer, forKey: .entity)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    try inactive?.encode(on: &codingKeyContainer, forKey: .inactive, auxKey: ._inactive)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(entity)
    hasher.combine(period)
    hasher.combine(inactive)
  }
}
