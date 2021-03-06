//
//  ContractContentDefinition.swift
//  Asclepius
//  Module: STU3
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
 Precursory content developed with a focus and intent of supporting the formation of a `Contract` instance,
 which may be associated and transformable into a `Contract`
 */
open class ContractContentDefinition: BackboneElement {
  /// Content structure and use
  public var type: CodeableConcept
  
  /// Detauled content type definition
  public var subType: CodeableConcept?
  
  /// Publisher entity
  public var publisher: Reference?
  
  /// Publication date
  public var publicationDate: AsclepiusPrimitive<AsclepiusDateTime>?
  
  /// None
  public var publicationStatus: AsclepiusPrimitive<ContractResourcePublicationStatusCodes>
  
  /// Publication ownership
  public var copyright: AsclepiusPrimitive<AsclepiusString>?
  
  public init(type: CodeableConcept, publicationStatus: AsclepiusPrimitive<ContractResourcePublicationStatusCodes>) {
    self.type = type
    self.publicationStatus = publicationStatus
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    type: CodeableConcept,
    subType: CodeableConcept? = nil,
    publisher: Reference? = nil,
    publicationDate: AsclepiusPrimitive<AsclepiusDateTime>? = nil,
    publicationStatus: AsclepiusPrimitive<ContractResourcePublicationStatusCodes>,
    copyright: AsclepiusPrimitive<AsclepiusString>? = nil
  ) {
    self.init(type: type, publicationStatus: publicationStatus)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.subType = subType
    self.publisher = publisher
    self.publicationDate = publicationDate
    self.copyright = copyright
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case subType
    case publisher
    case publicationDate; case _publicationDate
    case publicationStatus; case _publicationStatus
    case copyright; case _copyright
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try CodeableConcept(from: codingKeyContainer, forKey: .type)
    self.subType = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .subType)
    self.publisher = try Reference(from: codingKeyContainer, forKeyIfPresent: .publisher)
    self.publicationDate = try AsclepiusPrimitive<AsclepiusDateTime>(from: codingKeyContainer, forKeyIfPresent: .publicationDate, auxKey: ._publicationDate)
    self.publicationStatus = try AsclepiusPrimitive<ContractResourcePublicationStatusCodes>(from: codingKeyContainer, forKey: .publicationStatus, auxKey: ._publicationStatus)
    self.copyright = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .copyright, auxKey: ._copyright)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &codingKeyContainer, forKey: .type)
    try subType?.encode(on: &codingKeyContainer, forKey: .subType)
    try publisher?.encode(on: &codingKeyContainer, forKey: .publisher)
    try publicationDate?.encode(on: &codingKeyContainer, forKey: .publicationDate, auxKey: ._publicationDate)
    try publicationStatus.encode(on: &codingKeyContainer, forKey: .publicationStatus, auxKey: ._publicationStatus)
    try copyright?.encode(on: &codingKeyContainer, forKey: .copyright, auxKey: ._copyright)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractContentDefinition else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && subType == _other.subType
    && publisher == _other.publisher
    && publicationDate == _other.publicationDate
    && publicationStatus == _other.publicationStatus
    && copyright == _other.copyright
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(subType)
    hasher.combine(publisher)
    hasher.combine(publicationDate)
    hasher.combine(publicationStatus)
    hasher.combine(copyright)
  }
}
