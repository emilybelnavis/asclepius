//
//  HumanName.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore

/// A human name with the ability to identify parts and usage
open class HumanName: Element {
  /// identifies the purpose for this name
  public var use: AlexandriaHRMPrimitive<NameUse>?
  
  /// text representation of the full name
  public var text: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// family name (often called 'surname' or 'last name'
  public var family: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// given names (not always first), includes middle names
  public var given: [AlexandriaHRMPrimitive<AlexandriaHRMString>]?
  
  /// parts that come before the name
  public var prefix: [AlexandriaHRMPrimitive<AlexandriaHRMString>]?
  
  /// parts that come after the name
  public var suffix: [AlexandriaHRMPrimitive<AlexandriaHRMString>]?
  
  /// time period when name was/is in use
  public var period: Period?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    use: AlexandriaHRMPrimitive<NameUse>? = nil,
    text: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    family: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    given: [AlexandriaHRMPrimitive<AlexandriaHRMString>]? = nil,
    prefix: [AlexandriaHRMPrimitive<AlexandriaHRMString>]? = nil,
    suffix: [AlexandriaHRMPrimitive<AlexandriaHRMString>]? = nil,
    period: Period? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.use = use
    self.text = text
    self.family = family
    self.given = given
    self.prefix = prefix
    self.suffix = suffix
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case use; case _use
    case text; case _text
    case family; case _family
    case given; case _given
    case prefix; case _prefix
    case suffix; case _suffix
    case period
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.use = try AlexandriaHRMPrimitive<NameUse>(from: codingKeyContainer, forKeyIfPresent: .use, auxKey: ._use)
    self.text = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .text, auxKey: ._text)
    self.family = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .family, auxKey: ._family)
    self.given = try [AlexandriaHRMPrimitive<AlexandriaHRMString>](from: codingKeyContainer, forKeyIfPresent: .given, auxKey: ._given)
    self.prefix = try [AlexandriaHRMPrimitive<AlexandriaHRMString>](from: codingKeyContainer, forKeyIfPresent: .prefix, auxKey: ._prefix)
    self.suffix = try [AlexandriaHRMPrimitive<AlexandriaHRMString>](from: codingKeyContainer, forKeyIfPresent: .suffix, auxKey: ._suffix)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try use?.encode(on: &codingKeyContainer, forKey: .use, auxKey: ._use)
    try text?.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    try family?.encode(on: &codingKeyContainer, forKey: .family, auxKey: ._family)
    try given?.encode(on: &codingKeyContainer, forKey: .given, auxKey: .given)
    try prefix?.encode(on: &codingKeyContainer, forKey: .prefix, auxKey: ._prefix)
    try suffix?.encode(on: &codingKeyContainer, forKey: .suffix, auxKey: ._suffix)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? HumanName else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return use == _other.use
    && text == _other.text
    && family == _other.family
    && given == _other.given
    && prefix == _other.prefix
    && suffix == _other.suffix
    && period == _other.period
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(use)
    hasher.combine(text)
    hasher.combine(given)
    hasher.combine(prefix)
    hasher.combine(suffix)
    hasher.combine(period)
  }
}