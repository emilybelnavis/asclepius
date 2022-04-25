//
//  CapabilityStatementRestResourceSearchParam.swift
//  FHIRKIT
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
 Search parameters for implementations to support and/or make use of - either references to ones defined in
 the specification or additional ondes defined for/by the implementation
 */
open class CapabilityStatementRestResourceSearchParam: BackboneElement {
  /// Name of the search parameter
  public var name: FHIRKitPrimitive<FHIRKitString>
  
  /// Source of the definition for parameter
  public var definition: FHIRKitPrimitive<Canonical>?
  
  /// The type of value a search parameter refers to and how the content is interpreted
  public var type: FHIRKitPrimitive<SearchParamType>
  
  /// Server-specific usage
  public var documentation: FHIRKitPrimitive<FHIRKitString>?
  
  public init(name: FHIRKitPrimitive<FHIRKitString>, type: FHIRKitPrimitive<SearchParamType>) {
    self.name = name
    self.type = type
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    name: FHIRKitPrimitive<FHIRKitString>,
    definition: FHIRKitPrimitive<Canonical>? = nil,
    type: FHIRKitPrimitive<SearchParamType>,
    documentation: FHIRKitPrimitive<FHIRKitString>?
  ) {
    self.init(name: name, type: type)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.definition = definition
    self.documentation = documentation
  }
  
  // MARK: - Coding
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case definition; case _definition
    case type; case _type
    case documentation; case _documentation
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKey: .name, auxiliaryKey: ._name)
    self.definition = try FHIRKitPrimitive<Canonical>(from: _container, forKeyIfPresent: .definition, auxiliaryKey: ._definition)
    self.type = try FHIRKitPrimitive<SearchParamType>(from: _container, forKey: .type, auxiliaryKey: ._type)
    self.documentation = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .documentation, auxiliaryKey: ._documentation)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try name.encode(on: &_container, forKey: .name, auxiliaryKey: ._name)
    try definition?.encode(on: &_container, forKey: .definition, auxiliaryKey: ._definition)
    try type.encode(on: &_container, forKey: .type, auxiliaryKey: ._type)
    try documentation?.encode(on: &_container, forKey: .documentation, auxiliaryKey: ._documentation)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementRestResourceSearchParam else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name
    && definition == _other.definition
    && type == _other.type
    && documentation == _other.documentation
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(definition)
    hasher.combine(type)
    hasher.combine(documentation)
  }
}
