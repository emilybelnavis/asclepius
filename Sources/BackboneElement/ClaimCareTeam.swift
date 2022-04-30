//
//  ClaimCareTeam.swift
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
 Members of the care team - the members of the team that provided the products and services
 */
open class ClaimCareTeam: BackboneElement {
  /// Order of care team
  public var sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Practitioner or organization
  public var provider: Reference
  
  /// Indicator of the lead practitioner
  public var responsible: FHIRKitPrimitive<FHIRKitBool>?
  
  /// Function within the team
  public var role: CodableConcept?
  
  /// Practitioner credential or specialization
  public var qualification: CodableConcept?
  
  public init(sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, provider: Reference) {
    self.sequence = sequence
    self.provider = provider
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    provider: Reference,
    responsible: FHIRKitPrimitive<FHIRKitBool>? = nil,
    role: CodableConcept? = nil,
    qualification: CodableConcept? = nil
  ) {
    self.init(sequence: sequence, provider: provider)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.responsible = responsible
    self.qualification = qualification
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case provider
    case responsible; case _responsible
    case role
    case qualification
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.sequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.provider = try Reference(from: codingKeyContainer, forKey: .provider)
    self.responsible = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .responsible, auxKey: ._responsible)
    self.role = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .role)
    self.qualification = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .qualification)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try provider.encode(on: &codingKeyContainer, forKey: .provider)
    try responsible?.encode(on: &codingKeyContainer, forKey: .responsible, auxKey: ._responsible)
    try role?.encode(on: &codingKeyContainer, forKey: .role)
    try qualification?.encode(on: &codingKEyContainer, forKey: .qualification)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimCareTeam else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && provider == _other.provider
    && responsible == _other.responsible
    && role == _other.role
    && qualification == _other.qualification
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(provider)
    hasher.combine(responsible)
    hasher.combine(role)
    hasher.combine(qualification)
  }
}
