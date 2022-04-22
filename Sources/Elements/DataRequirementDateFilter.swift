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
  public enum Value: Hashable {
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case duration(Duration)
    case period(Period)
  }
  
  /// a date-valued attribute to filter on
  public var path: FHIRKitPrimitive<FHIRKitString>?
  
  /// a date valued parameter to search on
  public var searchParam: FHIRKitPrimitive<FHIRKitString>?
  
  /// the value of the filter as a period, datetime, or duration value
  public var value: Value?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    path: FHIRKitPrimitive<FHIRKitString>? = nil,
    searchParam: FHIRKitPrimitive<FHIRKitString>? = nil,
    value: Value? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.id = id
    self.path = path
    self.searchParam = searchParam
    self.value = value
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.path = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .path, auxiliaryKey: ._path)
    self.searchParam = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .searchParam, auxiliaryKey: ._searchParam)
    
    var tempValue: Value?
    if let valueDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKeyIfPresent: .valueDateTime, auxiliaryKey: ._valueDateTime) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDateTime, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      
      tempValue = .dateTime(valueDateTime)
    }
    
    if let valuePeriod = try Period(from: _container, forKeyIfPresent: .valuePeriod) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePeriod, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      
      tempValue = .period(valuePeriod)
    }
  
    if let valueDuration = try Duration(from: _container, forKeyIfPresent: .valueDuration) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDuration, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      
      tempValue = .duration(valueDuration)
    }
    
    self.value = tempValue
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try path?.encode(on: &_container, forKey: .path, auxiliaryKey: ._path)
    try searchParam?.encode(on: &_container, forKey: .searchParam, auxiliaryKey: ._searchParam)
    
    if let _enum = value {
      switch _enum {
        case .dateTime(let _value):
          try _value.encode(on: &_container, forKey: .valueDateTime, auxiliaryKey: ._valueDateTime)
        case .period(let _value):
          try _value.encode(on: &_container, forKey: .valuePeriod)
        case .duration(let _value):
          try _value.encode(on: &_container, forKey: .valueDuration)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DataRequirementDateFilter else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return path == _other.path
    && searchParam == _other.searchParam
    && value == _other.value
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(path)
    hasher.combine(searchParam)
    hasher.combine(value)
  }
}
