//
//  DataRequirementDateFilter.swift
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
 What dates/date ranges are expected.
 
 Date filters specify additional constraints on the data in terms of the applicalble date range for specific
 elements. Each date filter specifies an additional constraint on the data.
 */
open class DataRequirementDateFilter: Element {
  /// all possible types for `Value`
  public enum ValueX: Hashable {
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case duration(Duration)
    case period(Period)
  }
  
  /// a date-valued attribute to filter on
  public var path: FHIRKitPrimitive<FHIRKitString>?
  
  /// a date valued parameter to search on
  public var searchParam: FHIRKitPrimitive<FHIRKitString>?
  
  /// the value of the filter as a period, datetime, or duration value
  public var valueX: ValueX?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    path: FHIRKitPrimitive<FHIRKitString>? = nil,
    searchParam: FHIRKitPrimitive<FHIRKitString>? = nil,
    valueX: ValueX? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.path = path
    self.searchParam = searchParam
    self.valueX = valueX
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case path; case _path
    case searchParam; case _searchParam
    case valueDateTime; case _valueDateTime
    case valueDuration
    case valuePeriod
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempValueX: ValueX?
    if let valueDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .valueDateTime, auxKey: ._valueDateTime) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDateTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .dateTime(valueDateTime)
    }
    
    if let valuePeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .valuePeriod) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .period(valuePeriod)
    }
  
    if let valueDuration = try Duration(from: codingKeyContainer, forKeyIfPresent: .valueDuration) {
      if tempValueX != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDuration, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValueX = .duration(valueDuration)
    }
    
    self.path = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .path, auxKey: ._path)
    self.searchParam = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .searchParam, auxKey: ._searchParam)
    self.valueX = tempValueX
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try path?.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    try searchParam?.encode(on: &codingKeyContainer, forKey: .searchParam, auxKey: ._searchParam)
    
    if let enumValue = valueX {
      switch enumValue {
      case .dateTime(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueDateTime, auxKey: ._valueDateTime)
      case .period(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valuePeriod)
      case .duration(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .valueDuration)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DataRequirementDateFilter else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return path == _other.path
    && searchParam == _other.searchParam
    && valueX == _other.valueX
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(path)
    hasher.combine(searchParam)
    hasher.combine(valueX)
  }
}
