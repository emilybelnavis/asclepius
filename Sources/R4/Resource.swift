//
//  Resource.swift
//  FHIRKit
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
