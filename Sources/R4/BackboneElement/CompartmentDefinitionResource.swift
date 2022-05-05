//
//  CompartmentDefinitionResource.swift
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

/// Information about how a resouce is related to the compartment
open class CompartmentDefinitionResource: BackboneElement {
  /// The name of a resource supported by the server
  public var code: FHIRKitPrimitive<ResourceType>
  
  /// Search parameter name or chained parameters
  public var param: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Additional documentation about the resource and compartment
  public var documentation: FHIRKitPrimitive<FHIRKitString>?
  
  public init(code: FHIRKitPrimitive<ResourceType>) {
    self.code = code
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    code: FHIRKitPrimitive<ResourceType>,
    param: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    documentation: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(code: code)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    
    self.code = try FHIRKitPrimitive<ResourceType>(from: codingKeyContainer, forKey: .code, auxKey: ._code)
    self.param = try [FHIRKitPrimitive<FHIRKitString>](from: codingKeyContainer, forKeyIfPresent: .param, auxKey: ._param)
    self.documentation = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try code.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try param?.encode(on: &codingKeyContainer, forKey: .param, auxKey: ._param)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(param)
    hasher.combine(documentation)
  }
}
