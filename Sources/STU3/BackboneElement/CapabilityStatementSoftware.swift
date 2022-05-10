//
//  CapabilityStatementSoftware.swift
//  Asclepius
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

import AsclepiusCore

/**
 Software that is covered by this capability statement. It is used when the capability statement describes the
 capabilites of a particular software version, independent of an installation
 */
open class CapabilityStatementSoftware: BackboneElement {
  /// A name the software is known by
  public var name: AsclepiusPrimitive<AsclepiusString>
  
  /// Version covered by this statement
  public var version: AsclepiusPrimitive<AsclepiusString>?
  
  /// Date this version was released
  public var releaseDate: AsclepiusPrimitive<AsclepiusDateTime>?
  
  public init(name: AsclepiusPrimitive<AsclepiusString>) {
    self.name = name
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    name: AsclepiusPrimitive<AsclepiusString>,
    version: AsclepiusPrimitive<AsclepiusString>? = nil,
    releaseDate: AsclepiusPrimitive<AsclepiusDateTime>? = nil
  ) {
    self.init(name: name)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.version = version
    self.releaseDate = releaseDate
  }
  
  // MARK: - Coding
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case version; case _version
    case releaseDate; case _releaseDate
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.version = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .version, auxKey: ._version)
    self.releaseDate = try AsclepiusPrimitive<AsclepiusDateTime>(from: codingKeyContainer, forKeyIfPresent: .releaseDate, auxKey: ._releaseDate)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try version?.encode(on: &codingKeyContainer, forKey: .version, auxKey: ._version)
    try releaseDate?.encode(on: &codingKeyContainer, forKey: .releaseDate, auxKey: ._releaseDate)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementSoftware else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name
    && version == _other.version
    && releaseDate == _other.releaseDate
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(version)
    hasher.combine(releaseDate)
  }
}
