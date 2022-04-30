//
//  BundleEntry.swift
//  FHIRKit
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

/// An entry in a bundle resource - will either contain a resource or information about a resource
/// (transactions and history only)
open class BundleEntry: BackboneElement {
  /// Links related to this entry
  public var link: [BundleLink]?
  
  /// URI for resource (Absolute URL server address or URI for UUID/OID)
  public var fullUrl: FHIRKitPrimitive<FHIRKitURI>?
  
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
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    link: [BundleLink]? = nil,
    fullUrl: FHIRKitPrimitive<FHIRKitURI>? = nil,
    resource: ResourceProxy? = nil,
    search: BundleEntrySearch? = nil,
    request: BundleEntryRequest? = nil,
    response: BundleEntryResponse? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    self.fullUrl = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .fullUrl, auxKey: ._fullUrl)
    self.resource = try ResourceProxy(from: codingKeyContainer, forKeyIfPresent: .resource)
    self.search = try BundleEntrySearch(from: codingKeyContainer, forKeyIfPresent: .search)
    self.request = try BundleEntryRequest(from: codingKeyContainer, forKeyIfPresent: .request)
    self.response = try BundleEntryResponse(from: codingKeyContainer, forKeyIfPresent: .response)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
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
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(link)
    hasher.combine(fullUrl)
    hasher.combine(resource)
    hasher.combine(search)
    hasher.combine(request)
    hasher.combine(response)
  }
}
