//
//  CompartmentDefinitionResource.swift
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

/// Information about how a resouce is related to the compartment
open class CompartmentDefinitionResource: BackboneElement {
  /// The name of a resource supported by the server
  public var code: AlexandriaHRMPrimitive<ResourceType>
  
  /// Search parameter name or chained parameters
  public var param: [AlexandriaHRMPrimitive<AlexandriaHRMString>]?
  
  /// Additional documentation about the resource and compartment
  public var documentation: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  public init(code: AlexandriaHRMPrimitive<ResourceType>) {
    self.code = code
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    code: AlexandriaHRMPrimitive<ResourceType>,
    param: [AlexandriaHRMPrimitive<AlexandriaHRMString>]? = nil,
    documentation: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil
  ) {
    self.init(code: code)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.param = param
    self.documentation = documentation
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code; case _code
    case param; case _param
    case documentation; case _documentation
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.code = try AlexandriaHRMPrimitive<ResourceType>(from: codingKeyContainer, forKey: .code, auxKey: ._code)
    self.param = try [AlexandriaHRMPrimitive<AlexandriaHRMString>](from: codingKeyContainer, forKeyIfPresent: .param, auxKey: ._param)
    self.documentation = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try code.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try param?.encode(on: &codingKeyContainer, forKey: .param, auxKey: ._param)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CompartmentDefinitionResource else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && param == _other.param
    && documentation == _other.documentation
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(param)
    hasher.combine(documentation)
  }
}
