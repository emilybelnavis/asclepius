//
//  MarketingStatus.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/**
 The marketing status describes the date when a medicinal product is actually put on the market or the date
 as of which it is no longer available.
 */
open class MarketingStatus: BackboneElement {
  /// The country in which the marketing authorization has been granted shall be specified. It should be
  /// specified using the ISO-3166-1 alpha-2 code elements (e.g. CA)
  public var country: CodeableConcept
  
  /// Where a Medicine's Regulatory Agency has granted a marketing authorization for which specific
  /// provisions within a jurisdiction apply. The jurisdiction can be specified using an appropriate controlled
  /// terminology. The term and controlled term identifier shall be specified.
  public var jurisdiction: CodeableConcept?
  
  /// This attribute provides information on the status of the marketed on the medicinal product.
  /// See ISO/TS 20443 for more information and examples
  public var status: CodeableConcept
  
  /// The date when the Medicinal Product is placed on the Market by the Marketing Authorization Holder
  /// (or where applicable, the manufacturer/distributor) in a country and/or jurisdiction shall be provided.
  /// A complete date consisting of day, month, and year shall be specified using the ISO 8601 date format.
  /// Note: "Placed on the market" refers to the release of the Medicinal product into the distribution chain
  public var dateRange: Period
  
  /// The date when the Medicinal Product is placed on the market by the Marketing Authorization Holder
  /// (or where applicable, the manufacturer/distributor) in a country and/or jurisdiction shall be provided.
  /// A complete date consisting of day, month, and year shall be specified using the ISO 8601 date format.
  /// Node: "Placed on the market" refers to the release of the Medicinal produt into the distribution chain.
  public var restoreDate: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>?
  
  public init(country: CodeableConcept, status: CodeableConcept, dateRange: Period) {
    self.country = country
    self.status = status
    self.dateRange = dateRange
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    country: CodeableConcept,
    jurisdiction: CodeableConcept?,
    status: CodeableConcept,
    dateRange: Period,
    restoreDate: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>? = nil
  ) {
    self.init(country: country, status: status, dateRange: dateRange)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.jurisdiction = jurisdiction
    self.restoreDate = restoreDate
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case country
    case jurisdiction
    case status
    case dateRange
    case restoreDate; case _restoreDate
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.country = try CodeableConcept(from: codingKeyContainer, forKey: .country)
    self.jurisdiction = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .jurisdiction)
    self.status = try CodeableConcept(from: codingKeyContainer, forKey: .status)
    self.dateRange = try Period(from: codingKeyContainer, forKey: .dateRange)
    self.restoreDate = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .restoreDate, auxKey: ._restoreDate)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try country.encode(on: &codingKeyContainer, forKey: .country)
    try jurisdiction?.encode(on: &codingKeyContainer, forKey: .jurisdiction)
    try status.encode(on: &codingKeyContainer, forKey: .status)
    try dateRange.encode(on: &codingKeyContainer, forKey: .dateRange)
    try restoreDate?.encode(on: &codingKeyContainer, forKey: .restoreDate, auxKey: ._restoreDate)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? MarketingStatus else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return country == _other.country
    && jurisdiction == _other.jurisdiction
    && status == _other.status
    && dateRange == _other.dateRange
    && restoreDate == _other.restoreDate
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(country)
    hasher.combine(jurisdiction)
    hasher.combine(status)
    hasher.combine(dateRange)
    hasher.combine(restoreDate)
  }
}
