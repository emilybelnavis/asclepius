//
//  AuditEventSource.swift
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

/// The system that is reporting the event
open class AuditEventSource: BackboneElement {
  /// Logical source location within the enterprise
  public var site: FHIRKitPrimitive<FHIRKitString>?
  
  /// The identity of the source detecting the event
  public var observer: Reference
  
  /// The type of source where the event originated from
  public var type: [Coding]?
  
  public init(observer: Reference) {
    self.observer = observer
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    site: FHIRKitPrimitive<FHIRKitString>? = nil,
    observer: Reference,
    type: [Coding]? = nil
  ) {
    self.init(observer: observer)
    self.fhirExtension = fhirExtension
    self.id = id
    self.site = site
    self.observer = observer
    self.type = type
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case site; case _site
    case observer
    case type
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.site = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .site, auxKey: ._site)
    self.observer = try Reference(from: codingKeyContainer, forKey: .observer)
    self.type = try [Coding](from: codingKeyContainer, forKeyIfPresent: .type)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try site?.encode(on: &codingKeyContainer, forKey: .site, auxKey: ._site)
    try observer.encode(on: &codingKeyContainer, forKey: .observer)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AuditEventSource else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return site == _other.site
    && observer == _other.observer
    && type == _other.type
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(site)
    hasher.combine(observer)
    hasher.combine(type)
  }
}
