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

import Darwin

open class DomainResource: Resource {
  override open class var resourceType: ResourceType { return .domainResource}
  
  public var text: Narrative?
  
  public var contained: [ResourceProxy]?
  
  public var `extension`: [Extension]?
  
  public var modifierExtension: [Extension]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    contained: [ResourceProxy]? = nil,
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    implicitRules: FHIRKitPrimitive<FHIRKitURI>? = nil,
    language: FHIRKitPrimitive<FHIRKitString>? = nil,
    meta: Meta? = nil,
    modifierExtension: [Extension]? = nil,
    text: Narrative? = nil
  ) {
    self.init()
    self.contained = contained
    self.`extension` = `extension`
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
    case `extension` = "extension" // swiftlint:disable:this redundant_string_enum_value
    case modifierExtension
    case text
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.contained = try [ResourceProxy](from: _container, forKeyIfPresent: .contained)
    self.`extension` = try [Extension](from: _container, forKeyIfPresent: .`extension`)
    self.modifierExtension = try [Extension](from: _container, forKeyIfPresent: .modifierExtension)
    self.text = try Narrative(from: _container, forKeyIfPresent: .text)
    
    try super.init(from: decoder)
  }
}
