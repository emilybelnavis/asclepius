//
//  CapabilityStatementRestResourceOperation.swift
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
 Definition of an operation or a named query together with its parameters and their meaning and type.
 Consult the definition of the operation for details about how to invoke the operaion and the parameters
 */
open class CapabilityStatementRestResourceOperation: BackboneElement {
  /// Name that invokes the operation/query
  public var name: FHIRKitPrimitive<FHIRKitString>
  
  /// The defined operation/query
  public var definition: FHIRKitPrimitive<Canonical>
  
  /// Specific details about operation behaviour
  public var documentation: FHIRKitPrimitive<FHIRKitString>?
  
  public init(name: FHIRKitPrimitive<FHIRKitString>, definition: FHIRKitPrimitive<Canonical>) {
    self.name = name
    self.definition = definition
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    name: FHIRKitPrimitive<FHIRKitString>,
    definition: FHIRKitPrimitive<Canonical>,
    documentation: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(name: name, definition: definition)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.documentation = documentation
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case definition; case _definition
    case documentation; case _documentation
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.definition = try FHIRKitPrimitive<Canonical>(from: codingKeyContainer, forKey: .definition, auxKey: .definition)
    self.documentation = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .documentation, auxKey: ._documentation)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try definition.encode(on: &codingKeyContainer, forKey: .definition, auxKey: ._definition)
    try documentation?.encode(on: &codingKeyContainer, forKey: .documentation, auxKey: ._documentation)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementRestResourceOperation else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name
    && definition == _other.definition
    && documentation == _other.documentation
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(definition)
    hasher.combine(documentation)
  }
}
