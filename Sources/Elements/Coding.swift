//
//  Coding.swift
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

open class Coding: Element {
  public var system: FHIRKitPrimitive<FHIRKitURI>?
  public var version: FHIRKitPrimitive<FHIRKitString>?
  public var code: FHIRKitPrimitive<FHIRKitString>?
  public var display: FHIRKitPrimitive<FHIRKitString>?
  public var userSelected: FHIRKitPrimitive<FHIRKitBool>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    `extension`: [Extension]? = nil,
    system: FHIRKitPrimitive<FHIRKitURI>? = nil,
    version: FHIRKitPrimitive<FHIRKitString>? = nil,
    code: FHIRKitPrimitive<FHIRKitString>? = nil,
    display: FHIRKitPrimitive<FHIRKitString>? = nil,
    userSelected: FHIRKitPrimitive<FHIRKitBool>? = nil
  ) {
    self.init()
    self.id = id
    self.`extension` = `extension`
    self.system = system
    self.version = version
    self.code = code
    self.display = display
    self.userSelected = userSelected
  }
  
  // MARK: - codable
  private enum CodingKeys: String, CodingKey {
    case system; case _system
    case version; case _version
    case code; case _code
    case display; case _display
    case userSelected; case _userSelected
  }
  
  /// decodable
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.system = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKeyIfPresent: .system, auxiliaryKey: ._system)
    self.version = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .version, auxiliaryKey: ._version)
    self.code = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .code, auxiliaryKey: ._code)
    self.display = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .display, auxiliaryKey: ._display)
    self.userSelected = try FHIRKitPrimitive<FHIRKitBool>(from: _container, forKeyIfPresent: .userSelected, auxiliaryKey: ._userSelected)
    
    try super.init(from: decoder)
  }
  
  /// encodable
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try system?.encode(on: &_container, forKey: .system, auxiliaryKey: ._system)
    try version?.encode(on: &_container, forKey: .version, auxiliaryKey: ._version)
    try code?.encode(on: &_container, forKey: .code, auxiliaryKey: ._code)
    try display?.encode(on: &_container, forKey: .display, auxiliaryKey: ._display)
    try userSelected?.encode(on: &_container, forKey: .userSelected, auxiliaryKey: ._userSelected)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - equatable & hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Coding else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return system == _other.system
      && version == _other.version
      && code == _other.code
      && display == _other.display
      && userSelected == _other.userSelected
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(system)
    hasher.combine(version)
    hasher.combine(code)
    hasher.combine(display)
    hasher.combine(userSelected)
  }
}
