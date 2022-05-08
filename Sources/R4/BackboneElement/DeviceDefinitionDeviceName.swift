//
//  DeviceDefinitionDeviceName.swift
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
 A name given to the device to identify it
 */
open class DeviceDefinitionDeviceName: BackboneElement {
  /// The name of the device
  public var name: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// The type of `deviceName`
  /// `UDILabelName` | `UserFriendlyName` | `PatientReportedName` | `ManufactureDeviceName` | `ModelName`
  public var type: AlexandriaHRMPrimitive<DeviceNameType>
  
  public init(name: AlexandriaHRMPrimitive<AlexandriaHRMString>, type: AlexandriaHRMPrimitive<DeviceNameType>) {
    self.name = name
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    name: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    type: AlexandriaHRMPrimitive<DeviceNameType>
  ) {
    self.init(name: name, type: type)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case type; case _type
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.type = try AlexandriaHRMPrimitive<DeviceNameType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceDefinitionDeviceName else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name
    && type == _other.type
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(type)
  }
}
