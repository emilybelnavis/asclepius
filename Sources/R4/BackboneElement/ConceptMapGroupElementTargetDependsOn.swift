//
//  ConceptMapGroupElementTargetDependsOn.swift
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
 A set of additional dependencies for this mapping to hold. This mapping is only applicable if the specified
 element can be resolbed and has the specified value
 */
open class ConceptMapGroupElementTargetDependsOn: BackboneElement {
  /// Reference to property that mapping depends on
  public var property: AsclepiusPrimitive<AsclepiusURI>
  
  /// Code system (if necessary)
  public var system: AsclepiusPrimitive<Canonical>?
  
  /// Value of the referenced element
  public var value: AsclepiusPrimitive<AsclepiusString>
  
  /// Display for the code (if value is a code)
  public var display: AsclepiusPrimitive<AsclepiusString>?
  
  public init(property: AsclepiusPrimitive<AsclepiusURI>, value: AsclepiusPrimitive<AsclepiusString>) {
    self.property = property
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    property: AsclepiusPrimitive<AsclepiusURI>,
    system: AsclepiusPrimitive<Canonical>? = nil,
    value: AsclepiusPrimitive<AsclepiusString>,
    display: AsclepiusPrimitive<AsclepiusString>? = nil
  ) {
    self.init(property: property, value: value)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.system = system
    self.display = display
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case property; case _property
    case system; case _system
    case value; case _value
    case display; case _display
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.property = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKey: .property, auxKey: ._property)
    self.system = try AsclepiusPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .system, auxKey: ._system)
    self.value = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .value, auxKey: ._value)
    self.display = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .display, auxKey: ._display)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try property.encode(on: &codingKeyContainer, forKey: .property, auxKey: ._property)
    try system?.encode(on: &codingKeyContainer, forKey: .system, auxKey: ._system)
    try value.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try display?.encode(on: &codingKeyContainer, forKey: .display, auxKey: ._display)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConceptMapGroupElementTargetDependsOn else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return property == _other.property
    && system == _other.system
    && value == _other.value
    && display == _other.display
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(property)
    hasher.combine(system)
    hasher.combine(value)
  }
}
