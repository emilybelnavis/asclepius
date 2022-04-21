//
//  MarketingStatus.swift
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
 The marketing status describes the date when a medicinal product is actually put on the market or the date
 as of which it is no longer available.
 */
open class MarketingStatus: BackboneElement {
  /// The country in which the marketing authorization has been granted shall be specified. It should be
  /// specified using the ISO-3166-1 alpha-2 code elements (e.g. CA)
  public var country: CodableConcept
  
  /// Where a Medicine's Regulatory Agency has granted a marketing authorization for which specific
  /// provisions within a jurisdiction apply. The jurisdiction can be specified using an appropriate controlled
  /// terminology. The term and controlled term identifier shall be specified.
  public var jurisdiction: CodableConcept?
  
  /// This attribute provides information on the status of the marketed on the medicinal product.
  /// See ISO/TS 20443 for more information and examples
  public var status: CodableConcept
  
  /// The date when the Medicinal Product is placed on the Market by the Marketing Authorization Holder
  /// (or where applicable, the manufacturer/distributor) in a country and/or jurisdiction shall be provided.
  /// A complete date consisting of day, month, and year shall be specified using the ISO 8601 date format.
  /// Note: "Placed on the market" refers to the release of the Medicinal product into the distribution chain
  public var dateRange: Period
  
  /// The date when the Medicinal Product is placed on the market by the Marketing Authorization Holder
  /// (or where applicable, the manufacturer/distributor) in a country and/or jurisdiction shall be provided.
  /// A complete date consisting of day, month, and year shall be specified using the ISO 8601 date format.
  /// Node: "Placed on the market" refers to the release of the Medicinal produt into the distribution chain.
  public var restoreDate: FHIRKitPrimitive<FHIRKitDateTime>?
  
  public init(country: CodableConcept, status: CodableConcept, dateRange: Period) {
    self.country = country
    self.status = status
    self.dateRange = dateRange
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    country: CodableConcept,
    jurisdiction: CodableConcept?,
    status: CodableConcept,
    dateRange: Period,
    restoreDate: FHIRKitPrimitive<FHIRKitDateTime>? = nil,
    modifierExtension: [Extension]? = nil
  ) {
    self.init(country: country, status: status, dateRange: dateRange)
    self.`extension` = `extension`
    self.id = id
    self.jurisdiction = jurisdiction
    self.restoreDate = restoreDate
    self.modifierExtension = modifierExtension
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.country = try CodableConcept(from: _container, forKey: .country)
    self.jurisdiction = try CodableConcept(from: _container, forKeyIfPresent: .jurisdiction)
    self.status = try CodableConcept(from: _container, forKey: .status)
    self.dateRange = try Period(from: _container, forKey: .dateRange)
    self.restoreDate = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKeyIfPresent: .restoreDate, auxiliaryKey: ._restoreDate)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try country.encode(on: &_container, forKey: .country)
    try jurisdiction?.encode(on: &_container, forKey: .jurisdiction)
    try status.encode(on: &_container, forKey: .status)
    try dateRange.encode(on: &_container, forKey: .dateRange)
    try restoreDate?.encode(on: &_container, forKey: .restoreDate, auxiliaryKey: ._restoreDate)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
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
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(country)
    hasher.combine(jurisdiction)
    hasher.combine(status)
    hasher.combine(dateRange)
    hasher.combine(restoreDate)
  }
}
