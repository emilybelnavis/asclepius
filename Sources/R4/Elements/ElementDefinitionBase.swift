//
//  ElementDefinitionBase.swift
//  Asclepius
//  Module: R4
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
 Base definition information for tools; Information about the base definition of the element, provided to make it
 unnecessary for tools to trace the deviation of the element through the derived and related profiles. When the
 element definition is not the original definitoin of an element (e.g. either in a constraint on another type, or for
 elements from a super type in a snapshot) then the information provided in the element definition may be
 different to the vase definition. On the original definition of the element, it will be the same
 */
open class ElementDefinitionBase: Element {
  /// Path that identifies the base element
  public var path: AsclepiusPrimitive<AsclepiusString>
  
  /// Min cardinality of the base element
  public var min: AsclepiusPrimitive<AsclepiusUnsignedInteger>
  
  /// Max cardinality of the base element
  public var max: AsclepiusPrimitive<AsclepiusString>
  
  public init(path: AsclepiusPrimitive<AsclepiusString>, min: AsclepiusPrimitive<AsclepiusUnsignedInteger>, max: AsclepiusPrimitive<AsclepiusString>) {
    self.path = path
    self.min = min
    self.max = max
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    path: AsclepiusPrimitive<AsclepiusString>,
    min: AsclepiusPrimitive<AsclepiusUnsignedInteger>,
    max: AsclepiusPrimitive<AsclepiusString>
  ) {
    self.init(path: path, min: min, max: max)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case path; case _path
    case min; case _min
    case max; case _max
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.path = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .path, auxKey: ._path)
    self.min = try AsclepiusPrimitive<AsclepiusUnsignedInteger>(from: codingKeyContainer, forKey: .min, auxKey: ._min)
    self.max = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .max, auxKey: ._max)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try path.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    try min.encode(on: &codingKeyContainer, forKey: .min, auxKey: ._min)
    try max.encode(on: &codingKeyContainer, forKey: .max, auxKey: ._max)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ElementDefinitionBase else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return path == _other.path
    && min == _other.min
    && max == _other.max
  }
}
