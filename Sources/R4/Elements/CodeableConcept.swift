//
//  CodableConcept.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/**
 Concept - reference to a terminology or just text
 
 A concept that may be defined by a formal reference to a terminology, ontology, or may be provided by text
 */
open class CodableConcept: Element {
  /// Code defined by a terminology system
  public var coding: [Coding]?
  
  /// Plain text representation of the concept
  public var text: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    coding: [Coding]? = nil,
    text: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.coding = coding
    self.text = text
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case coding
    case text; case _text
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.coding = try [Coding](from: codingKeyContainer, forKeyIfPresent: .coding)
    self.text = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .text, auxKey: ._text)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try coding?.encode(on: &codingKeyContainer, forKey: .coding)
    try text?.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CodableConcept else {
      return false
    }
    
    guard _other.isEqual(to: _other) else {
      return false
    }
    
    return coding == _other.coding
    && text == _other.text
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    
    hasher.combine(coding)
    hasher.combine(text)
  }
}
