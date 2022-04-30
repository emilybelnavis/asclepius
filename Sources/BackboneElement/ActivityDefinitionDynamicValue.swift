//
//  ActivityDefinitionDynamicValue.swift
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
 Dynamic aspects of the definition.
 
 Dynamic values that will be evaluated to produce values for elements of the resulting resource. For example,
 if the dosage of a medication must be computed based on the patient's weight, a dynamic value would be
 used to specify an expression that calculated the weight, and the path on the request resource that would
 contain the result.
 */
open class ActivityDefinitionDynamicValue: BackboneElement {
  /// The path to the element to be set dynamically
  public var path: FHIRKitPrimitive<FHIRKitString>
  
  /// An expression that provides the dynamic value for the customization
  public var expression: Expression
  
  public init(expression: Expression, path: FHIRKitPrimitive<FHIRKitString>) {
    self.path = path
    self.expression = expression
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    path: FHIRKitPrimitive<FHIRKitString>,
    expression: Expression
  ) {
    self.init(expression: expression, path: path)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case path; case _path
    case expression
  }

  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.path = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .path, auxKey: ._path)
    self.expression = try Expression(from: codingKeyContainer, forKey: .expression)
    
    try super.init(from: decoder)
  }

  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try path.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    try expression.encode(on: &codingKeyContainer, forKey: .expression)
    
    try super.encode(to: encoder)
  }

  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ActivityDefinitionDynamicValue else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return path == _other.path
    && expression == _other.expression
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(path)
    hasher.combine(expression)
  }
}
