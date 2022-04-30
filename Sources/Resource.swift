//
//  Resource.swift
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
 Base Resource
 
 This is the base resource type for everything
 https://www.hl7.org/fhir/resource.html
 */
open class Resource: FHIRKitAbstractResource {
  override open class var resourceType: ResourceType { return .resource }
  
  /// Logical id of this artifact
  public var id: FHIRKitPrimitive<FHIRKitString>?
  
  /// Metadata about the resource
  public var meta: Meta?
  
  /// A set of rules under which this content was created
  public var implicitRules: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Language of the resource content
  public var language: FHIRKitPrimitive<FHIRKitString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    meta: Meta? = nil,
    implicitRules: FHIRKitPrimitive<FHIRKitURI>? = nil,
    language: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.id = id
    self.meta = meta
    self.implicitRules = implicitRules
    self.language = language
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case id; case _id
    case meta
    case implicitRules; case _implicitRules
    case language; case _language
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .id, auxKey: ._id)
    self.meta = try Meta(from: codingKeyContainer, forKeyIfPresent: .meta)
    self.implicitRules = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .implicitRules, auxKey: ._implicitRules)
    self.language = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .language, auxKey: ._language)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try id?.encode(on: &codingKeyContainer, forKey: .id, auxKey: ._id)
    try meta?.encode(on: &codingKeyContainer, forKey: .id)
    try implicitRules?.encode(on: &codingKeyContainer, forKey: .implicitRules, auxKey: ._implicitRules)
    try language?.encode(on: &codingKeyContainer, forKey: .language, auxKey: ._language)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Resource else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return id == _other.id
      && meta == _other.meta
      && implicitRules == _other.implicitRules
      && language == _other.language
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    
    hasher.combine(id)
    hasher.combine(meta)
    hasher.combine(implicitRules)
    hasher.combine(language)
  }
}
