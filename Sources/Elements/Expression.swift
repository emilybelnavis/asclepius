//
//  Expression.swift
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
 An expression that can be used to generate a value
 
 An expression that is evaluated in a specific context and returns a value. The context of use of the
 expression must specify the context in which the expression is evaluated and how the result of the
 expression is used
 */
open class Expression: Element {
  /// Description of the condition
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// Shortname assigned to the xpression for re-use
  public var name: FHIRKitPrimitive<FHIRKitString>?
  
  /// text/cql | text/fhirpath | application/x-fhir-query | etc...
  public var language: FHIRKitPrimitive<FHIRKitString>
  
  /// expression in specified language
  public var expression: FHIRKitPrimitive<FHIRKitString>?
  
  /// where the expression is found
  public var reference: FHIRKitPrimitive<FHIRKitURI>?
 
  public init(language: FHIRKitPrimitive<FHIRKitString>) {
    self.language = language
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    fhirDescriotion: FHIRKitPrimitive<FHIRKitString>? = nil,
    name: FHIRKitPrimitive<FHIRKitString>? = nil,
    language: FHIRKitPrimitive<FHIRKitString>,
    expression: FHIRKitPrimitive<FHIRKitString>? = nil,
    reference: FHIRKitPrimitive<FHIRKitURI>? = nil
  ) {
    self.init(language: language)
    self.`extension` = `extension`
    self.id = id
    self.fhirDescription = fhirDescriotion
    self.name = name
    self.reference = reference
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case fhirDescription = "description"; case _fhirDescription = "_description"
    case name; case _name
    case language; case _language
    case expression; case _expression
    case reference; case _reference
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .fhirDescription, auxiliaryKey: ._fhirDescription)
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .name, auxiliaryKey: ._name)
    self.language = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKey: .language, auxiliaryKey: ._language)
    self.expression = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .expression, auxiliaryKey: ._expression)
    self.reference = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKeyIfPresent: .reference, auxiliaryKey: ._reference)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
  
    try fhirDescription?.encode(on: &_container, forKey: .fhirDescription, auxiliaryKey: ._fhirDescription)
    try name?.encode(on: &_container, forKey: .name, auxiliaryKey: ._name)
    try language.encode(on: &_container, forKey: .language, auxiliaryKey: ._language)
    try expression?.encode(on: &_container, forKey: .expression, auxiliaryKey: ._expression)
    try reference?.encode(on: &_container, forKey: .reference, auxiliaryKey: ._reference)

    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Expression else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return fhirDescription == _other.fhirDescription
    && name == _other.name
    && language == _other.language
    && expression == _other.expression
    && reference == _other.reference
  }
  
  public override func hash(into hasher: inout Hasher) {
    super .hash(into: &hasher)
    hasher.combine(fhirDescription)
    hasher.combine(name)
    hasher.combine(language)
    hasher.combine(expression)
    hasher.combine(reference)
  }
}
