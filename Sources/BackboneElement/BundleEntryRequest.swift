//
//  BundleEntryRequest.swift
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

/**
 Additional information about how this entry should be processed when as a part of a transaction or batch.
 For history, it shows how the entry was processed to create the version contained in the entry
 */
open class BundleEntryRequest: BackboneElement {
  /// In a transactoin or batch, this is the HTTP action to be executed for this entry. In a history bundle, this
  /// indicates the HTTP action that occured.
  public var method: FHIRKitPrimitive<HTTPVerb>
  
  /// URL for HTTP equivalent of this entry
  public var url: FHIRKitPrimitive<FHIRKitURI>
  
  /// For cache managment
  public var ifNoneMatch: FHIRKitPrimitive<FHIRKitString>?
  
  /// For cache management
  public var ifModifiedSince: FHIRKitPrimitive<FHIRKitInstant>?
  
  /// For cache management
  public var ifMatch: FHIRKitPrimitive<FHIRKitString>?
  
  /// For cache management
  public var ifNoneExist: FHIRKitPrimitive<FHIRKitString>?
  
  public init(method: FHIRKitPrimitive<HTTPVerb>, url: FHIRKitPrimitive<FHIRKitURI>) {
    self.method = method
    self.url = url
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    method: FHIRKitPrimitive<HTTPVerb>,
    url: FHIRKitPrimitive<FHIRKitURI>,
    ifNoneMatch: FHIRKitPrimitive<FHIRKitString>? = nil,
    ifModifiedSince: FHIRKitPrimitive<FHIRKitInstant>? = nil,
    ifMatch: FHIRKitPrimitive<FHIRKitString>? = nil,
    ifNoneExist: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(method: method, url: url)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.url = url
    self.ifNoneMatch = ifNoneMatch
    self.ifModifiedSince = ifModifiedSince
    self.ifMatch = ifMatch
    self.ifNoneExist = ifNoneExist
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case method; case _method
    case url; case _url
    case ifNoneMatch; case _ifNoneMatch
    case ifModifiedSince; case _ifModifiedSince
    case ifMatch; case _ifMatch
    case ifNoneExist; case _ifNoneExist
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.method = try FHIRKitPrimitive<HTTPVerb>(from: codingKeyContainer, forKey: .method, auxKey: ._method)
    self.url = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKey: .url, auxKey: ._url)
    self.ifNoneMatch = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .ifNoneMatch, auxKey: ._ifNoneMatch)
    self.ifModifiedSince = try FHIRKitPrimitive<FHIRKitInstant>(from: codingKeyContainer, forKeyIfPresent: .ifModifiedSince, auxKey: ._ifModifiedSince)
    self.ifMatch = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .ifMatch, auxKey: ._ifMatch)
    self.ifNoneExist = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .ifNoneExist, auxKey: ._ifNoneExist)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try method.encode(on: &codingKeyContainer, forKey: .method, auxKey: ._method)
    try url.encode(on: &codingKeyContainer, forKey: .url, auxKey: ._url)
    try ifNoneMatch?.encode(on: &codingKeyContainer, forKey: .ifNoneMatch, auxKey: ._ifNoneMatch)
    try ifModifiedSince?.encode(on: &codingKeyContainer, forKey: .ifModifiedSince, auxKey: ._ifModifiedSince)
    try ifMatch?.encode(on: &codingKeyContainer, forKey: .ifMatch, auxKey: ._ifMatch)
    try ifNoneExist?.encode(on: &codingKeyContainer, forKey: .ifNoneExist, auxKey: ._ifNoneExist)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? BundleEntryRequest else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return method == _other.method
    && url == _other.url
    && ifNoneMatch == _other.ifNoneMatch
    && ifModifiedSince == _other.ifModifiedSince
    && ifMatch == _other.ifMatch
    && ifNoneExist == _other.ifNoneExist
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(method)
    hasher.combine(url)
    hasher.combine(ifNoneMatch)
    hasher.combine(ifModifiedSince)
    hasher.combine(ifMatch)
    hasher.combine(ifNoneExist)
  }
}
