//
//  BundleEntryResponse.swift
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
 Indicates the results of processing the corresponding `request` entry in the batch or transaction being
 responded to, or what the results of an operation are when returning history
 */
open class BundleEntryResponse: BackboneElement {
  /// Status response code (text is optional)
  public var status: AsclepiusPrimitive<AsclepiusString>
  
  /// The locaation (if the operation returns a location)
  public var location: AsclepiusPrimitive<AsclepiusURI>?
  
  /// The eTag for the resource (if relevant)
  public var etag: AsclepiusPrimitive<AsclepiusString>?
  
  /// Server's date/time modified
  public var lastModified: AsclepiusPrimitive<AsclepiusInstant>?
  
  /// Operation outcome with hints/warnings for batch/transaction
  public var outcome: ResourceProxy?
  
  public init(status: AsclepiusPrimitive<AsclepiusString>) {
    self.status = status
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    status: AsclepiusPrimitive<AsclepiusString>,
    location: AsclepiusPrimitive<AsclepiusURI>? = nil,
    etag: AsclepiusPrimitive<AsclepiusString>? = nil,
    lastModified: AsclepiusPrimitive<AsclepiusInstant>? = nil,
    outcome: ResourceProxy? = nil
  ) {
    self.init(status: status)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.status = status
    self.location = location
    self.etag = etag
    self.lastModified = lastModified
    self.outcome = outcome
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case status; case _status
    case location; case _location
    case etag; case _etag
    case lastModified; case _lastModified
    case outcome
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.status = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .status, auxKey: ._status)
    self.location = try AsclepiusPrimitive<AsclepiusURI>(from: codingKeyContainer, forKeyIfPresent: .location, auxKey: ._location)
    self.etag = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .etag, auxKey: ._etag)
    self.lastModified = try AsclepiusPrimitive<AsclepiusInstant>(from: codingKeyContainer, forKeyIfPresent: .lastModified, auxKey: ._lastModified)
    self.outcome = try ResourceProxy(from: codingKeyContainer, forKeyIfPresent: .outcome)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    try status.encode(on: &codingKeyContainer, forKey: .status, auxKey: ._status)
    try location?.encode(on: &codingKeyContainer, forKey: .location, auxKey: ._location)
    try etag?.encode(on: &codingKeyContainer, forKey: .etag, auxKey: ._etag)
    try lastModified?.encode(on: &codingKeyContainer, forKey: .lastModified, auxKey: ._lastModified)
    try outcome?.encode(on: &codingKeyContainer, forKey: .outcome)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? BundleEntryResponse else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return status == _other.status
    && location == _other.location
    && etag == _other.etag
    && lastModified == _other.lastModified
    && outcome == _other.outcome
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(status)
    hasher.combine(location)
    hasher.combine(etag)
    hasher.combine(lastModified)
    hasher.combine(outcome)
  }
}
