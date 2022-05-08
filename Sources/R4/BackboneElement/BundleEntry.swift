//
//  BundleEntry.swift
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

/// An entry in a bundle resource - will either contain a resource or information about a resource
/// (transactions and history only)
open class BundleEntry: BackboneElement {
  /// Links related to this entry
  public var link: [BundleLink]?
  
  /// URI for resource (Absolute URL server address or URI for UUID/OID)
  public var fullUrl: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  
  /// A resource in the bundle
  public var resource: ResourceProxy?
  
  /// Search related information
  public var search: BundleEntrySearch?
  
  /// Additional execution information (transaction/batch/history)
  public var request: BundleEntryRequest?
  
  /// Results of execution (transaction/batch/history)
  public var response: BundleEntryResponse?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    link: [BundleLink]? = nil,
    fullUrl: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil,
    resource: ResourceProxy? = nil,
    search: BundleEntrySearch? = nil,
    request: BundleEntryRequest? = nil,
    response: BundleEntryResponse? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.link = link
    self.fullUrl = fullUrl
    self.resource = resource
    self.search = search
    self.request = request
    self.response = response
  }
  
  // MARK: - Coding
  private enum CodingKeys: String, CodingKey {
    case link
    case fullUrl; case _fullUrl
    case resource
    case search
    case request
    case response
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.link = try [BundleLink](from: codingKeyContainer, forKeyIfPresent: .link)
    self.fullUrl = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKeyIfPresent: .fullUrl, auxKey: ._fullUrl)
    self.resource = try ResourceProxy(from: codingKeyContainer, forKeyIfPresent: .resource)
    self.search = try BundleEntrySearch(from: codingKeyContainer, forKeyIfPresent: .search)
    self.request = try BundleEntryRequest(from: codingKeyContainer, forKeyIfPresent: .request)
    self.response = try BundleEntryResponse(from: codingKeyContainer, forKeyIfPresent: .response)
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try link?.encode(on: &codingKeyContainer, forKey: .link)
    try fullUrl?.encode(on: &codingKeyContainer, forKey: .fullUrl, auxKey: ._fullUrl)
    try resource?.encode(on: &codingKeyContainer, forKey: .resource)
    try search?.encode(on: &codingKeyContainer, forKey: .search)
    try request?.encode(on: &codingKeyContainer, forKey: .request)
    try response?.encode(on: &codingKeyContainer, forKey: .response)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? BundleEntry else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return link == _other.link
    && fullUrl == _other.fullUrl
    && resource == _other.resource
    && search == _other.search
    && request == _other.request
    && response == _other.response
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(link)
    hasher.combine(fullUrl)
    hasher.combine(resource)
    hasher.combine(search)
    hasher.combine(request)
    hasher.combine(response)
  }
}
