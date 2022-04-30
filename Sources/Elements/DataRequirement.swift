//
//  DataRequirement.swift
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
 Describes a required data item for evaluation in terms of the type of date, along with optional code or
 date-based filters of the data
 */
open class DataRequirement: Element {
  /// all possible types for `Subject`
  public enum SubjectX: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  /// type of the required data
  public var type: FHIRKitPrimitive<FHIRKitString>
  
  /// the profile of the required data
  public var profile: [FHIRKitPrimitive<Canonical>]?
  
  /// One of `Subject`; e.g. Patient, practitioner, related person, etc...
  public var subjectX: SubjectX?
  
  /// indicates specific structure elemtnets that are referenced by the knowledge module
  public var mustSupport: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// what codes are expected
  public var codeFilter: [DataRequirementCodeFilter]?
  
  /// what dates/date ranges are expected
  public var dateFilter: [DataRequirementDateFilter]?
  
  /// number of results
  public var limit: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  /// order of the results
  public var sort: [DataRequirementSort]?
  
  public init(type: FHIRKitPrimitive<FHIRKitString>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<FHIRKitString>,
    profile: [FHIRKitPrimitive<Canonical>]? = nil,
    subjectX: SubjectX? = nil,
    mustSupport: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    codeFilter: [DataRequirementCodeFilter]? = nil,
    dateFilter: [DataRequirementDateFilter]? = nil,
    limit: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    sort: [DataRequirementSort]? = nil
  ) {
    self.init(type: type)
    self.fhirExtension = fhirExtension
    self.id = id
    self.profile = profile
    self.subjectX = subjectX
    self.mustSupport = mustSupport
    self.codeFilter = codeFilter
    self.dateFilter = dateFilter
    self.limit = limit
    self.sort = sort
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case profile; case _profile
    case mustSupport; case _mustSupport
    case codeFilter
    case dateFilter
    case limit; case _limit
    case sort
    case subjectCodableConcept
    case subjectReference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempSubjectX: SubjectX?
    if let subjectCodableConcept = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .subjectCodableConcept) {
      if tempSubjectX != nil {
        throw DecodingError.dataCorruptedError(forKey: .subjectCodableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"subject\"")
      }
      tempSubjectX = .codableConcept(subjectCodableConcept)
    }
    
    if let subjectReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .subjectReference) {
      if tempSubjectX != nil {
        throw DecodingError.dataCorruptedError(forKey: .subjectReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"subject\"")
      }
      tempSubjectX = .reference(subjectReference)
    }
    
    self.type = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.profile = try [FHIRKitPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .profile, auxKey: ._profile)
    self.subjectX = tempSubjectX
    self.mustSupport = try [FHIRKitPrimitive<FHIRKitString>](from: codingKeyContainer, forKeyIfPresent: .mustSupport, auxKey: ._mustSupport)
    self.codeFilter = try [DataRequirementCodeFilter](from: codingKeyContainer, forKeyIfPresent: .codeFilter)
    self.dateFilter = try [DataRequirementDateFilter](from: codingKeyContainer, forKeyIfPresent: .dateFilter)
    self.limit = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .limit, auxKey: ._limit)
    self.sort = try [DataRequirementSort](from: codingKeyContainer, forKeyIfPresent: .sort)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
  
    if let enumSubject = subjectX {
      switch enumSubject {
      case .codableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .subjectCodableConcept)
      case .reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .subjectReference)
      }
    }
  
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try profile?.encode(on: &codingKeyContainer, forKey: .profile, auxKey: ._profile)
    try mustSupport?.encode(on: &codingKeyContainer, forKey: .mustSupport, auxKey: ._mustSupport)
    try codeFilter?.encode(on: &codingKeyContainer, forKey: .codeFilter)
    try dateFilter?.encode(on: &codingKeyContainer, forKey: .dateFilter)
    try limit?.encode(on: &codingKeyContainer, forKey: .limit, auxKey: ._limit)
    try sort?.encode(on: &codingKeyContainer, forKey: .sort)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DataRequirement else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && profile == _other.profile
    && subjectX == _other.subjectX
    && mustSupport == _other.mustSupport
    && codeFilter == _other.codeFilter
    && dateFilter == _other.dateFilter
    && limit == _other.limit
    && sort == _other.sort
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(profile)
    hasher.combine(subjectX)
    hasher.combine(mustSupport)
    hasher.combine(codeFilter)
    hasher.combine(dateFilter)
    hasher.combine(limit)
    hasher.combine(sort)
  }
}
