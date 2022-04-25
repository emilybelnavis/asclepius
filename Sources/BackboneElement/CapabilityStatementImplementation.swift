//
//  CapabilityStatementImplementation.swift
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

/**
 Identifies a specific implementatin instance that is described by the capability statement - i.e. a particular
 installatltion, rather than the capabilities of a software program
 */
open class CapabilityStatementImplementation: BackboneElement {
  /// Describes this specific instance
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>
  
  /// Base URL for the installation
  public var url: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Organization that manages the data
  public var custodian: Reference?
  
  public init(fhirDescription: FHIRKitPrimitive<FHIRKitString>) {
    self.fhirDescription = fhirDescription
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>,
    url: FHIRKitPrimitive<FHIRKitURI>? = nil,
    custodian: Reference?
  ) {
    self.init(fhirDescription: fhirDescription)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.url = url
    self.custodian = custodian
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case fhirDescription; case _fhirDescription
    case url; case _url
    case custodian
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKey: .fhirDescription, auxiliaryKey: ._fhirDescription)
    self.url = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKeyIfPresent: .url, auxiliaryKey: ._url)
    self.custodian = try Reference(from: _container, forKeyIfPresent: .custodian)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try fhirDescription.encode(on: &_container, forKey: .fhirDescription, auxiliaryKey: ._fhirDescription)
    try url?.encode(on: &_container, forKey: .url, auxiliaryKey: ._url)
    try custodian?.encode(on: &_container, forKey: .custodian)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementImplementation else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return fhirDescription == _other.fhirDescription
    && url == _other.url
    && custodian == _other.custodian
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(fhirDescription)
    hasher.combine(url)
    hasher.combine(custodian)
  }
}
