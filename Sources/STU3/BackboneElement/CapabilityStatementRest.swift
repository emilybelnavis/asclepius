//
//  CapabilityStatementRest.swift
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

/// A definition of the restful capabilities of the soultion, if any
open class CapabilityStatementRest: BackboneElement {
  /// Identifies whether this portion of the statement is describing the ability to initiate or receive resful
  /// operations
  public var mode: AlexandriaHRMPrimitive<RestfulCapabilityMode>
  
  /// General description of implementation
  public var documentation: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Information about security of implementation
  public var security: CapabilityStatementRestSecurity?
  
  /// Resource served on the REST interface
  public var resource: [CapabilityStatementRestResource]?
  
  /// What operations are supported?
  public var interaction: [CapabilityStatementRestInteraction]?
  
  /// Search parameters for searching all resources
  public var searchParam: [CapabilityStatementRestResourceSearchParam]?
  
  /// Definition of a system level operation
  public var operation: [CapabilityStatementRestResourceOperation]?
  
  /// Compartments served/used by system
  public var compartment: [AlexandriaHRMPrimitive<Canonical>]?
  
  public init(mode: AlexandriaHRMPrimitive<RestfulCapabilityMode>) {
    self.mode = mode
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    mode: AlexandriaHRMPrimitive<RestfulCapabilityMode>,
    documentation: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    security: CapabilityStatementRestSecurity? = nil,
    resource: [CapabilityStatementRestResource]? = nil,
    interaction: [CapabilityStatementRestInteraction]? = nil,
    searchParam: [CapabilityStatementRestResourceSearchParam]? = nil,
    operation: [CapabilityStatementRestResourceOperation]? = nil,
    compartment: [AlexandriaHRMPrimitive<Canonical>]? = nil
  ) {
    self.init(mode: mode)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.documentation = documentation
    self.security = security
    self.resource = resource
    self.interaction = interaction
    self.searchParam = searchParam
    self.operation = operation
    self.compartment = compartment
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case mode; case _mode
    case documentation; case _documentation
    case security
    case resource
    case interaction
    case searchParam
    case operation
    case compartment; case _compartment
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.mode = try AlexandriaHRMPrimitive<RestfulCapabilityMode>(from: codingKeyContainer, forKey: .mode, auxKey: ._mode)
    self.documentation = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    self.security = try CapabilityStatementRestSecurity(from: codingKeyContainer, forKeyIfPresent: .security)
    self.resource = try [CapabilityStatementRestResource](from: codingKeyContainer, forKeyIfPresent: .resource)
    self.interaction = try [CapabilityStatementRestInteraction](from: codingKeyContainer, forKeyIfPresent: .interaction)
    self.searchParam = try [CapabilityStatementRestResourceSearchParam](from: codingKeyContainer, forKeyIfPresent: .searchParam)
    self.operation = try [CapabilityStatementRestResourceOperation](from: codingKeyContainer, forKeyIfPresent: .operation)
    self.compartment = try [AlexandriaHRMPrimitive<Canonical>](from: codingKeyContainer, forKeyIfPresent: .compartment, auxKey: ._compartment)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try mode.encode(on: &codingKeyContainer, forKey: .mode, auxKey: ._mode)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    try security?.encode(on: &codingKeyContainer, forKey: .security)
    try resource?.encode(on: &codingKeyContainer, forKey: .resource)
    try interaction?.encode(on: &codingKeyContainer, forKey: .interaction)
    try searchParam?.encode(on: &codingKeyContainer, forKey: .searchParam)
    try operation?.encode(on: &codingKeyContainer, forKey: .operation)
    try compartment?.encode(on: &codingKeyContainer, forKey: .compartment, auxKey: ._compartment)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementRest else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return mode == _other.mode
    && documentation == _other.documentation
    && security == _other.security
    && resource == _other.resource
    && interaction == _other.interaction
    && searchParam == _other.searchParam
    && operation == _other.operation
    && compartment == _other.compartment
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(mode)
    hasher.combine(documentation)
    hasher.combine(security)
    hasher.combine(resource)
    hasher.combine(interaction)
    hasher.combine(searchParam)
    hasher.combine(operation)
    hasher.combine(compartment)
  }
}
