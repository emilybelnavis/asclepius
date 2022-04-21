//
//  DataRequirementSort.swift
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
 Order of the results.
 
 Specifies the order of the results to be returned
 */
open class DataRequirementSort: Element {
  /// the name of the attribute to perform the sort
  public var path: FHIRKitPrimitive<FHIRKitString>
  
  /// the direction of the sort (ascending or descending
  public var direction: FHIRKitPrimitive<SortDirection>
  
  public init(path: FHIRKitPrimitive<FHIRKitString>, direction: FHIRKitPrimitive<SortDirection>) {
    self.path = path
    self.direction = direction
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    path: FHIRKitPrimitive<FHIRKitString>,
    direction: FHIRKitPrimitive<SortDirection>
  ) {
    self.init(path: path, direction: direction)
    self.`extension` = `extension`
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case path; case _path
    case direction; case _direction
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.path = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKey: .path, auxiliaryKey: ._path)
    self.direction = try FHIRKitPrimitive<SortDirection>(from: _container, forKey: .direction, auxiliaryKey: ._direction)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try path.encode(on: &_container, forKey: .path, auxiliaryKey: ._path)
    try direction.encode(on: &_container, forKey: .direction, auxiliaryKey: ._direction)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DataRequirementSort else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return path == _other.path
    && direction == _other.direction
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(path)
    hasher.combine(direction)
  }
}