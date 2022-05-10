//
//  DeviceName.swift
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
 The name of the device as given by the manufacturer; This represents the manufacturer's name of the device as
 provided by the device, from a UDI label, or by a person describing the `Device`. This typically would be used
 when a person provides the name(s) or when the device represents one of the names available from
 `DeviceDefinition`
 */
open class DeviceName: BackboneElement {
  /// The name of the device
  public var name: AsclepiusPrimitive<AsclepiusString>
  
  /// The type of `deviceName`
  /// `UDILabelName` | `UserFriendlyName` | `PatientReportedName` | `ManufactureDeviceName` | `ModelName`
  public var type: AsclepiusPrimitive<DeviceNameType>
  
  public init(name: AsclepiusPrimitive<AsclepiusString>, type: AsclepiusPrimitive<DeviceNameType>) {
    self.name = name
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    name: AsclepiusPrimitive<AsclepiusString>,
    type: AsclepiusPrimitive<DeviceNameType>
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
    
    self.name = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.type = try AsclepiusPrimitive<DeviceNameType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceName else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name
    && type == _other.type
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(type)
  }
}
