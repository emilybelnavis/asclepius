//
//  ConsentVerification.swift
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
 Whether a treatment instruction was verified with the patient, their family, or another authorized person
 */
open class ConsentVerification: BackboneElement {
  /// Has been verified
  public var verified: AlexandriaHRMPrimitive<AlexandriaHRMBool>
  
  /// Person who verified
  public var verifiedWith: Reference?
  
  /// When consent verified
  public var verificationDate: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>?
  
  public init(verified: AlexandriaHRMPrimitive<AlexandriaHRMBool>) {
    self.verified = verified
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    verified: AlexandriaHRMPrimitive<AlexandriaHRMBool>,
    verifiedWith: Reference? = nil,
    verificationDate: AlexandriaHRMPrimitive<AlexandriaHRMDateTime>? = nil
  ) {
    self.init(verified: verified)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.verifiedWith = verifiedWith
    self.verificationDate = verificationDate
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case verified; case _verified
    case verifiedWith
    case verificationDate; case _verificationDate
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.verified = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKey: .verified, auxKey: ._verified)
    self.verifiedWith = try Reference(from: codingKeyContainer, forKeyIfPresent: .verifiedwith)
    self.verificationDate = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKey: .verificationDate, auxKey: ._verificationDate)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try verified.encode(on: &codingKeyContainer, forKey: .verified, auxKey: ._verified)
    try verifiedWith?.encode(on: &codingKeyContaineer, forKey: .verifiedWith)
    try verificationDate?.encode(on: &codingKeyContainer, forKey: .verificationDate, auxKey: ._verificationDate)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ConsentVerification else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return verified == _other.verified
    && verifiedWith == _other.verifiedWith
    && verificationDate == _other.verificationDate
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(verified)
    hasher.combine(verifiedWith)
    hasher.combine(verificationDate)
  }
}
