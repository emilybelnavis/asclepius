//
//  ChargeItemDefinitionApplicability.swift
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
 Expressions that describe applicability criteria for the billing code
 */
open class ChargeItemDefinitionApplicability: BackboneElement {
  /// Natural language description of the condition
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// Language of the expression
  public var language: FHIRKitPrimitive<FHIRKitString>?
  
  /// Boolean-valued expression
  public var expression: FHIRKitPrimitive<FHIRKitString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil,
    language: FHIRKitPrimitive<FHIRKitString>? = nil,
    expression: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.fhirDescription = fhirDescription
    self.language = language
    self.expression = expression
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case fhirDescription; case _fhirDescription
    case language; case _language
    case expression; case _expression
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    self.language = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .language, auxKey: ._language)
    self.expression = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .expression, auxKey: ._expression)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try language?.encode(on: &codingKeyContainer, forKey: .language, auxKey: ._language)
    try expression?.encode(on: &codingKeyContainer, forKey: .expression, auxKey: ._expression)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ChargeItemDefinitionApplicability else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return fhirDescription == _other.fhirDescription
    && language == _other.language
    && expression == _other.expression
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(fhirDescription)
    hasher.combine(language)
    hasher.combine(expression)
  }
}
