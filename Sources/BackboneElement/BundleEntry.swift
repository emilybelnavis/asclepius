//
//  BundleEntry.swift
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
    `extension`: [Extension]? = nil,
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
    self.`extension` = `extension`
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
    case link;
    case fullUrl; case _fullUrl
    case resource
    case search
    case request
    case response
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.link = try [BundleLink](from: _container, forKeyIfPresent: .link)
    self.fullUrl = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKeyIfPresent: .fullUrl, auxiliaryKey: ._fullUrl)
    self.resource = try ResourceProxy(from: _container, forKeyIfPresent: .resource)
    self.search = try BundleEntrySearch(from: _container, forKeyIfPresent: .search)
    self.request = try BundleEntryRequest(from: _container, forKeyIfPresent: .request)
    self.response = try BundleEntryResponse(from: _container, forKeyIfPresent: .response)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try link?.encode(on: &_container, forKey: .link)
    try fullUrl?.encode(on: &_container, forKey: .fullUrl, auxiliaryKey: ._fullUrl)
    try resource?.encode(on: &_container, forKey: .resource)
    try search?.encode(on: &_container, forKey: .search)
    try request?.encode(on: &_container, forKey: .request)
    try response?.encode(on: &_container, forKey: .response)
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
