//
//  DomainResource.swift
//  AlexandriaHRM
//  Module: STU3
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
 A resource that has a human-readable XHTML representation of the content inside the resource (`Narrative`), can
 contain additional related resources inside the resource, and can have additional extensions and modifierExtensions
 as well as the defined data.
 
 As an abstract resource, this resource is never created directly; instead, one of its decendant resources is created.
 
 This resource extends the base `Resource. All of the listed Resources with the exception of `Bundle`,
 `Parameters`, and `Binary` extend this resource.
 
 https://www.hl7.org/fhir/domainresource.html
 */
open class DomainResource: Resource {
  override open class var resourceType: ResourceType { return .domainResource}
  
  /// Text summary of the resource for human interpretation
  public var text: Narrative?
  
  /// Contained, inline resources
  public var contained: [ResourceProxy]?
  
  /// Additional content defined by implementations
  public var fhirExtension: [Extension]?
  
  /// Extensions that cannot be ignored
  public var modifierExtension: [Extension]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    text: Narrative? = nil,
    contained: [ResourceProxy]? = nil,
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    implicitRules: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil,
    language: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    meta: Meta? = nil
  ) {
    self.init()
    self.text = text
    self.contained = contained
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.implicitRules = implicitRules
    self.language = language
    self.meta = meta
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case text
    case contained
    case fhirExtension = "extension"
    case modifierExtension
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.text = try Narrative(from: codingKeyContainer, forKeyIfPresent: .text)
    self.contained = try [ResourceProxy](from: codingKeyContainer, forKeyIfPresent: .contained)
    self.fhirExtension = try [Extension](from: codingKeyContainer, forKeyIfPresent: .fhirExtension)
    self.modifierExtension = try [Extension](from: codingKeyContainer, forKeyIfPresent: .modifierExtension)
    
    try super.init(from: decoder)
  }
}
