//
//  DeviceDefinitionSpecialization.swift
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
 The capabilities supported on a device, the standards to which the device conforms for a particular purpose and
 used for the communication
 */
open class DeviceDefinitionSpecialization: BackboneElement {
  /// The standard that is used to operate and communicate
  public var systemType: FHIRKitPrimitive<FHIRKitString>
  
  /// The version of the standard that is used to operate and communicate
  public var version: FHIRKitPrimitive<FHIRKitString>?
  
  public init(systemType: FHIRKitPrimitive<FHIRKitString>) {
    self.systemType = systemType
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    systemType: FHIRKitPrimitive<FHIRKitString>,
    version: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(systemType: systemType)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.version = version
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case systemType; case _systemType
    case version; case _version
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.systemType = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .systemType, auxKey: ._systemType)
    self.version = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .version, auxKey: ._version)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try systemType.encode(on: &codingKeyContainer, forKey: .systemType, auxKey: ._systemType)
    try version?.encode(on: &codingKeyContainer, forKey: .version, auxKey: ._version)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceDefinitionSpecialization else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return systemType == _other.systemType
    && version == _other.version
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(systemType)
    hasher.combine(version)
  }
}
