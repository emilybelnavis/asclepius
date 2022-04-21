//
//  BackboneElement.swift
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
 Base definition for all elements that are defined inside a resource, but not those in a data type
 */
open class BackboneElement: Element {
  /// Extensions that cannot be ignored even if unrecognized
  public var modifierExtension: [Extension]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    modifierExtension: [Extension]? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.id = id
    self.modifierExtension = modifierExtension
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case modifierExtension
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.modifierExtension = try [Extension](from: _container, forKeyIfPresent: .modifierExtension)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try modifierExtension?.encode(on: &_container, forKey: .modifierExtension)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? BackboneElement else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return modifierExtension == _other.modifierExtension
  }
  
  public override func hash(into hasher: inout Hasher) {
    super .hash(into: &hasher)
    hasher.combine(modifierExtension)
  }
}