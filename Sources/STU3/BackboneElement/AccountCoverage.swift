//
//  AccountCoverage.swift
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
 The party(s) that are responsible for covering the payment of this account and what order they should be
 applied to the account
 */
open class AccountCoverage: BackboneElement {
  /// The party(s), such as insurance providers, that may contribute to the payment of this account
  public var coverage: Reference
  
  /// The priority of coverage in the context of this account
  public var priority: AsclepiusPrimitive<AsclepiusPositiveInteger>?
  
  public init(coverage: Reference) {
    self.coverage = coverage
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    coverage: Reference,
    priority: AsclepiusPrimitive<AsclepiusPositiveInteger>? = nil
  ) {
    self.init(coverage: coverage)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.priority = priority
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case coverage
    case priority; case _priority
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.coverage = try Reference(from: codingKeyContainer, forKey: .coverage)
    self.priority = try AsclepiusPrimitive<AsclepiusPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: .priority, auxKey: ._priority)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try coverage.encode(on: &codingKeyContainer, forKey: .coverage)
    try priority?.encode(on: &codingKeyContainer, forKey: .priority, auxKey: ._priority)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AccountCoverage else {
      return false
    }
    
    guard _other.isEqual(to: _other) else {
      return false
    }
    
    return coverage == _other.coverage
    && priority == _other.priority
  }
  
  override public func hash(into hasher: inout Hasher) {
    super .hash(into: &hasher)
    hasher.combine(coverage)
    hasher.combine(priority)
  }
}
