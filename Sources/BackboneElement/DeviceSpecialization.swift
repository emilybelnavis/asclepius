//
//  DeviceSpecialization.swift
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
 The capabilities supported on a device, the standards to which the device conforms for a particular purpose
 and used for the communication
 */
open class DeviceSpecialization: BackboneElement {
  /// The standard that is used to operate and communicate
  public var systemType: CodableConcept
  
  /// The version of the standard that is used to operate and communicate
  public var version: FHIRKitPrimitive<FHIRKitString>?
  
  public init(systemType: CodableConcept) {
    self.systemType = systemType
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    systemType: CodableConcept,
    version: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init(systemType: systemType)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.version = version
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case systemType
    case version; case _version
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.systemType = try CodableConcept(from: codingKeyContainer, forKey: .systemType)
    self.version = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .version, auxKey: ._version)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try systemType.encode(on: &codingKeyContainer, forKey: .systemType)
    try version?.encode(on: &codingKeyContainer, forKey: .version, auxKey: ._version)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceSpecialization else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return systemType == _other.systemType
    && version == _other.version
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(systemType)
    hasher.combine(version)
  }
}
