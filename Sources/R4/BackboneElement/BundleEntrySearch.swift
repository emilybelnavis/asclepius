//
//  BundleEntrySearch.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/// Information about the search process that lead to the creation of this entry
open class BundleEntrySearch: BackboneElement {
  /// Why yhis entry is in the result set - whether it is include as a mathc or because of an `_include`
  /// requrirement, or to convey information or warning infomation about the search process.
  public var mode: AlexandriaHRMPrimitive<SearchEntryMode>?
  
  /// Search ranking (between 0 and 1
  public var score: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    mode: AlexandriaHRMPrimitive<SearchEntryMode>? = nil,
    score: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.mode = mode
    self.score = score
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case mode; case _mode
    case score; case _score
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.mode = try AlexandriaHRMPrimitive<SearchEntryMode>(from: codingKeyContainer, forKeyIfPresent: .mode, auxKey: ._mode)
    self.score = try AlexandriaHRMPrimitive<AlexandriaHRMDecimal>(from: codingKeyContainer, forKeyIfPresent: .score, auxKey: ._score)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try mode?.encode(on: &codingKeyContainer, forKey: .mode, auxKey: ._mode)
    try score?.encode(on: &codingKeyContainer, forKey: .score, auxKey: ._score)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? BundleEntrySearch else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return mode == _other.mode
    && score == _other.score
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(mode)
    hasher.combine(score)
  }
}
