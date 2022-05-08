//
//  BundleEntryRequest.swift
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

/**
 Additional information about how this entry should be processed when as a part of a transaction or batch.
 For history, it shows how the entry was processed to create the version contained in the entry
 */
open class BundleEntryRequest: BackboneElement {
  /// In a transactoin or batch, this is the HTTP action to be executed for this entry. In a history bundle, this
  /// indicates the HTTP action that occured.
  public var method: AlexandriaHRMPrimitive<HTTPVerb>
  
  /// URL for HTTP equivalent of this entry
  public var url: AlexandriaHRMPrimitive<AlexandriaHRMURI>
  
  /// For cache managment
  public var ifNoneMatch: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// For cache management
  public var ifModifiedSince: AlexandriaHRMPrimitive<AlexandriaHRMInstant>?
  
  /// For cache management
  public var ifMatch: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// For cache management
  public var ifNoneExist: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  public init(method: AlexandriaHRMPrimitive<HTTPVerb>, url: AlexandriaHRMPrimitive<AlexandriaHRMURI>) {
    self.method = method
    self.url = url
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    method: AlexandriaHRMPrimitive<HTTPVerb>,
    url: AlexandriaHRMPrimitive<AlexandriaHRMURI>,
    ifNoneMatch: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    ifModifiedSince: AlexandriaHRMPrimitive<AlexandriaHRMInstant>? = nil,
    ifMatch: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    ifNoneExist: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil
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
    
    self.method = try AlexandriaHRMPrimitive<HTTPVerb>(from: codingKeyContainer, forKey: .method, auxKey: ._method)
    self.url = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKey: .url, auxKey: ._url)
    self.ifNoneMatch = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .ifNoneMatch, auxKey: ._ifNoneMatch)
    self.ifModifiedSince = try AlexandriaHRMPrimitive<AlexandriaHRMInstant>(from: codingKeyContainer, forKeyIfPresent: .ifModifiedSince, auxKey: ._ifModifiedSince)
    self.ifMatch = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .ifMatch, auxKey: ._ifMatch)
    self.ifNoneExist = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .ifNoneExist, auxKey: ._ifNoneExist)
    
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
