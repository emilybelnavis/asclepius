//
//  ConceptMapGroupUnmapped.swift
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
 What to do when there is no mapping for the source concept. "Unmapped" does not include codes that are
 unmached, and the unmapped element is ignored in a code is specified to have equivalence = unmatched
 */
open class ConceptMapGroupUnmapped: BackboneElement {
  /**
   Defines which action to take if there is no match for the source concept in the target system designated
   for the group. One of three actions are possible: Use the unmapped code (this is useful when doing a
   mapping between version and only a few codes have changed), use a fixed code (a default code), or
   alternatively, a reference to a different concept map can be provided (by canonical URL)
   */
  public var mode: FHIRKitPrimitive<ConceptMapGroupUnmappedMode>
  
  /// Fixed code when mode = fixed
  public var code: FHIRKitPrimitive<FHIRKitString>?
  
  /// Display for the code
  public var display: FHIRKitPrimitive<FHIRKitString>?
  
  /// Canonical reference to an additional ConceptMap to use for mapping if the source concept is unmapped
  public var url: FHIRKitPrimitive<Canonical>?
  
  public init(mode: FHIRKitPrimitive<ConceptMapGroupUnmappedMode>) {
    self.mode = mode
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    mode: FHIRKitPrimitive<ConceptMapGroupUnmappedMode>,
    code: FHIRKitPrimitive<FHIRKitString>? = nil,
    display: FHIRKitPrimitive<FHIRKitString>? = nil,
    url: FHIRKitPrimitive<Canonical>? = nil
  ) {
    self.init(mode: mode)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.code = code
    self.display = display
    self.url = url
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case mode; case _mode
    case code; case _code
    case display; case _display
    case url; case _url
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.mode = try FHIRKitPrimitive<ConceptMapGroupUnmappedMode>(from: codingKeyContainer, forKey: .mode, auxKey: ._mode)
    self.code = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .code, auxKey: ._code)
    self.display = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .display, auxKey: ._display)
    self.url = try FHIRKitPrimitive<Canonical>(from: codingKeyContainer, forKeyIfPresent: .url, auxKey: ._url)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try mode.encode(on: &codingKeyContainer, forKey: .mode, auxKey: ._mode)
    try code?.encode(on: &codingKeyContainer, forKey: .code, auxKey: ._code)
    try display?.encode(on: &codingKeyContainer, forKey: .display, auxKey: ._display)
    try url?.encode(on: &codingKeyContainer, forKey: .url, auxKey: ._url)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConceptMapGroupUnmapped else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return mode == _other.mode
    && code == _other.code
    && display == _other.display
    && url == _other.url
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(mode)
    hasher.combine(code)
    hasher.combine(display)
    hasher.combine(url)
  }
}

