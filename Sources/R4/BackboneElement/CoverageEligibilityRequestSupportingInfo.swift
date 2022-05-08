//
//  CoverageEligibilityRequestSupportingInfo.swift
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

/**
 Supporting information; Additional information codes regarding exceptions, special considerations, the condition,
 situation, prior, or concurrent issues.
 */
open class CoverageEligibilityRequestSupportingInfo: BackboneElement {
  /// Information instance identifier
  public var sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>
  
  /// Data to be provided
  public var information: Reference
  
  /// Applies to all items
  public var appliesToAll: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  public init(sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>, information: Reference) {
    self.sequence = sequence
    self.information = information
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    sequence: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>,
    information: Reference,
    appliesToAll: AlexandriaHRMPrimitive<AlexandriaHRMBool>? = nil
  ) {
    self.init(sequence: sequence, information: information)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.appliesToAll = appliesToAll
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case sequence; case _sequence
    case information
    case appliesToAll; case _appliesToAll
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.sequence = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    self.information = try Reference(from: codingKeyContainer, forKey: .information)
    self.appliesToAll = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .appliesToAll, auxKey: ._appliesToAll)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
  
    try sequence.encode(on: &codingKeyContainer, forKey: .sequence, auxKey: ._sequence)
    try information.encode(on: &codingKeyContainer, forKey: .information)
    try appliesToAll?.encode(on: &codingKeyContainer, forKey: .appliesToAll, auxKey: ._appliesToAll)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageEligibilityRequestSupportingInfo else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return sequence == _other.sequence
    && information == _other.information
    && appliesToAll == _other.appliesToAll
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(sequence)
    hasher.combine(information)
    hasher.combine(appliesToAll)
  }
}
