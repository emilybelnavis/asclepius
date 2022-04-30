//
//  CareTeamParticipant.swift
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
 Identifies all people and organizations who are expected to be involved in the care team
 */
open class CareTeamParticipant: BackboneElement {
  /// Type of involvement
  public var role: [CodableConcept]?
  
  /// Who is involved
  public var member: Reference?
  
  /// Organization of the practitioner
  public var onBehalfOf: Reference?
  
  /// Time period of the participant
  public var period: Period?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    role: [CodableConcept]? = nil,
    member: Reference? = nil,
    onBehalfOf: Reference? = nil,
    period: Period?
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.role = role
    self.member = member
    self.onBehalfOf = onBehalfOf
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case role
    case member
    case onBehalfOf
    case period
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.role = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .role)
    self.member = try Reference(from: codingKeyContainer, forKeyIfPresent: .member)
    self.onBehalfOf = try Reference(from: codingKeyContainer, forKeyIfPresent: .onBehalfOf)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try role?.encode(on: &codingKeyContainer, forKey: .role)
    try member?.encode(on: &codingKeyContainer, forKey: .member)
    try onBehalfOf?.encode(on: &codingKeyContainer, forKey: .onBehalfOf)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CareTeamParticipant else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return role == _other.role
    && member == _other.member
    && onBehalfOf == _other.onBehalfOf
    && period == _other.period
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(role)
    hasher.combine(member)
    hasher.combine(onBehalfOf)
    hasher.combine(period)
  }
}
