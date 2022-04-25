//
//  CapabilityStatementDocument.swift
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

/// A document definition
open class CapabilityStatementDocument: BackboneElement {
  /// Mode of this document declaration - whether application is a producer or consumer
  public var mode: FHIRKitPrimitive<DocumentMode>
  
  /// Description of document support
  public var documentation: FHIRKitPrimitive<FHIRKitString>?
  
  /// Constraint on the resources used in the document
  public var profile: FHIRKitPrimitive<Canonical>
  
  public init(mode: FHIRKitPrimitive<DocumentMode>, profile: FHIRKitPrimitive<Canonical>) {
    self.mode = mode
    self.profile = profile
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    mode: FHIRKitPrimitive<DocumentMode>,
    documentation: FHIRKitPrimitive<FHIRKitString>? = nil,
    profile: FHIRKitPrimitive<Canonical>
  ) {
    self.init(mode: mode, profile: profile)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.documentation = documentation
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case mode; case _mode
    case documentation; case _documentation
    case profile; case _profile
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    self.mode = try FHIRKitPrimitive<DocumentMode>(from: _container, forKey: .mode, auxiliaryKey: ._mode)
    self.documentation = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .documentation, auxiliaryKey: ._documentation)
    self.profile = try FHIRKitPrimitive<Canonical>(from: _container, forKey: .profile, auxiliaryKey: ._profile)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try mode.encode(on: &_container, forKey: .mode, auxiliaryKey: ._mode)
    try documentation?.encode(on: &_container, forKey: .documentation, auxiliaryKey: ._documentation)
    try profile.encode(on: &_container, forKey: .profile, auxiliaryKey: ._profile)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementDocument else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return mode == _other.mode
    && documentation == _other.documentation
    && profile == _other.profile
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(mode)
    hasher.combine(documentation)
    hasher.combine(profile)
  }
}
