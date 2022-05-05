//
//  DataRequirementDateFilter.swift
//  FHIRKit
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

import FHIRKitCore

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
  public var value: ValueX?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    path: FHIRKitPrimitive<FHIRKitString>? = nil,
    searchParam: FHIRKitPrimitive<FHIRKitString>? = nil,
    value: ValueX? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
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
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempValue: ValueX?
    if let valueDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .valueDateTime, auxKey: ._valueDateTime) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDateTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .dateTime(valueDateTime)
    }
    
    if let valuePeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .valuePeriod) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valuePeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .period(valuePeriod)
    }
  
    if let valueDuration = try Duration(from: codingKeyContainer, forKeyIfPresent: .valueDuration) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueDuration, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempValue = .duration(valueDuration)
    }
    
    self.path = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .path, auxKey: ._path)
    self.searchParam = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .searchParam, auxKey: ._searchParam)
    self.value = tempValue
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try path?.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    try searchParam?.encode(on: &codingKeyContainer, forKey: .searchParam, auxKey: ._searchParam)
    
    if let enumValue = value {
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
    && value == _other.value
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(path)
    hasher.combine(searchParam)
    hasher.combine(value)
  }
}
