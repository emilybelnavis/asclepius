//
//  CapabilityStatementRest.swift
//  FHIRKIT
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

/// A definition of the restful capabilities of the soultion, if any
open class CapabilityStatementRest: BackboneElement {
  /// Identifies whether this portion of the statement is describing the ability to initiate or receive resful
  /// operations
  public var mode: FHIRKitPrimitive<RestfulCapabilityMode>
  
  /// General description of implementation
  public var documentation: FHIRKitPrimitive<FHIRKitString>?
  
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
  public var compartment: [FHIRKitPrimitive<Canonical>]?
  
  public init(mode: FHIRKitPrimitive<RestfulCapabilityMode>) {
    self.mode = mode
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    mode: FHIRKitPrimitive<RestfulCapabilityMode>,
    documentation: FHIRKitPrimitive<FHIRKitString>? = nil,
    security: CapabilityStatementRestSecurity? = nil,
    resource: [CapabilityStatementRestResource]? = nil,
    interaction: [CapabilityStatementRestInteraction]? = nil,
    searchParam: [CapabilityStatementRestResourceSearchParam]? = nil,
    operation: [CapabilityStatementRestResourceOperation]? = nil,
    compartment: [FHIRKitPrimitive<Canonical>]? = nil
  ) {
    self.init(mode: mode)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.mode = try FHIRKitPrimitive<RestfulCapabilityMode>(from: _container, forKey: .mode, auxiliaryKey: ._mode)
    self.documentation = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .documentation, auxiliaryKey: ._documentation)
    self.security = try CapabilityStatementRestSecurity(from: _container, forKeyIfPresent: .security)
    self.resource = try [CapabilityStatementRestResource](from: _container, forKeyIfPresent: .resource)
    self.interaction = try [CapabilityStatementRestInteraction](from: _container, forKeyIfPresent: .interaction)
    self.searchParam = try [CapabilityStatementRestResourceSearchParam](from: _container, forKeyIfPresent: .searchParam)
    self.operation = try [CapabilityStatementRestResourceOperation](from: _container, forKeyIfPresent: .operation)
    self.compartment = try [FHIRKitPrimitive<Canonical>](from: _container, forKeyIfPresent: .compartment, auxiliaryKey: ._compartment)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try mode.encode(on: &_container, forKey: .mode, auxiliaryKey: ._mode)
    try documentation?.encode(on: &_container, forKey: .documentation, auxiliaryKey: ._documentation)
    try security?.encode(on: &_container, forKey: .security)
    try resource?.encode(on: &_container, forKey: .resource)
    try interaction?.encode(on: &_container, forKey: .interaction)
    try searchParam?.encode(on: &_container, forKey: .searchParam)
    try operation?.encode(on: &_container, forKey: .operation)
    try compartment?.encode(on: &_container, forKey: .compartment, auxiliaryKey: ._compartment)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
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