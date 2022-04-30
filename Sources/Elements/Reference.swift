//
//  Reference.swift
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

/// A reference from one resource to another
open class Reference: Element {
  /// Literal reference, relative, internal, or absolute URL
  public var reference: FHIRKitPrimitive<FHIRKitString>?
  
  /// Type the reference refers to (e.g. "Patient")
  public var type: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Logical reference for when literal reference is not known
  public var identifier: Identifier?
  
  /// Text alternative for the resource
  public var display: FHIRKitPrimitive<FHIRKitString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    reference: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<FHIRKitURI>? = nil,
    identifier: Identifier? = nil,
    display: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.reference = reference
    self.type = type
    self.identifier = identifier
    self.display = display
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case reference; case _reference
    case type; case _type
    case identifier
    case display; case _display
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.reference = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .reference, auxKey: ._reference)
    self.type = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .type, auxKey: ._type)
    self.identifier = try Identifier(from: codingKeyContainer, forKeyIfPresent: .identifier)
    self.display = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .display, auxKey: ._display)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try reference?.encode(on: &codingKeyContainer, forKey: .reference, auxKey: ._reference)
    try type?.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try identifier?.encode(on: &codingKeyContainer, forKey: .identifier)
    try display?.encode(on: &codingKeyContainer, forKey: .display, auxKey: ._display)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Reference else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return reference == _other.reference
    && type == _other.type
    && identifier == _other.identifier
    && display == _other.display
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    
    hasher.combine(reference)
    hasher.combine(type)
    hasher.combine(identifier)
    hasher.combine(display)
  }
}
