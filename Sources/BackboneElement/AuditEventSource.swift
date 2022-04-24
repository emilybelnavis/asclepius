//
//  AuditEventSource.swift
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

/// The system that is reporting the event
open class AuditEventSource: BackboneElement {
  /// Logical source location within the enterprise
  public var site: FHIRKitPrimitive<FHIRKitString>?
  
  /// The identity of the source detecting the event
  public var observer: Reference
  
  /// The type of source where the event originated from
  public var type: [Coding]?
  
  public init(observer: Reference) {
    self.observer = observer
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimtive<FHIRKitString>? = nil,
    site: FHIRKitPrimitive<FHIRKitString>? = nil,
    observer: Reference,
    type: [Coding]? = nil
  ) {
    self.init(observer: observer)
    self.`extension` = `extension`
    self.id = id
    self.site = site
    self.observer = observer
    self.type = type
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case site; case _site
    case observer
    case type
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.site = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .site, auxiliaryKey: ._site)
    self.observer = try Reference(from: _container, forKey: .observer)
    self.type = try [Coding](from: _container, forKeyIfPresent: .type)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try site?.encode(on: &_container, forKey: .site, auxiliaryKey: ._site)
    try observer.encode(on: &_container, forKey: .observer)
    try type?.encode(on: &_container, forKey: .type)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AuditEventSource else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return site == _other.site
    && observer == _other.observer
    && type == _other.type
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(site)
    hasher.combine(observer)
    hasher.combine(type)
  }
}
