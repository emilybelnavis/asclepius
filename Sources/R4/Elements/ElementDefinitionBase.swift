//
//  ElementDefinitionBase.swift
//  FHIRKit
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

import FHIRKitCore

/**
 Base definition information for tools; Information about the base definition of the element, provided to make it
 unnecessary for tools to trace the deviation of the element through the derived and related profiles. When the
 element definition is not the original definitoin of an element (e.g. either in a constraint on another type, or for
 elements from a super type in a snapshot) then the information provided in the element definition may be
 different to the vase definition. On the original definition of the element, it will be the same
 */
open class ElementDefinitionBase: Element {
  /// Path that identifies the base element
  public var path: FHIRKitPrimitive<FHIRKitString>
  
  /// Min cardinality of the base element
  public var min: FHIRKitPrimitive<FHIRKitUnsignedInteger>
  
  /// Max cardinality of the base element
  public var max: FHIRKitPrimitive<FHIRKitString>
  
  public init(path: FHIRKitPrimitive<FHIRKitString>, min: FHIRKitPrimitive<FHIRKitUnsignedInteger>, max: FHIRKitPrimitive<FHIRKitString>) {
    self.path = path
    self.min = min
    self.max = max
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    path: FHIRKitPrimitive<FHIRKitString>,
    min: FHIRKitPrimitive<FHIRKitUnsignedInteger>,
    max: FHIRKitPrimitive<FHIRKitString>
  ) {
    self.init(path: path, min: min, max: max)
    self.fhirExtension = fhirExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case path; case _path
    case min; case _min
    case max; case _max
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.path = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .path, auxKey: ._path)
    self.min = try FHIRKitPrimitive<FHIRKitUnsignedInteger>(from: codingKeyContainer, forKey: .min, auxKey: ._min)
    self.max = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .max, auxKey: ._max)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try path.encode(on: &codingKeyContainer, forKey: .path, auxKey: ._path)
    try min.encode(on: &codingKeyContainer, forKey: .min, auxKey: ._min)
    try max.encode(on: &codingKeyContainer, forKey: .max, auxKey: ._max)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
