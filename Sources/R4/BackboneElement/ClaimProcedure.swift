//
//  ClaimProcedure.swift
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
 Clinical procedures performed. Procedures performed on the patient relevant to the billing items with the claim
 */
open class ClaimProcedure: BackboneElement {
  public enum ProcedureX: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  /// Procedure instance identifier
  public var sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>
  
  /// Category of procedure
  public var type: [CodableConcept]?
  
  /// When the procedure was perfomed
  public var date: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>
  
  /// Specific clinical procedure
  public var procedureX: ProcedureX
  
  /// Unique device initializer
  public var udi: [Reference]?
  
  public init(sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>, date: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>, procedureX: ProcedureX) {
    self.sequence = sequence
    self.date = date
    self.procedureX = procedureX
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>,
    type: [CodableConcept]? = nil,
    date: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>,
    procedureX: ProcedureX,
    udi: [Reference]? = nil
  ) {
    self.init(sequence: sequence, date: date, procedureX: procedureX)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.type = type
    self.udi = udi
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case type
    case date; case _date
    case procedureCodableConcept
    case procedureReference
    case udi
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempProcedureX: ProcedureX?
    if let procedureCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .procedureCodableConcept) {
      if tempProcedureX != nil {
        throw DecodingError.dataCorruptedError(forKey: .procedureCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"procedure\"")
      }
      tempProcedureX = .codableConcept(procedureCodableConcept)
    }
    
    if let procedureReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .procedureReference) {
      if tempProcedureX != nil {
        throw DecodingError.dataCorruptedError(forKey: .procedureReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"procedure\"")
      }
      tempProcedureX = .reference(procedureReference)
    }
    
    self.sequence = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.type = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .type)
    self.date = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKey: .date, auxKey: ._date)
    self.procedureX = tempProcedureX!
    self.udi = try [Reference](from: codingKeyContainer, forKeyIfPresent: .udi)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch procedureX {
    case .codableConcept(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .procedureCodableConcept)
    case .reference(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .procedureReference)
    }
    
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try date.encode(on: &codingKeyContainer, forKey: .date, auxKey: ._date)
    try udi?.encode(on: &codingKeyContainer, forKey: .udi)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimProcedure else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && type == _other.type
    && date == _other.date
    && procedureX == _other.procedureX
    && udi == _other.udi
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(type)
    hasher.combine(date)
    hasher.combine(procedureX)
    hasher.combine(udi)
  }
}
