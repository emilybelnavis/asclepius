//
//  Signature.swift
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
 A signature along with supporting context. The signature may be a digital signature that is cryptographic in
 nature, or some other signature acceptable to the domain. This other signature may be as simple as a
 graphical image representing a hand-written signature, or a signature ceremony. Different signature
 approaches have different utilities
 */
open class Signature: Element {
  /// indication of the reason the entity signed the object(s_
  public var type: [Coding]
  
  /// when the signature was created
  public var when: FHIRKitPrimitive<FHIRKitInstant>
  
  /// who signed
  public var who: Reference
  
  /// party represented
  public var onBehalfOf: Reference?
  
  /// technical format of the signed resources
  public var targetFormat: FHIRKitPrimitive<FHIRKitString>?
  
  /// the technical format of the signature
  public var sigFormat: FHIRKitPrimitive<FHIRKitString>?
  
  /// the actual signature content (XML DigSig, JWS, picture, etc...)
  public var data: FHIRKitPrimitive<FHIRKitBase64Binary>?
  
  public init(type: [Coding], when: FHIRKitPrimitive<FHIRKitInstant>, who: Reference) {
    self.type = type
    self.when = when
    self.who = who
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: [Coding],
    when: FHIRKitPrimitive<FHIRKitInstant>,
    who: Reference,
    onBehalfOf: Reference? = nil,
    targetFormat: FHIRKitPrimitive<FHIRKitString>? = nil,
    sigFormat: FHIRKitPrimitive<FHIRKitString>? = nil,
    data: FHIRKitPrimitive<FHIRKitBase64Binary>? = nil
  ) {
    self.init(type: type, when: when, who: who)
    self.`extension` = `extension`
    self.id = id
    self.onBehalfOf = onBehalfOf
    self.targetFormat = targetFormat
    self.sigFormat = sigFormat
    self.data = data
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case when; case _when
    case who
    case onBehalfOf
    case targetFormat; case _targetFormat
    case sigFormat; case _sigFormat
    case data; case _data
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try [Coding](from: _container, forKey: .type)
    self.when = try FHIRKitPrimitive<FHIRKitInstant>(from: _container, forKey: .when, auxiliaryKey: ._when)
    self.who = try Reference(from: _container, forKey: .who)
    self.onBehalfOf = try Reference(from: _container, forKeyIfPresent: .onBehalfOf)
    self.targetFormat = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .targetFormat, auxiliaryKey: ._targetFormat)
    self.sigFormat = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .sigFormat, auxiliaryKey: ._sigFormat)
    self.data = try FHIRKitPrimitive<FHIRKitBase64Binary>(from: _container, forKeyIfPresent: .data, auxiliaryKey: ._data)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try type.encode(on: &_container, forKey: .type)
    try when.encode(on: &_container, forKey: .when, auxiliaryKey: ._when)
    try who.encode(on: &_container, forKey: .who)
    try onBehalfOf?.encode(on: &_container, forKey: .onBehalfOf)
    try targetFormat?.encode(on: &_container, forKey: .targetFormat, auxiliaryKey: ._targetFormat)
    try sigFormat?.encode(on: &_container, forKey: .sigFormat, auxiliaryKey: ._sigFormat)
    try data?.encode(on: &_container, forKey: .data, auxiliaryKey: ._data)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Signature else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && when == _other.when
    && who == _other.who
    && onBehalfOf == _other.onBehalfOf
    && targetFormat == _other.targetFormat
    && sigFormat == _other.sigFormat
    && data == _other.data
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(when)
    hasher.combine(who)
    hasher.combine(onBehalfOf)
    hasher.combine(targetFormat)
    hasher.combine(sigFormat)
    hasher.combine(data)
  }
  
}
