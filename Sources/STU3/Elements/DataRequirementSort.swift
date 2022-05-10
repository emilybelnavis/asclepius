//
//  DataRequirementSort.swift
//  Asclepius
//  Module: STU3
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import AsclepiusCore

/**
 Order of the results.
 
 Specifies the order of the results to be returned
 */
open class DataRequirementSort: Element {
  /// the name of the attribute to perform the sort
  public var path: AsclepiusPrimitive<AsclepiusString>
  
  /// the direction of the sort (ascending or descending
  public var direction: AsclepiusPrimitive<SortDirection>
  
  public init(path: AsclepiusPrimitive<AsclepiusString>, direction: AsclepiusPrimitive<SortDirection>) {
    self.path = path
    self.direction = direction
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    path: AsclepiusPrimitive<AsclepiusString>,
    direction: AsclepiusPrimitive<SortDirection>
  ) {
    self.init(path: path, direction: direction)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case path; case _path
    case direction; case _direction
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.path = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .path, auxKey: ._path)
    self.direction = try AsclepiusPrimitive<SortDirection>(from: codingKeyContainer, forKey: .direction, auxKey: ._direction)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try path.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    try direction.encode(on: &codingKeyContainer, forKey: .direction, auxKey: ._direction)
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DataRequirementSort else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return path == _other.path
    && direction == _other.direction
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(path)
    hasher.combine(direction)
  }
}
