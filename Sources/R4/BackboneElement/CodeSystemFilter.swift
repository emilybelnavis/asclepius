//
//  CodeSystemFilter.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/**
 A filter that can be used in a value set compose statement when selecting concepts using a filter
 */
open class CodeSystemFilter: BackboneElement {
  /// Code that identifies the filter
  public var code: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// How or why the filter is used
  public var fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// List of operators that can be used with the filter
  public var filterOperator: [AlexandriaHRMPrimitive<FilterOperator>]
  
  /// What to use for the value
  public var value: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  public init(code: AlexandriaHRMPrimitive<AlexandriaHRMString>, filterOperator: [AlexandriaHRMPrimitive<FilterOperator>], value: AlexandriaHRMPrimitive<AlexandriaHRMString>) {
    self.code = code
    self.filterOperator = filterOperator
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    code: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    filterOperator: [AlexandriaHRMPrimitive<FilterOperator>],
    value: AlexandriaHRMPrimitive<AlexandriaHRMString>
  ) {
    self.init(code: code, filterOperator: filterOperator, value: value)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.fhirDescription = fhirDescription
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code; case _code
    case fhirDescription; case _fhirDescription
    case filterOperator; case _filterOperator
    case value; case _value
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.code = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .code, auxKey: ._code)
    self.fhirDescription = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.filterOperator = try [AlexandriaHRMPrimitive<FilterOperator>](from: codingKeyContainer, forKey: .filterOperator, auxKey: ._filterOperator)
    self.value = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .value, auxKey: ._value)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try code.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try filterOperator.encode(on: &codingKeyContainer, forKey: .filterOperator, auxKey: ._filterOperator)
    try value.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CodeSystemFilter else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && fhirDescription == _other.fhirDescription
    && filterOperator == _other.filterOperator
    && value == _other.value
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(fhirDescription)
    hasher.combine(filterOperator)
    hasher.combine(value)
  }
}
