//
//  CompositionRelatesTo.swift
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

/// Relationships that this composition has with other compositions or documents that already exist
open class CompositionRelatesTo: BackboneElement {
  public enum TargetX: Hashable {
    case identifier(Identifier)
    case reference(Reference)
  }
  
  /// The type of relationship that this composition has with another composition or document
  public var code: AsclepiusPrimitive<DocumentRelationshipType>
  
  /// Target of the relationship
  public var target: TargetX
  
  public init (code: AsclepiusPrimitive<DocumentRelationshipType>, target: TargetX) {
    self.code = code
    self.target = target
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    code: AsclepiusPrimitive<DocumentRelationshipType>,
    target: TargetX
  ) {
    self.init(code: code, target: target)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case code; case _code
    case targetIdentifier
    case targetReference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tTarget: TargetX?
    if let targetIdentifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .targetIdentifier) {
      if tTarget != nil {
        throw DecodingError.dataCorruptedError(forKey: .targetIdentifier, in: codingKeyContainer, debugDescription: "More than one value provided for \"target\"")
      }
      tTarget = .identifier(targetIdentifier)
    }
    
    if let targetReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .targetReference) {
      if tTarget != nil {
        throw DecodingError.dataCorruptedError(forKey: .targetReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"target\"")
      }
      tTarget = .reference(targetReference)
    }
    
    self.code = try AsclepiusPrimitive<DocumentRelationshipType>(from: codingKeyContainer, forKey: .code, auxKey: ._code)
    self.target = tTarget!
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch target {
    case .identifier(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .targetIdentifier)
    case .reference(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .targetReference)
    }
    
    try code.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CompositionRelatesTo else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return code == _other.code
    && target == _other.target
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(code)
    hasher.combine(target)
  }
}
