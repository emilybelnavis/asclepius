//
//  CoverageEligibilityRequestItemDiagnosis.swift
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
 Applicable diagnosis; Patient diagnosis for which care is sought
 */
open class CoverageEligibilityRequestItemDiagnosis: BackboneElement {
  public enum DiagnosisX: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  public var diagnosis: DiagnosisX?
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    diagnosis: DiagnosisX? = nil
  ) {
    self.init()
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case diagnosisCodableConcept
    case diagnosisReference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempDiagnosis: DiagnosisX?
    if let diagnosisCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .diagnosisCodableConcept) {
      if tempDiagnosis != nil {
        throw DecodingError.dataCorruptedError(forKey: .diagnosisCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"diagnosis\"")
      }
      tempDiagnosis = .codableConcept(diagnosisCodableConcept)
    }
    
    if let diagnosisReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .diagnosisReference) {
      if tempDiagnosis != nil {
        throw DecodingError.dataCorruptedError(forKey: .diagnosisReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"diagnosis\"")
      }
      tempDiagnosis = .reference(diagnosisReference)
    }
    
    self.diagnosis = tempDiagnosis
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    if let enumDiagnosis = diagnosis {
      switch enumDiagnosis {
      case .codableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .diagnosisCodableConcept)
      case .reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .diagnosisReference)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligibilityRequestItemDiagnosis else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return diagnosis == _other.diagnosis
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(diagnosis)
  }
}
