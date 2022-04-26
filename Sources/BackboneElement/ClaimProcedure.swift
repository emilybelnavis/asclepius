//
//  ClaimProcedure.swift
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
 Clinical procedures performed. Procedures performed on the patient relevant to the billing items with the claim
 */
open class ClaimProcedure: BackboneElement {
  public enum _Procedure: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  /// Procedure instance identifier
  public var sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>
  
  /// Category of procedure
  public var type: [CodableConcept]?
  
  /// When the procedure was perfomed
  public var date: FHIRKitPrimitive<FHIRKitDateTime>
  
  /// Specific clinical procedure
  public var procedure: _Procedure
  
  /// Unique device initializer
  public var udi: [Reference]?
  
  public init(sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>, date: FHIRKitPrimitive<FHIRKitDateTime>, procedure: _Procedure) {
    self.sequence = sequence
    self.date = date
    self.procedure = procedure
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    sequence: FHIRKitPrimitive<FHIRKitPositiveInteger>,
    type: [CodableConcept]? = nil,
    date: FHIRKitPrimitive<FHIRKitDateTime>,
    procedure: _Procedure,
    udi: [Reference]? = nil
  ) {
    self.init(sequence: sequence, date: date, procedure: procedure)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _procedure: _Procedure? = nil
    if let procedureCodableConcept = try CodableConcept(from: _container, forKeyIfPresent: .procedureCodableConcept) {
      if _procedure != nil {
        throw DecodingError.dataCorruptedError(forKey: .procedureCodableConcept, in: _container, debugDescription: "More than one value provided for \"procedure\"")
      }
      _procedure = .codableConcept(procedureCodableConcept)
    }
    
    if let procedureReference = try Reference(from: _container, forKeyIfPresent: .procedureReference) {
      if _procedure != nil {
        throw DecodingError.dataCorruptedError(forKey: .procedureReference, in: _container, debugDescription: "More than one value provided for \"procedure\"")
      }
      _procedure = .reference(procedureReference)
    }
    
    self.sequence = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKey: .sequence, auxiliaryKey: ._sequence)
    self.type = try [CodableConcept](from: _container, forKeyIfPresent: .type)
    self.date = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKey: .date, auxiliaryKey: ._date)
    self.procedure = _procedure!
    self.udi = try [Reference](from: _container, forKeyIfPresent: .udi)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    switch procedure {
    case .codableConcept(let _value):
      try _value.encode(on: &_container, forKey: .procedureCodableConcept)
    case .reference(let _value):
      try _value.encode(on: &_container, forKey: .procedureReference)
    }
    
    try sequence.encode(on: &_container, forKey: .sequence, auxiliaryKey: ._sequence)
    try type?.encode(on: &_container, forKey: .type)
    try date.encode(on: &_container, forKey: .date, auxiliaryKey: ._date)
    try udi?.encode(on: &_container, forKey: .udi)
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
    && procedure == _other.procedure
    && udi == _other.udi
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(type)
    hasher.combine(date)
    hasher.combine(procedure)
    hasher.combine(udi)
  }
}
