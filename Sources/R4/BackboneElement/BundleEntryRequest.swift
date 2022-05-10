//
//  BundleEntryRequest.swift
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
 Additional information about how this entry should be processed when as a part of a transaction or batch.
 For history, it shows how the entry was processed to create the version contained in the entry
 */
open class BundleEntryRequest: BackboneElement {
  /// In a transactoin or batch, this is the HTTP action to be executed for this entry. In a history bundle, this
  /// indicates the HTTP action that occured.
  public var method: AsclepiusPrimitive<HTTPVerb>
  
  /// URL for HTTP equivalent of this entry
  public var url: AsclepiusPrimitive<AsclepiusURI>
  
  /// For cache managment
  public var ifNoneMatch: AsclepiusPrimitive<AsclepiusString>?
  
  /// For cache management
  public var ifModifiedSince: AsclepiusPrimitive<AsclepiusInstant>?
  
  /// For cache management
  public var ifMatch: AsclepiusPrimitive<AsclepiusString>?
  
  /// For cache management
  public var ifNoneExist: AsclepiusPrimitive<AsclepiusString>?
  
  public init(method: AsclepiusPrimitive<HTTPVerb>, url: AsclepiusPrimitive<AsclepiusURI>) {
    self.method = method
    self.url = url
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    method: AsclepiusPrimitive<HTTPVerb>,
    url: AsclepiusPrimitive<AsclepiusURI>,
    ifNoneMatch: AsclepiusPrimitive<AsclepiusString>? = nil,
    ifModifiedSince: AsclepiusPrimitive<AsclepiusInstant>? = nil,
    ifMatch: AsclepiusPrimitive<AsclepiusString>? = nil,
    ifNoneExist: AsclepiusPrimitive<AsclepiusString>? = nil
  ) {
    self.init(method: method, url: url)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
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
    
    self.method = try AsclepiusPrimitive<HTTPVerb>(from: codingKeyContainer, forKey: .method, auxKey: ._method)
    self.url = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKey: .url, auxKey: ._url)
    self.ifNoneMatch = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .ifNoneMatch, auxKey: ._ifNoneMatch)
    self.ifModifiedSince = try AsclepiusPrimitive<AsclepiusInstant>(from: codingKeyContainer, forKeyIfPresent: .ifModifiedSince, auxKey: ._ifModifiedSince)
    self.ifMatch = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .ifMatch, auxKey: ._ifMatch)
    self.ifNoneExist = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .ifNoneExist, auxKey: ._ifNoneExist)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
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
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(method)
    hasher.combine(url)
    hasher.combine(ifNoneMatch)
    hasher.combine(ifModifiedSince)
    hasher.combine(ifMatch)
    hasher.combine(ifNoneExist)
  }
}
