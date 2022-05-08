//
//  ActivityDefinitionDynamicValue.swift
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
 Dynamic aspects of the definition.
 
 Dynamic values that will be evaluated to produce values for elements of the resulting resource. For example,
 if the dosage of a medication must be computed based on the patient's weight, a dynamic value would be
 used to specify an expression that calculated the weight, and the path on the request resource that would
 contain the result.
 */
open class ActivityDefinitionDynamicValue: BackboneElement {
  /// The path to the element to be set dynamically
  public var path: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// An expression that provides the dynamic value for the customization
  public var expression: Expression
  
  public init(expression: Expression, path: AlexandriaHRMPrimitive<AlexandriaHRMString>) {
    self.path = path
    self.expression = expression
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    path: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    expression: Expression
  ) {
    self.init(expression: expression, path: path)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case path; case _path
    case expression
  }

  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.path = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .path, auxKey: ._path)
    self.expression = try Expression(from: codingKeyContainer, forKey: .expression)
    
    try super.init(from: decoder)
  }

  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try path.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    try expression.encode(on: &codingKeyContainer, forKey: .expression)
    
    try super.encode(to: encoder)
  }

  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
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
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(path)
    hasher.combine(expression)
  }
}
