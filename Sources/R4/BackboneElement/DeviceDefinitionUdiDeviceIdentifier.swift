//
//  DeviceDefintionUdiDeviceIdentifier.swift
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
 Unique Device Identifier (UDI) Barcode string; Unique Device Idenfifier (UDI) assigned to device label or package.
 Note that the `Device` may include multiple `udiCarrier`s as it either may include just the `udiCarrier`
 for the jurisdiction it is sold, or for multiple jurisdictions it could have been sold
 */
open class DeviceDefinitionUdiDeviceIdentfier: BackboneElement {
  /// The identifier that is to be associated with every `Device` that references this `DeviceDefinition`
  /// for the issuer and jurisdiction provided in the `DeviceDefintion.udiDeviceIdentifier`
  public var deviceIdentifier: FHIRKitPrimitive<FHIRKitString>
  
  /// The organization that assigns the identifier algorithm
  public var issuer: FHIRKitPrimitive<FHIRKitURI>
  
  /// The jurisdiction to which the `deviceIdentifier` applies
  public var jurisdiction: FHIRKitPrimitive<FHIRKitURI>
  
  public init(deviceIdentifier: FHIRKitPrimitive<FHIRKitString>, issuer: FHIRKitPrimitive<FHIRKitURI>, jurisdiction: FHIRKitPrimitive<FHIRKitURI>) {
    self.deviceIdentifier = deviceIdentifier
    self.issuer = issuer
    self.jurisdiction = jurisdiction
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    deviceIdentifier: FHIRKitPrimitive<FHIRKitString>,
    issuer: FHIRKitPrimitive<FHIRKitURI>,
    jurisdiction: FHIRKitPrimitive<FHIRKitURI>
  ) {
    self.init(deviceIdentifier: deviceIdentifier, issuer: issuer, jurisdiction: jurisdiction)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case deviceIdentifier; case _deviceIdentifier
    case issuer; case _issuer
    case jurisdiction; case _jurisdiction
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.deviceIdentifier = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .deviceIdentifier, auxKey: ._deviceIdentifier)
    self.issuer = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKey: .issuer, auxKey: ._issuer)
    self.jurisdiction = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKey: .jurisdiction, auxKey: ._issuer)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try deviceIdentifier.encode(on: &codingKeyContainer, forKey: .deviceIdentifier, auxKey: ._deviceIdentifier)
    try issuer.encode(on: &codingKeyContainer, forKey: .issuer, auxKey: ._issuer)
    try jurisdiction.encode(on: &codingKeyContainer, forKey: .jurisdiction, auxKey: ._jurisdiction)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceDefinitionUdiDeviceIdentfier else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return deviceIdentifier == _other.deviceIdentifier
    && issuer == _other.issuer
    && jurisdiction == _other.jurisdiction
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(deviceIdentifier)
    hasher.combine(issuer)
    hasher.combine(jurisdiction)
  }
}
