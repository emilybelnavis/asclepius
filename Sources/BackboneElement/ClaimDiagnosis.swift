//
//  ClaimDiagnosis.swift
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
 Pertinent diagnosis information - Information about diagnoses that are relevant to the claim item(s).
 */
open class ClaimDiagnosis: BackboneElement {
  public enum _Diagnosis: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  /// Diagnosis instance identifier
  public var sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Nature of illness or problem
  public var diagnosis: _Diagnosis
  
  /// Timing or nature of the diagnosis
  public var type: [CodableConcept]?
  
  /// Present on admission
  public var onAdmission: CodableConcept?
  
  /// Package billing code
  public var packageCode: CodableConcept?
  
  public init(sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, diagnosis: _Diagnosis) {
    self.sequence = sequence
    self.diagnosis = diagnosis
    super.init()
  }

  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    diagnosis: _Diagnosis,
    type: [CodableConcept]? = nil,
    onAdmission: CodableConcept? = nil,
    packageCode: CodableConcept? = nil
  ) {
    self.init(sequence: sequence, diagnosis: diagnosis)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.type = type
    self.onAdmission = onAdmission
    self.packageCode = packageCode
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case diagnosisCodableConcept
    case diagnosisReference
    case type
    case onAdmission
    case packageCode
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _diagnosis: _Diagnosis? = nil
    if let diagnosisCodableConcept = try CodableConcept(from: _container, forKeyIfPresent: .diagnosisCodableConcept) {
      if _diagnosis != nil {
        throw DecodingError.dataCorruptedError(forKey: .diagnosisCodableConcept, in: _container, debugDescription: "More than one value provided for \"diagnosis\"")
      }
      _diagnosis = .codableConcept(diagnosisCodableConcept)
    }
    
    if let diagnosisReference = try Reference(from: _container, forKeyIfPresent: .diagnosisReference) {
      if _diagnosis != nil {
        throw DecodingError.dataCorruptedError(forKey: .diagnosisReference, in: _container, debugDescription: "More than one value provided for \"diagnosis\"")
      }
      _diagnosis = .reference(diagnosisReference)
    }
    
    self.sequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKey: .sequence, auxiliaryKey: ._sequence)
    self.diagnosis = _diagnosis!
    self.type = try [CodableConcept](from: _container, forKeyIfPresent: .type)
    self.onAdmission = try CodableConcept(from: _container, forKeyIfPresent: .onAdmission)
    self.packageCode = try CodableConcept(from: _container, forKeyIfPresent: .packageCode)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    switch diagnosis {
    case .codableConcept(let _value):
      try _value.encode(on: &_container, forKey: .diagnosisCodableConcept)
    case .reference(let _value):
      try _value.encode(on: &_container, forKey: .diagnosisReference)
    }
    
    try sequence.encode(on: &_container, forKey: .sequence, auxiliaryKey: ._sequence)
    try type?.encode(on: &_container, forKey: .type)
    try onAdmission?.encode(on: &_container, forKey: .onAdmission)
    try packageCode?.encode(on: &_container, forKey: .packageCode)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimDiagnosis else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && diagnosis == _other.diagnosis
    && type == _other.type
    && onAdmission == _other.onAdmission
    && packageCode == _other.packageCode
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(diagnosis)
    hasher.combine(type)
    hasher.combine(onAdmission)
    hasher.combine(packageCode)
  }
}
