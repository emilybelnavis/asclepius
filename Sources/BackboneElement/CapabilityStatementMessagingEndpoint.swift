//
//  CapabilityStatementMessagingEndpoint.swift
//  FHIRKIT
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
  public var `protocol`: Coding
  
  /// Network address or identifier of the endpoint
  public var address: FHIRKitPrimitive<FHIRKitURI>
  
  public init(`protocol`: Coding, address: FHIRKitPrimitive<FHIRKitURI>) {
    self.`protocol` = `protocol`
    self.address = address
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    `protocol`: Coding,
    address: FHIRKitPrimitive<FHIRKitURI>
  ) {
    self.init(protocol: `protocol`, address: address)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case `protocol`
    case address; case _address
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.`protocol` = try Coding(from: _container, forKey: .`protocol`)
    self.address = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKey: .address, auxiliaryKey: ._address)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try `protocol`.encode(on: &_container, forKey: .`protocol`)
    try address.encode(on: &_container, forKey: .address, auxiliaryKey: ._address)
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
    
    return `protocol` == _other.`protocol`
    && address == _other.address
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(`protocol`)
    hasher.combine(address)
  }
}
