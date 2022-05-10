//
//  DeviceUdiCarrier.swift
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
 Unique Device Identifier (UDI) Barcode String; Unique Device Identifier (UDI) assigned to the device label or
 package. Note that the `Device` may include multiple `udiCarrier`s as it either may just include the
 `udiCarrier` for the jurisdiction it is sold or for multiple jurisdictions it could have been sold
 */
open class DeviceUdiCarrier: BackboneElement {
  /// Mandatory fixed portion of UDI
  public var deviceIdentifier: AsclepiusPrimitive<AsclepiusString>?
  
  /// UDI Issuing organization
  public var issuer: AsclepiusPrimitive<AsclepiusURI>?
  
  /// Regional UDI authority
  public var jurisdiction: AsclepiusPrimitive<AsclepiusURI>?
  
  /// UDI Machine Readable Barcode String
  public var carrierAIDC: AsclepiusPrimitive<AsclepiusBase64Binary>?
  
  /// UDI Human Readable Barcode String
  public var carrierHRF: AsclepiusPrimitive<AsclepiusString>?
  
  /// A coded entry to indicate how the data was entered
  public var entryTime: AsclepiusPrimitive<UDIEntryType>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    deviceIdentifier: AsclepiusPrimitive<AsclepiusString>? = nil,
    issuer: AsclepiusPrimitive<AsclepiusURI>? = nil,
    jurisdiction: AsclepiusPrimitive<AsclepiusURI>? = nil,
    carrierAIDC: AsclepiusPrimitive<AsclepiusBase64Binary>? = nil,
    carrierHRF: AsclepiusPrimitive<AsclepiusString>? = nil,
    entryTime: AsclepiusPrimitive<UDIEntryType>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.deviceIdentifier = deviceIdentifier
    self.issuer = issuer
    self.jurisdiction = jurisdiction
    self.carrierAIDC = carrierAIDC
    self.carrierHRF = carrierHRF
    self.entryTime = entryTime
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case deviceIdentifier; case _deviceIdentifier
    case issuer; case _issuer
    case jurisdiction; case _jurisdiction
    case carrierAIDC; case _carrierAIDC
    case carrierHRF; case _carrierHRF
    case entryTime; case _entryTime
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.deviceIdentifier = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .deviceIdentifier, auxKey: ._deviceIdentifier)
    self.issuer = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .issuer, auxKey: ._issuer)
    self.jurisdiction = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .jurisdiction, auxKey: ._jurisdiction)
    self.carrierAIDC = try AsclepiusPrimitive<AsclepiusBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .carrierAIDC, auxKey: ._carrierAIDC)
    self.carrierHRF = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .carrierHRF, auxKey: ._carrierHRF)
    self.entryTime = try AsclepiusPrimitive<UDIEntryType>(from: codingKeyContainer, forKeyIfPresent: .entryTime, auxKey: ._entryTime)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try deviceIdentifier?.encode(on: &codingKeyContainer, forKey: .deviceIdentifier, auxKey: ._deviceIdentifier)
    try issuer?.encode(on: &codingKeyContainer, forKey: .issuer, auxKey: ._issuer)
    try jurisdiction?.encode(on: &codingKeyContainer, forKey: .jurisdiction, auxKey: ._jurisdiction)
    try carrierAIDC?.encode(on: &codingKeyContainer, forKey: .carrierAIDC, auxKey: ._carrierAIDC)
    try carrierHRF?.encode(on: &codingKeyContainer, forKey: .carrierHRF, auxKey: ._carrierHRF)
    try entryTime?.encode(on: &codingKeyContainer, forKey: .entryTime, auxKey: ._entryTime)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceUdiCarrier else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return deviceIdentifier == _other.deviceIdentifier
    && issuer == _other.issuer
    && jurisdiction == _other.jurisdiction
    && carrierAIDC == _other.carrierAIDC
    && carrierHRF == _other.carrierHRF
    && entryTime == _other.entryTime
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(deviceIdentifier)
    hasher.combine(issuer)
    hasher.combine(jurisdiction)
    hasher.combine(carrierAIDC)
    hasher.combine(carrierHRF)
    hasher.combine(entryTime)
  }
}
