//
//  Reference.swift
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

/// A reference from one resource to another
open class Reference: Element {
  /// Literal reference, relative, internal, or absolute URL
  public var reference: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Type the reference refers to (e.g. "Patient")
  public var type: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  
  /// Logical reference for when literal reference is not known
  public var identifier: Identifier?
  
  /// Text alternative for the resource
  public var display: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    reference: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil,
    identifier: Identifier? = nil,
    display: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.reference = reference
    self.type = type
    self.identifier = identifier
    self.display = display
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case reference; case _reference
    case type; case _type
    case identifier
    case display; case _display
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.reference = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .reference, auxKey: ._reference)
    self.type = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKeyIfPresent: .type, auxKey: ._type)
    self.identifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .identifier)
    self.display = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .display, auxKey: ._display)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try reference?.encode(on: &codingKeyContainer, forKey: .reference, auxKey: ._reference)
    try type?.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try display?.encode(on: &codingKeyContainer, forKey: .display, auxKey: ._display)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Reference else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return reference == _other.reference
    && type == _other.type
    && identifier == _other.identifier
    && display == _other.display
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    
    hasher.combine(reference)
    hasher.combine(type)
    hasher.combine(identifier)
    hasher.combine(display)
  }
}
