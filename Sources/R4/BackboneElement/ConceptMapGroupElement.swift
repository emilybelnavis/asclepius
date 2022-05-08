//
//  ConceptMapGroupElement.swift
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

/// Mappings for an individual concept in the source to one or more concepts in the target
open class ConceptMapGroupElement: BackboneElement {
  /// Identifies element being mapped
  public var code: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Display for the code
  public var display: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Concept in target system for element
  public var target: [ConceptMapGroupElementTarget]?
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    code: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    display: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    target: [ConceptMapGroupElementTarget]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.code = code
    self.display = display
    self.target = target
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code; case _code
    case display; case _display
    case target
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.code = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .code, auxKey: ._code)
    self.display = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .display, auxKey: ._display)
    self.target = try [ConceptMapGroupElementTarget](from: codingKeyContainer, forKeyIfPresent: .target)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try code?.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try display?.encode(on: &codingKeyContainer, forKey: .display, auxKey: ._display)
    try target?.encode(on: &codingKeyContainer, forKey: .target)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConceptMapGroupElement else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && display == _other.display
    && target == _other.target
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(display)
    hasher.combine(target)
  }
}
