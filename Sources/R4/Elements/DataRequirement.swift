//
//  DataRequirement.swift
//  Asclepius
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

import AsclepiusCore

/**
 Describes a required data item for evaluation in terms of the type of date, along with optional code or
 date-based filters of the data
 */
open class DataRequirement: Element {
  /// all possible types for `Subject`
  public enum SubjectX: Hashable {
    case codeableConcept(CodeableConcept)
    case reference(Reference)
  }
  
  /// type of the required data
  public var type: AsclepiusPrimitive<AsclepiusString>
  
  /// the profile of the required data
  public var profile: [AsclepiusPrimitive<Canonical>]?
  
  /// One of `Subject`; e.g. Patient, practitioner, related person, etc...
  public var subject: SubjectX?
  
  /// indicates specific structure elemtnets that are referenced by the knowledge module
  public var mustSupport: [AsclepiusPrimitive<AsclepiusString>]?
  
  /// what codes are expected
  public var codeFilter: [DataRequirementCodeFilter]?
  
  /// what dates/date ranges are expected
  public var dateFilter: [DataRequirementDateFilter]?
  
  /// number of results
  public var limit: AsclepiusPrimitive<AsclepiusPositiveInteger>?
  
  /// order of the results
  public var sort: [DataRequirementSort]?
  
  public init(type: AsclepiusPrimitive<AsclepiusString>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    type: AsclepiusPrimitive<AsclepiusString>,
    profile: [AsclepiusPrimitive<Canonical>]? = nil,
    subject: SubjectX? = nil,
    mustSupport: [AsclepiusPrimitive<AsclepiusString>]? = nil,
    codeFilter: [DataRequirementCodeFilter]? = nil,
    dateFilter: [DataRequirementDateFilter]? = nil,
    limit: AsclepiusPrimitive<AsclepiusPositiveInteger>? = nil,
    sort: [DataRequirementSort]? = nil
  ) {
    self.init(type: type)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
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
    case subjectCodeableConcept
    case subjectReference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempSubject: SubjectX?
    if let subjectCodeableConcept = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .subjectCodeableConcept) {
      if tempSubject != nil {
        throw DecodingError.dataCorruptedError(forKey: .subjectCodeableConcept, in: codingKeyContainer, debugDescription: "More than one value provided for \"subject\"")
      }
      tempSubject = .codeableConcept(subjectCodeableConcept)
    }
    
    if let subjectReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .subjectReference) {
      if tempSubject != nil {
        throw DecodingError.dataCorruptedError(forKey: .subjectReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"subject\"")
      }
      tempSubject = .reference(subjectReference)
    }
    
    self.type = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.profile = try [AsclepiusPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .profile, auxKey: ._profile)
    self.subject = tempSubject
    self.mustSupport = try [AsclepiusPrimitive<AsclepiusString>](from: codingKeyContainer, forKeyIfPresent: .mustSupport, auxKey: ._mustSupport)
    self.codeFilter = try [DataRequirementCodeFilter](from: codingKeyContainer, forKeyIfPresent: .codeFilter)
    self.dateFilter = try [DataRequirementDateFilter](from: codingKeyContainer, forKeyIfPresent: .dateFilter)
    self.limit = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .limit, auxKey: ._limit)
    self.sort = try [DataRequirementSort](from: codingKeyContainer, forKeyIfPresent: .sort)
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
  
    if let enumSubject = subject {
      switch enumSubject {
      case .codeableConcept(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .subjectCodeableConcept)
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
  override public func isEqual(to _other: Any?) -> Bool {
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
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
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
