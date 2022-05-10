//
//  Expression.swift
//  Asclepius
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

import AsclepiusCore

/**
 An expression that can be used to generate a value
 
 An expression that is evaluated in a specific context and returns a value. The context of use of the
 expression must specify the context in which the expression is evaluated and how the result of the
 expression is used
 */
open class Expression: Element {
  /// Description of the condition
  public var fhirDescription: AsclepiusPrimitive<AsclepiusString>?
  
  /// Shortname assigned to the xpression for re-use
  public var name: AsclepiusPrimitive<AsclepiusString>?
  
  /// text/cql | text/fhirpath | application/x-fhir-query | etc...
  public var language: AsclepiusPrimitive<AsclepiusString>
  
  /// expression in specified language
  public var expression: AsclepiusPrimitive<AsclepiusString>?
  
  /// where the expression is found
  public var reference: AsclepiusPrimitive<AsclepiusURI>?
 
  public init(language: AsclepiusPrimitive<AsclepiusString>) {
    self.language = language
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    fhirDescriotion: AsclepiusPrimitive<AsclepiusString>? = nil,
    name: AsclepiusPrimitive<AsclepiusString>? = nil,
    language: AsclepiusPrimitive<AsclepiusString>,
    expression: AsclepiusPrimitive<AsclepiusString>? = nil,
    reference: AsclepiusPrimitive<AsclepiusURI>? = nil
  ) {
    self.init(language: language)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
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
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fhirDescription = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    self.name = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .name, auxKey: ._name)
    self.language = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .language, auxKey: ._language)
    self.expression = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .expression, auxKey: ._expression)
    self.reference = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .reference, auxKey: ._reference)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
  
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try name?.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try language.encode(on: &codingKeyContainer, forKey: .language, auxKey: ._language)
    try expression?.encode(on: &codingKeyContainer, forKey: .expression, auxKey: ._expression)
    try reference?.encode(on: &codingKeyContainer, forKey: .reference, auxKey: ._reference)

    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
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
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super .hash(into: &hasher)
    hasher.combine(fhirDescription)
    hasher.combine(name)
    hasher.combine(language)
    hasher.combine(expression)
    hasher.combine(reference)
  }
}
