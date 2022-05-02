//
//  DeviceName.swift
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
 The name of the device as given by the manufacturer; This represents the manufacturer's name of the device as
 provided by the device, from a UDI label, or by a person describing the `Device`. This typically would be used
 when a person provides the name(s) or when the device represents one of the names available from
 `DeviceDefinition`
 */
open class DeviceName: BackboneElement {
  /// The name of the device
  public var name: FHIRKitPrimitive<FHIRKitString>
  
  /// The type of `deviceName`
  /// `UDILabelName` | `UserFriendlyName` | `PatientReportedName` | `ManufactureDeviceName` | `ModelName`
  public var type: FHIRKitPrimitive<DeviceNameType>
  
  public init(name: FHIRKitPrimitive<FHIRKitString>, type: FHIRKitPrimitive<DeviceNameType>) {
    self.name = name
    self.type = type
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    name: FHIRKitPrimitive<FHIRKitString>,
    type: FHIRKitPrimitive<DeviceNameType>
  ) {
    self.init(name: name, type: type)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case type; case _type
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.type = try FHIRKitPrimitive<DeviceNameType>(from: codingKeyContainer, forKey: .type, auxKey: ._type)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try type.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(type)
  }
}
