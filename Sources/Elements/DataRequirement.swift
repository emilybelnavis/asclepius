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
  public enum Subject: Hashable {
    case codableConcept(CodableConcept)
    case reference(Reference)
  }
  
  /// type of the required data
  public var type: FHIRKitPrimitive<FHIRKitString>
  
  /// the profile of the required data
  public var profile: [FHIRKitPrimitive<Canonical>]?
  
  /// One of `Subject`; e.g. Patient, practitioner, related person, etc...
  public var subject: Subject?
  
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
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<FHIRKitString>,
    profile: [FHIRKitPrimitive<Canonical>]? = nil,
    subject: Subject? = nil,
    mustSupport: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    codeFilter: [DataRequirementCodeFilter]? = nil,
    dateFilter: [DataRequirementDateFilter]? = nil,
    limit: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    sort: [DataRequirementSort]? = nil
  ) {
    self.init(type: type)
    self.`extension` = `extension`
    self.id = id
    self.profile = profile
    self.subject = subject
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKey: .type, auxiliaryKey: ._type)
    self.profile = try [FHIRKitPrimitive<Canonical>](from: _container, forKeyIfPresent: .profile, auxiliaryKey: ._profile)
    self.mustSupport = try [FHIRKitPrimitive<FHIRKitString>](from: _container, forKeyIfPresent: .mustSupport, auxiliaryKey: ._mustSupport)
    self.codeFilter = try [DataRequirementCodeFilter](from: _container, forKeyIfPresent: .codeFilter)
    self.dateFilter = try [DataRequirementDateFilter](from: _container, forKeyIfPresent: .dateFilter)
    self.limit = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: _container, forKeyIfPresent: .limit, auxiliaryKey: ._limit)
    self.sort = try [DataRequirementSort](from: _container, forKeyIfPresent: .sort)
    
    var tempSubject: Subject?
    if let subjectCodableConcept = try CodableConcept(from: _container, forKeyIfPresent: .subjectCodableConcept) {
      if tempSubject != nil {
        throw DecodingError.dataCorruptedError(forKey: .subjectCodableConcept, in: _container, debugDescription: "More than one value provided for \"subject\"")
      }
      tempSubject = .codableConcept(subjectCodableConcept)
    }
    
    if let subjectReference = try Reference(from: _container, forKeyIfPresent: .subjectReference) {
      if tempSubject != nil {
        throw DecodingError.dataCorruptedError(forKey: .subjectReference, in: _container, debugDescription: "More than one value provided for \"subject\"")
      }
      tempSubject = .reference(subjectReference)
    }
    
    self.subject = tempSubject
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &_container, forKey: .type, auxiliaryKey: ._type)
    try profile?.encode(on: &_container, forKey: .profile, auxiliaryKey: ._profile)
    try mustSupport?.encode(on: &_container, forKey: .mustSupport, auxiliaryKey: ._mustSupport)
    try codeFilter?.encode(on: &_container, forKey: .codeFilter)
    try dateFilter?.encode(on: &_container, forKey: .dateFilter)
    try limit?.encode(on: &_container, forKey: .limit, auxiliaryKey: ._limit)
    try sort?.encode(on: &_container, forKey: .sort)
    
    if let _enum = subject {
      switch _enum {
      case .codableConcept(let _value):
        try _value.encode(on: &_container, forKey: .subjectCodableConcept)
      case .reference(let _value):
        try _value.encode(on: &_container, forKey: .subjectReference)
      }
    }
  
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DataRequirement else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && profile == _other.profile
    && subject == _other.subject
    && mustSupport == _other.mustSupport
    && codeFilter == _other.codeFilter
    && dateFilter == _other.dateFilter
    && limit == _other.limit
    && sort == _other.sort
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(profile)
    hasher.combine(subject)
    hasher.combine(mustSupport)
    hasher.combine(codeFilter)
    hasher.combine(dateFilter)
    hasher.combine(limit)
    hasher.combine(sort)
  }
}
