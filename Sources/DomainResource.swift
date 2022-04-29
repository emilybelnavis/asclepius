//
//  DomainResource.swift
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
    contained: [ResourceProxy]? = nil,
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    implicitRules: FHIRKitPrimitive<FHIRKitURI>? = nil,
    language: FHIRKitPrimitive<FHIRKitString>? = nil,
    meta: Meta? = nil,
    modifierExtension: [Extension]? = nil,
    text: Narrative? = nil
  ) {
    self.init()
    self.contained = contained
    self.fhirExtension = fhirExtension
    self.id = id
    self.implicitRules = implicitRules
    self.language = language
    self.meta = meta
    self.modifierExtension = modifierExtension
    self.text = text
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case contained
    case fhirExtension = "extension" // swiftlint:disable:this redundant_string_enum_value
    case modifierExtension
    case text
  }
  
  public required init(from decoder: Decoder) throws {
    let codingContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.contained = try [ResourceProxy](from: codingContainer, forKeyIfPresent: .contained)
    self.fhirExtension = try [Extension](from: codingContainer, forKeyIfPresent: .fhirExtension)
    self.modifierExtension = try [Extension](from: codingContainer, forKeyIfPresent: .modifierExtension)
    self.text = try Narrative(from: codingContainer, forKeyIfPresent: .text)
    
    try super.init(from: decoder)
  }
}
