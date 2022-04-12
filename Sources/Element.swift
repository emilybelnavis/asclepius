//
//  Element.swift
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


/// Base definition for all elements in a resource
open class Element: FHIRKitType {
  /// Unique id for inter-element referencing
  public var id: FHIRKitPrimitive<FHIRString>?
  
  /// Additional content defined by implementations
  public var `extension`: [Extension]?
  
  /// Designated initializer taking all required properties
  public init() {}

  /// Convenience initializer
  public convenience init(`extension`: [Extension]? = nil, id: FHIRPrimitive<FHIRString>? = nil) {
    self.init()
    self.`extension` = `extension`
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case `extension` = "extension"
    case id; case _id
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decode.container(keyedBy: CodingKeys.self)
    
    self.`extension` = try [Extension](from: _container, forKeyIfPresent: .`extension`)
    self.id = try FHIRKitPrimitive<FHIRString>(from: _container, forKeyIfPresent: .id, auxiliaryKey: ._id)
  }
  
  public func encode(to encode: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try `extension`?.encode(on: &_container, forKey: .`extension`)
    try id?.encode(on: &_container, forKey: .id, auxiliaryKey: ._id)
  }
  
  // MARK: - Equatable & Hashable
  public static func ==(l: Element, r: Element) -> Bool {
    guard let _other = _other as? Element else {
      return false
    }
    
    guard type(of: self) == type(of: _other) else {
      return false
    }
    
    return `extension` == _other.`extension` && id == _other.id
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(`extension`)
    hasher.combine(id)
  }
}
