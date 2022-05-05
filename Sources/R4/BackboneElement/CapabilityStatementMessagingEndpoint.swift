//
//  CapabilityStatementMessagingEndpoint.swift
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

/// An endpoint (network accessible address) to which messages and/or replies are to be sent
open class CapabilityStatementMessagingEndpoint: BackboneElement {
  /// http | ftp | mllp | etc...
  public var networkProtocol: Coding
  
  /// Network address or identifier of the endpoint
  public var address: FHIRKitPrimitive<FHIRKitURI>
  
  public init(networkProtocol: Coding, address: FHIRKitPrimitive<FHIRKitURI>) {
    self.networkProtocol = networkProtocol
    self.address = address
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    networkProtocol: Coding,
    address: FHIRKitPrimitive<FHIRKitURI>
  ) {
    self.init(networkProtocol: networkProtocol, address: address)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case networkProtocol
    case address; case _address
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.networkProtocol = try Coding(from: codingKeyContainer, forKey: .networkProtocol)
    self.address = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKey: .address, auxKey: ._address)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try networkProtocol.encode(on: &codingKeyContainer, forKey: .networkProtocol)
    try address.encode(on: &codingKeyContainer, forKey: .address, auxKey: ._address)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementMessagingEndpoint else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return networkProtocol == _other.networkProtocol
    && address == _other.address
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(networkProtocol)
    hasher.combine(address)
  }
}
