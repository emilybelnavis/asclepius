//
//  ParameterDefinition.swift
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
 The parameters to the module. This collection specifies both the input and output parameters. Input
 parameters are provided by the caller as part of the `$evaluate` operaion. Output parameters are included
 in the GuidanceResponse
 */
open class ParameterDefinition: Element {
  /// Name used to access the parameter value
  public var name: AsclepiusPrimitive<AsclepiusString>?
  
  /// Whether the parameter is input or output for the module
  public var use: AsclepiusPrimitive<OperationParameterUse>
  
  /// Minimum cardinality
  public var min: AsclepiusPrimitive<AsclepiusInteger>?
  
  /// Maximum cardinality
  public var max: AsclepiusPrimitive<AsclepiusInteger>?
  
  /// A brief description of the parameter
  public var documentation: AsclepiusPrimitive<AsclepiusString>?
  
  /// What type of value
  public var type: AsclepiusPrimitive<AsclepiusString>
  
  /// What profile the value is expected to be
  public var profile: AsclepiusPrimitive<Canonical>?
  
  public init(use: AsclepiusPrimitive<OperationParameterUse>, type: AsclepiusPrimitive<AsclepiusString>) {
    self.use = use
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    name: AsclepiusPrimitive<AsclepiusString>? = nil,
    use: AsclepiusPrimitive<OperationParameterUse>,
    min: AsclepiusPrimitive<AsclepiusInteger>? = nil,
    max: AsclepiusPrimitive<AsclepiusInteger>? = nil,
    documentation: AsclepiusPrimitive<AsclepiusString>? = nil,
    type: AsclepiusPrimitive<AsclepiusString>,
    profile: AsclepiusPrimitive<Canonical>? = nil
  ) {
    self.init(use: use, type: type)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.name = name
    self.min = min
    self.max = max
    self.documentation = documentation
    self.profile = profile
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case use; case _use
    case min; case _min
    case max; case _max
    case documentation; case _documentation
    case type; case _type
    case profile; case _profile
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.use = try AsclepiusPrimitive<OperationParameterUse>(from: codingKeyContainer, forKey: .use, auxKey: ._use)
    self.min = try AsclepiusPrimitive<AsclepiusInteger>(from: codingKeyContainer, forKeyIfPresent: .min, auxKey: ._min)
    self.max = try AsclepiusPrimitive<AsclepiusInteger>(from: codingKeyContainer, forKeyIfPresent: .max, auxKey: ._max)
    self.documentation = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    self.type = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    self.profile = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKey: .profile, auxKey: ._profile)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try use.encode(on: &codingKeyContainer, forKey: .use, auxKey: ._use)
    try min?.encode(on: &codingKeyContainer, forKey: .min, auxKey: ._min)
    try max?.encode(on: &codingKeyContainer, forKey: .max, auxKey: ._max)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try profile?.encode(on: &codingKeyContainer, forKey: .profile, auxKey: ._profile)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ParameterDefinition else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name
    && use == _other.use
    && min == _other.min
    && max == _other.max
    && documentation == _other.documentation
    && type == _other.type
    && profile == _other.profile
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(use)
    hasher.combine(min)
    hasher.combine(max)
    hasher.combine(documentation)
    hasher.combine(type)
    hasher.combine(profile)
  }
}
