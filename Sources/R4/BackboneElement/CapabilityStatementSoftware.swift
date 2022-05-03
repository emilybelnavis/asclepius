//
//  CapabilityStatementSoftware.swift
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
 Software that is covered by this capability statement. It is used when the capability statement describes the
 capabilites of a particular software version, independent of an installation
 */
open class CapabilityStatementSoftware: BackboneElement {
  /// A name the software is known by
  public var name: FHIRKitPrimitive<FHIRKitString>
  
  /// Version covered by this statement
  public var version: FHIRKitPrimitive<FHIRKitString>?
  
  /// Date this version was released
  public var releaseDate: FHIRKitPrimitive<FHIRKitDateTime>?
  
  public init(name: FHIRKitPrimitive<FHIRKitString>) {
    self.name = name
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    name: FHIRKitPrimitive<FHIRKitString>,
    version: FHIRKitPrimitive<FHIRKitString>? = nil,
    releaseDate: FHIRKitPrimitive<FHIRKitDateTime>? = nil
  ) {
    self.init(name: name)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.version = version
    self.releaseDate = releaseDate
  }
  
  // MARK: - Coding
  private enum CodingKeys: String, CodingKey {
    case name; case _name
    case version; case _version
    case releaseDate; case _releaseDate
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .name, auxKey: ._name)
    self.version = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .version, auxKey: ._version)
    self.releaseDate = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .releaseDate, auxKey: ._releaseDate)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try name.encode(on: &codingKeyContainer, forKey: .name, auxKey: ._name)
    try version?.encode(on: &codingKeyContainer, forKey: .version, auxKey: ._version)
    try releaseDate?.encode(on: &codingKeyContainer, forKey: .releaseDate, auxKey: ._releaseDate)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementSoftware else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return name == _other.name
    && version == _other.version
    && releaseDate == _other.releaseDate
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(name)
    hasher.combine(version)
    hasher.combine(releaseDate)
  }
}
