//
//  Attachment.swift
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
 Content in a format defined elsewhere.
 
 For referring to data content defined in other formats
 */
open class Attachment: Element {
  /// MIME type of the content, with charset
  public var contentType: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Language of the content (BCP-47)
  public var language: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Data inline as base64
  public var data: AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>?
  
  /// URI where the data can be found
  public var url: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  
  /// Content bytesize (if URL provided)
  public var size: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>?
  
  /// Hash of the data (SHA-1, base64 format)
  public var hash: AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>?
  
  /// Label to display in place of the data
  public var title: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Date the attachment was first created
  public var creation: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    contentType: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    language: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    data: AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>? = nil,
    url: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil,
    size: AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>? = nil,
    hash: AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>? = nil,
    title: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    creation: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.contentType = contentType
    self.language = language
    self.data = data
    self.url = url
    self.size = size
    self.hash = hash
    self.title = title
    self.creation = creation
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case contentType; case _contentType
    case language; case _language
    case data; case _data
    case url; case _url
    case size; case _size
    case hash; case _hash
    case title; case _title
    case creation; case _creation
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.contentType = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .contentType, auxKey: ._contentType)
    self.language = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .language, auxKey: ._language)
    self.data = try AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .data, auxKey: ._data)
    self.url = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKeyIfPresent: .url, auxKey: ._url)
    self.size = try AlexandriaHRMPrimitive<AlexandriaHRMUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .size, auxKey: ._size)
    self.hash = try AlexandriaHRMPrimitive<AlexandriaHRMBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .hash, auxKey: ._hash)
    self.title = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .title, auxKey: ._title)
    self.creation = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .creation, auxKey: ._creation)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try contentType?.encode(on: &codingKeyContainer, forKey: .contentType, auxKey: ._contentType)
    try language?.encode(on: &codingKeyContainer, forKey: .language, auxKey: ._language)
    try data?.encode(on: &codingKeyContainer, forKey: .data, auxKey: ._data)
    try url?.encode(on: &codingKeyContainer, forKey: .url, auxKey: ._url)
    try size?.encode(on: &codingKeyContainer, forKey: .size, auxKey: ._size)
    try hash?.encode(on: &codingKeyContainer, forKey: .hash, auxKey: ._hash)
    try title?.encode(on: &codingKeyContainer, forKey: .title, auxKey: ._title)
    try creation?.encode(on: &codingKeyContainer, forKey: .creation, auxKey: ._creation)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Attachment else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return contentType == _other.contentType
    && language == _other.language
    && data == _other.data
    && url == _other.url
    && size == _other.size
    && hash == _other.hash
    && title == _other.title
    && creation == _other.creation
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(contentType)
    hasher.combine(language)
    hasher.combine(data)
    hasher.combine(url)
    hasher.combine(size)
    hasher.combine(hash)
    hasher.combine(title)
    hasher.combine(creation)
  }
}
