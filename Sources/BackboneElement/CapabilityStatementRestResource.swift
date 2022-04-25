//
//  CapabilityStatementRestResource.swift
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

/// A specification of the restful capabilities of the solution for a specific resource type
open class CapabilityStatementRestResource: BackboneElement {
  /// A type of resource exposed via the restful interface
  public var type: FHIRKitPrimitive<ResourceType>
  
  /// Base system profile for all uses of resource
  public var profile: FHIRKitPrimitive<Canonical>?
  
  /// Profiles for use case suported
  public var supportedProfile: [FHIRKitPrimitive<Canonical>]?
  
  /// Additional information about the use of the resouce type
  public var documentation: FHIRKitPrimitive<FHIRKitString>?
  
  /// What operations are supported?
  public var interaction: [CapabilityStatementRestResourceInteraction]?
  
  /**
   This filed is set to `no-version` to specify that the system does not support (server) or use (client)
   versioning for this resouce type. If this has some other value, the server must at least correctly track and
   populate the versionId meta-property on resources. If the value is `versioned-update` then the server
   supports all the versioning features, including using e-tags for version integrity in the API
   */
  public var versioning: FHIRKitPrimitive<ResourceVersionPolicy>?
  
  /// Wheter vRead can return past versions
  public var readHistory: FHIRKitPrimitive<FHIRKitBool>?
  
  /// If update can commit to a new identity
  public var updateCreate: FHIRKitPrimitive<FHIRKitBool>?
  
  /// If allow/uses conditional create
  public var conditionalCreate: FHIRKitPrimitive<FHIRKitBool>?
  
  /// A code that indicates how the server supports conditional read
  public var conditionalRead: FHIRKitPrimitive<ConditionalReadStatus>?

  /// If allows/uses conditional update
  public var conditionalUpdate: FHIRKitPrimitive<FHIRKitBool>?
  
  /// A code that indicates how the server supports conditional delete
  public var conditionalDelete: FHIRKitPrimitive<ConditionalDeleteStatus>?
  
  /// A set of flags that defins how references are supported
  public var referencePolicy: [FHIRKitPrimitive<ReferenceHandlingPolicy>]?
  
  /// `_include` values supported by the server
  public var searchInclude: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// `_revinclude` values suported by the server
  public var searchRevInclude: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// search parameters supported by the implementation
  public var searchParam: [CapabilityStatementRestResourceSearchParam]?
  
  /// definition of a resource operation
  public var operation: [CapabilityStatementRestResourceOperation]?
  
  public init(type: FHIRKitPrimitive<ResourceType>) {
    self.type = type
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type:FHIRKitPrimitive<ResourceType>,
    profile: FHIRKitPrimitive<Canonical>? = nil,
    supportedProfile: [FHIRKitPrimitive<Canonical>]? = nil,
    documentation: FHIRKitPrimitive<FHIRKitString>? = nil,
    interaction: [CapabilityStatementRestResourceInteraction]? = nil,
    versioning: FHIRKitPrimitive<ResourceVersionPolicy>? = nil,
    readHistory: FHIRKitPrimitive<FHIRKitBool>? = nil,
    updateCreate: FHIRKitPrimitive<FHIRKitBool>? = nil,
    conditionalCreate: FHIRKitPrimitive<FHIRKitBool>? = nil,
    conditionalRead: FHIRKitPrimitive<ConditionalReadStatus>? = nil,
    conditionalUpdate: FHIRKitPrimitive<FHIRKitBool>? = nil,
    conditionalDelete: FHIRKitPrimitive<ConditionalDeleteStatus>? = nil,
    referencePolicy: [FHIRKitPrimitive<ReferenceHandlingPolicy>]? = nil,
    searchInclude: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    searchRevInclude: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    searchParam: [CapabilityStatementRestResourceSearchParam]? = nil,
    operation: [CapabilityStatementRestResourceOperation]? = nil
  ) {
    self.init(type: type)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.profile = profile
    self.supportedProfile = supportedProfile
    self.documentation = documentation
    self.interaction = interaction
    self.versioning = versioning
    self.readHistory = readHistory
    self.updateCreate = updateCreate
    self.conditionalCreate = conditionalCreate
    self.conditionalRead = conditionalRead
    self.conditionalUpdate = conditionalUpdate
    self.conditionalDelete = conditionalDelete
    self.referencePolicy = referencePolicy
    self.searchInclude = searchInclude
    self.searchRevInclude = searchRevInclude
    self.searchParam = searchParam
    self.operation = operation
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case profile; case _profile
    case supportedProfile; case _supportedProfile
    case documentation; case _documentation
    case interaction
    case versioning; case _versioning
    case readHistory; case _readHistory
    case updateCreate; case _updateCreate
    case conditionalCreate; case _conditionalCreate
    case conditionalRead; case _conditionalRead
    case conditionalUpdate; case _conditionalUpdate
    case conditionalDelete; case _conditionalDelete
    case referencePolicy; case _referencePolicy
    case searchInclude; case _searchInclude
    case searchRevInclude; case _searchRevInclude
    case searchParam
    case operation
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.type = try FHIRKitPrimitive<ResourceType>(from: _container, forKey: .type, auxiliaryKey: ._type)
    self.profile = try FHIRKitPrimitive<Canonical>(from: _container, forKeyIfPresent: .profile, auxiliaryKey: ._profile)
    self.supportedProfile = try [FHIRKitPrimitive<Canonical>](from: _container, forKeyIfPresent: .supportedProfile, auxiliaryKey: ._supportedProfile)
    self.documentation = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .documentation, auxiliaryKey: ._documentation)
    self.interaction = try [CapabilityStatementRestResourceInteraction](from: _container, forKeyIfPresent: .interaction)
    self.versioning = try FHIRKitPrimitive<ResourceVersionPolicy>(from: _container, forKeyIfPresent: .versioning, auxiliaryKey: ._versioning)
    self.readHistory = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .readHistory, auxiliaryKey: ._readHistory)
    self.conditionalCreate = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .conditionalCreate, auxiliaryKey: ._conditionalCreate)
    self.conditionalRead = try FHIRKitPrimitive<ConditionalReadStatus>(from: _container, forKeyIfPresent: .conditionalRead, auxiliaryKey: ._conditionalRead)
    self.conditionalUpdate = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .conditionalUpdate, auxiliaryKey: ._conditionalUpdate)
    self.conditionalDelete = try FHIRKitPrimitive<ConditionalDeleteStatus>(from: _container, forKeyIfPresent: .conditionalDelete, auxiliaryKey: ._conditionalDelete)
    self.referencePolicy = try [FHIRKitPrimitive<ReferenceHandlingPolicy>](from: _container, forKeyIfPresent: .referencePolicy, auxiliaryKey: ._referencePolicy)
    self.searchInclude = try [FHIRKitPrimitive<FHIRKitString>](from: _container, forKeyIfPresent: .searchInclude, auxiliaryKey: ._searchInclude)
    self.searchRevInclude = try [FHIRKitPrimitive<FHIRKitString>](from: _container, forKeyIfPresent: .searchRevInclude, auxiliaryKey: ._searchRevInclude)
    self.searchParam = try [CapabilityStatementRestResourceSearchParam](from: _container, forKeyIfPresent: .searchParam)
    self.operation = try [CapabilityStatementRestResourceOperation](from: _container, forKeyIfPresent: .operation)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try type.encode(on: &_container, forKey: .type, auxiliaryKey: ._type)
    try profile?.encode(on: &_container, forKey: .profile, auxiliaryKey: ._profile)
    try supportedProfile?.encode(on: &_container, forKey: .profile, auxiliaryKey: ._profile)
    try documentation?.encode(on: &_container, forKey: .documentation, auxiliaryKey: ._documentation)
    try interaction?.encode(on: &_container, forKey: .interaction)
    try versioning?.encode(on: &_container, forKey: .versioning, auxiliaryKey: ._versioning)
    try readHistory?.encode(on: &_container, forKey: .readHistory, auxiliaryKey: ._readHistory)
    try conditionalCreate?.encode(on: &_container, forKey: .conditionalCreate, auxiliaryKey: ._conditionalCreate)
    try conditionalRead?.encode(on: &_container, forKey: .conditionalRead, auxiliaryKey: ._conditionalRead)
    try conditionalUpdate?.encode(on: &_container, forKey: .conditionalUpdate, auxiliaryKey: ._conditionalUpdate)
    try conditionalDelete?.encode(on: &_container, forKey: .conditionalDelete, auxiliaryKey: ._conditionalDelete)
    try referencePolicy?.encode(on: &_container, forKey: .referencePolicy, auxiliaryKey: ._referencePolicy)
    try searchInclude?.encode(on: &_container, forKey: .searchInclude, auxiliaryKey: ._searchInclude)
    try searchRevInclude?.encode(on: &_container, forKey: .searchRevInclude, auxiliaryKey: ._searchRevInclude)
    try searchParam?.encode(on: &_container, forKey: .searchParam)
    try operation?.encode(on: &_container, forKey: .operation)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementRestResource else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && profile == _other.profile
    && supportedProfile == _other.supportedProfile
    && documentation == _other.documentation
    && interaction == _other.interaction
    && versioning == _other.versioning
    && readHistory == _other.readHistory
    && conditionalCreate == _other.conditionalCreate
    && conditionalRead == _other.conditionalRead
    && conditionalUpdate == _other.conditionalUpdate
    && conditionalDelete == _other.conditionalDelete
    && referencePolicy == _other.referencePolicy
    && searchInclude == _other.searchInclude
    && searchRevInclude == _other.searchRevInclude
    && operation == _other.operation
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(profile)
    hasher.combine(documentation)
    hasher.combine(interaction)
    hasher.combine(versioning)
    hasher.combine(readHistory)
    hasher.combine(conditionalCreate)
    hasher.combine(conditionalRead)
    hasher.combine(conditionalUpdate)
    hasher.combine(conditionalDelete)
    hasher.combine(referencePolicy)
    hasher.combine(searchInclude)
    hasher.combine(searchRevInclude)
    hasher.combine(operation)
  }
}
