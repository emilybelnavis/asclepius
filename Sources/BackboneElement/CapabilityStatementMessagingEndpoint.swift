//
//  CapabilityStatementMessagingEndpoint.swift
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
