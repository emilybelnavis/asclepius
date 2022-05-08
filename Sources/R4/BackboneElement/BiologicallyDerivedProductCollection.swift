//
//  BiologicallyDerivedProductCollection.swift
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

open class BiologicallyDerivedProductCollection: BackboneElement {
  public enum CollectedX: Hashable {
    case dateTime(AlexandriaHRMPrimitive<AlexandriaHRMDateTime>)
    case period(Period)
  }
  
  /// individual performing the collection
  public var collector: Reference?
  
  /// who/where the product is from
  public var source: Reference?
  
  /// time the product was collected
  public var collectedX: CollectedX?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    collector: Reference? = nil,
    source: Reference? = nil,
    collectedX: CollectedX? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.collector = collector
    self.source = source
    self.collectedX = collectedX
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case collector
    case source
    case collectedXDateTime; case _collectedXDateTime
    case collectedXPeriod
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempCollectedX: CollectedX?
    if let collectedDateTime = try AlexandriaHRMPrimitive<AlexandriaHRMDateTime>(from: codingKeyContainer, forKeyIfPresent: .collectedXDateTime, auxKey: ._collectedXDateTime) {
      if tempCollectedX != nil {
        throw DecodingError.dataCorruptedError(forKey: .collectedXDateTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempCollectedX = .dateTime(collectedDateTime)
    }
    
    if let collectedPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .collectedXPeriod) {
      if tempCollectedX != nil {
        throw DecodingError.dataCorruptedError(forKey: .collectedXPeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempCollectedX = .period(collectedPeriod)
    }
    
    self.collector = try Reference(from: codingKeyContainer, forKeyIfPresent: .collector)
    self.source = try Reference(from: codingKeyContainer, forKeyIfPresent: .source)
    self.collectedX = tempCollectedX
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    try collector?.encode(on: &codingKeyContainer, forKey: .collector)
    try source?.encode(on: &codingKeyContainer, forKey: .source)
    
    if let enumCollectedX = collectedX {
      switch enumCollectedX {
      case .dateTime(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .collectedXDateTime, auxKey: ._collectedXDateTime)
      case .period(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .collectedXPeriod)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? BiologicallyDerivedProductCollection else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return collector == _other.collector
    && source == _other.source
    && collectedX == _other.collectedX
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(collector)
    hasher.combine(source)
    hasher.combine(collectedX)
  }
}
