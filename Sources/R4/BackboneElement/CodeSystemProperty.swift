//
//  CodeSystemProperty.swift
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

import FHIRKitCore

/**
 Additional information supplied about each concept. A property defines an additional slot through which
 additional information can be provided about a concept
 */
open class CodeSystemProperty: BackboneElement {
  /// Identifies the property on the concepts and when referred to in operations
  public var code: FHIRKitPrimitive<FHIRKitString>
  
  /// Formal identifier for the property
  public var uri: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Why the property is defined, and/or what it conveys
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// The type of property value. Properties of the type "code" defined by the code system
  /// (e.g. a reference to another defined concept)
  public var type: FHIRKitPrimitive<PropertyType>
  
  public init(code: FHIRKitPrimitive<FHIRKitString>, type: FHIRKitPrimitive<PropertyType>) {
    self.code = code
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    code: FHIRKitPrimitive<FHIRKitString>,
    uri: FHIRKitPrimitive<FHIRKitURI>? = nil,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<PropertyType>
  ) {
    self.init(code: code, type: type)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.uri = uri
    self.fhirDescription = fhirDescription
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code; case _code
    case uri; case _uri
    case fhirDescription; case _fhirDescription
    case type; case _type
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.code = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .code, auxKey: ._code)
    self.uri = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .uri, auxKey: ._uri)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.type = try FHIRKitPrimitive<PropertyType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = try encoder.container(keyedBy: CodingKeys.self)
    
    try code.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try uri?.encode(on: &codingKeyContainer, forKey: .uri, auxKey: ._uri)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CodeSystemProperty else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && uri == _other.uri
    && fhirDescription == _other.fhirDescription
    && type == _other.type
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(uri)
    hasher.combine(fhirDescription)
    hasher.combine(type)
  }
}

