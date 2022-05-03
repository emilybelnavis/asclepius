//
//  DeviceUdiCarrier.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

/**
 Unique Device Identifier (UDI) Barcode String; Unique Device Identifier (UDI) assigned to the device label or
 package. Note that the `Device` may include multiple `udiCarrier`s as it either may just include the
 `udiCarrier` for the jurisdiction it is sold or for multiple jurisdictions it could have been sold
 */
open class DeviceUdiCarrier: BackboneElement {
  /// Mandatory fixed portion of UDI
  public var deviceIdentifier: FHIRKitPrimitive<FHIRKitString>?
  
  /// UDI Issuing organization
  public var issuer: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Regional UDI authority
  public var jurisdiction: FHIRKitPrimitive<FHIRKitURI>?
  
  /// UDI Machine Readable Barcode String
  public var carrierAIDC: FHIRKitPrimitive<FHIRKitBase64Binary>?
  
  /// UDI Human Readable Barcode String
  public var carrierHRF: FHIRKitPrimitive<FHIRKitString>?
  
  /// A coded entry to indicate how the data was entered
  public var entryTime: FHIRKitPrimitive<UDIEntryType>?
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    deviceIdentifier: FHIRKitPrimitive<FHIRKitString>? = nil,
    issuer: FHIRKitPrimitive<FHIRKitURI>? = nil,
    jurisdiction: FHIRKitPrimitive<FHIRKitURI>? = nil,
    carrierAIDC: FHIRKitPrimitive<FHIRKitBase64Binary>? = nil,
    carrierHRF: FHIRKitPrimitive<FHIRKitString>? = nil,
    entryTime: FHIRKitPrimitive<UDIEntryType>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    
    self.deviceIdentifier = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .deviceIdentifier, auxKey: ._deviceIdentifier)
    self.issuer = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .issuer, auxKey: ._issuer)
    self.jurisdiction = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .jurisdiction, auxKey: ._jurisdiction)
    self.carrierAIDC = try FHIRKitPrimitive<FHIRKitBase64Binary>(from: codingKeyContainer, forKeyIfPresent: .carrierAIDC, auxKey: ._carrierAIDC)
    self.carrierHRF = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .carrierHRF, auxKey: ._carrierHRF)
    self.entryTime = try FHIRKitPrimitive<UDIEntryType>(from: codingKeyContainer, forKeyIfPresent: .entryTime, auxKey: ._entryTime)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
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
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(deviceIdentifier)
    hasher.combine(issuer)
    hasher.combine(jurisdiction)
    hasher.combine(carrierAIDC)
    hasher.combine(carrierHRF)
    hasher.combine(entryTime)
  }
}
