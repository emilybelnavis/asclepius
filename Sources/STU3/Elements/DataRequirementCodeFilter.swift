//
//  DataRequirementCodeFilter.swift
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
 What codes are expected.
 
 Code filters specifiy additional constraints on the data, specifying the value set of interest for a particular
 element of the data. Each code filter defines an additional constraint onf the data, i.e. code filters are
 `AND` not `OR`
 */
open class DataRequirementCodeFilter: Element {
  /// A code-valued attribute to filter on
  public var path: AsclepiusPrimitive<AsclepiusString>?
  
  /// A coded parameter to search on
  public var searchParam: AsclepiusPrimitive<AsclepiusString>?
  
  /// Valueset for the filter
  public var valueSet: AsclepiusPrimitive<Canonical>?
  
  /// What code is expected
  public var code: [Coding]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    path: AsclepiusPrimitive<AsclepiusString>? = nil,
    searchParam: AsclepiusPrimitive<AsclepiusString>? = nil,
    valueSet: AsclepiusPrimitive<Canonical>? = nil,
    code: [Coding]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.path = path
    self.searchParam = searchParam
    self.valueSet = valueSet
    self.code = code
  }
  
  // MARK: - Coding
  private enum CodingKeys: String, CodingKey {
    case path; case _path
    case searchParam; case _searchParam
    case valueSet; case _valueSet
    case code
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.path = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .path, auxKey: ._path)
    self.searchParam = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .searchParam, auxKey: ._searchParam)
    self.valueSet = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .valueSet, auxKey: .valueSet)
    self.code = try [Coding](from: codingKeyContainer, forKeyIfPresent: .code)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try path?.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    try searchParam?.encode(on: &codingKeyContainer, forKey: .searchParam, auxKey: ._searchParam)
    try valueSet?.encode(on: &codingKeyContainer, forKey: .valueSet, auxKey: ._valueSet)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DataRequirementCodeFilter else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return path == _other.path
    && searchParam == _other.searchParam
    && valueSet == _other.valueSet
    && code == _other.code
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(path)
    hasher.combine(searchParam)
    hasher.combine(valueSet)
    hasher.combine(code)
  }
}
