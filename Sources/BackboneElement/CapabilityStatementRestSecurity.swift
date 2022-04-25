//
//  CapabilityStatementRestSecurity.swift
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

/// Information about security implementation form an interface perspective - what a client needs to know
open class CapabilityStatementRestSecurity: BackboneElement {
  /// Adds CORS headers (http://enable-cors.org/)
  public var cors: FHIRKitPrimitive<FHIRKitBool>?
  
  /// OAuth | SMART-on-FHIR | NTLM | Basic | Kerberos | Certificates
  public var service: [CodableConcept]?
  
  /// General description of how security works
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    cors: FHIRKitPrimitive<FHIRKitBool>? = nil,
    service: [CodableConcept]? = nil,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.cors = cors
    self.service = service
    self.fhirDescription = fhirDescription
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case cors; case _cors
    case service
    case fhirDescription; case _fhirDescription
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.cors = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .cors, auxiliaryKey: ._cors)
    self.service = try [CodableConcept](from: _container, forKeyIfPresent: .service)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .fhirDescription, auxiliaryKey: ._fhirDescription)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try cors?.encode(on: &_container, forKey: .cors, auxiliaryKey: ._cors)
    try service?.encode(on: &_container, forKey: .service)
    try fhirDescription?.encode(on: &_container, forKey: .fhirDescription, auxiliaryKey: ._fhirDescription)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementRestSecurity else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return cors == _other.cors
    && service == _other.service
    && fhirDescription == _other.fhirDescription
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(cors)
    hasher.combine(service)
    hasher.combine(fhirDescription)
  }
}
