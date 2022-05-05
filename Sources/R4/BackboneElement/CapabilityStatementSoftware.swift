//
//  CapabilityStatementSoftware.swift
//  FHIRKit
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

import FHIRKitCore

/**
 Software that is covered by this capability statement. It is used when the capability statement describes the
 capabilites of a particular software version, independent of an installation
 */
open class CapabilityStatementSoftware: BackboneElement {
  /// A name the software is known by
  public var name: FHIRKitPrimitive<FHIRKitString>
  
  /// Version covered by this statement
  public var version: FHIRKitPrimitive<FHIRKitString>?
  
  /// Date this version was released
  public var releaseDate: FHIRKitPrimitive<FHIRKitDateTime>?
  
  public init(name: FHIRKitPrimitive<FHIRKitString>) {
    self.name = name
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    name: FHIRKitPrimitive<FHIRKitString>,
    version: FHIRKitPrimitive<FHIRKitString>? = nil,
    releaseDate: FHIRKitPrimitive<FHIRKitDateTime>? = nil
  ) {
    self.init(name: name)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.version = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .version, auxKey: ._version)
    self.releaseDate = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .releaseDate, auxKey: ._releaseDate)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try version?.encode(on: &codingKeyContainer, forKey: .version, auxKey: ._version)
    try releaseDate?.encode(on: &codingKeyContainer, forKey: .releaseDate, auxKey: ._releaseDate)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(version)
    hasher.combine(releaseDate)
  }
}
