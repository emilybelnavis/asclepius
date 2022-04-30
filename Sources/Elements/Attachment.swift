//
//  Attachment.swift
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

/**
 Content in a format defined elsewhere.
 
 For referring to data content defined in other formats
 */
open class Attachment: Element {
  /// MIME type of the content, with charset
  public var contentType: FHIRKitPrimitive<FHIRKitString>?
  
  /// Language of the content (BCP-47)
  public var language: FHIRKitPrimitive<FHIRKitString>?
  
  /// Data inline as base64
  public var data: FHIRKitPrimitive<FHIRKitBase64Binary>?
  
  /// URI where the data can be found
  public var url: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Content bytesize (if URL provided)
  public var size: FHIRKitPrimitive<FHIRKitUnsignedInteger>?
  
  /// Hash of the data (SHA-1, base64 format)
  public var hash: FHIRKitPrimitive<FHIRKitBase64Binary>?
  
  /// Label to display in place of the data
  public var title: FHIRKitPrimitive<FHIRKitString>?
  
  /// Date the attachment was first created
  public var creation: FHIRKitPrimitive<FHIRKitDateTime>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    contentType: FHIRKitPrimitive<FHIRKitString>? = nil,
    language: FHIRKitPrimitive<FHIRKitString>? = nil,
    data: FHIRKitPrimitive<FHIRKitBase64Binary>? = nil,
    url: FHIRKitPrimitive<FHIRKitURI>? = nil,
    size: FHIRKitPrimitive<FHIRKitUnsignedInteger>? = nil,
    hash: FHIRKitPrimitive<FHIRKitBase64Binary>? = nil,
    title: FHIRKitPrimitive<FHIRKitString>? = nil,
    creation: FHIRKitPrimitive<FHIRKitDateTime>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
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
    
    self.contentType = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .contentType, auxKey: ._contentType)
    self.language = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .language, auxKey: ._language)
    self.data = try FHIRKitPrimitive<FHIRKitBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .data, auxKey: ._data)
    self.url = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .url, auxKey: ._url)
    self.size = try FHIRKitPrimitive<FHIRKitUnsignedInteger>(from: codingKeyContainer, forKeyIfPresent: .size, auxKey: ._size)
    self.hash = try FHIRKitPrimitive<FHIRKitBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .hash, auxKey: ._hash)
    self.title = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .title, auxKey: ._title)
    self.creation = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .creation, auxKey: ._creation)
    
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
