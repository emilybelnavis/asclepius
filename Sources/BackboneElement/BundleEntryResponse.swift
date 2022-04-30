//
//  BundleEntryResponse.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

/**
 Indicates the results of processing the corresponding `request` entry in the batch or transaction being
 responded to, or what the results of an operation are when returning history
 */
open class BundleEntryResponse: BackboneElement {
  /// Status response code (text is optional)
  public var status: FHIRKitPrimitive<FHIRKitString>
  
  /// The locaation (if the operation returns a location)
  public var location: FHIRKitPrimitive<FHIRKitURI>?
  
  /// The eTag for the resource (if relevant)
  public var etag: FHIRKitPrimitive<FHIRKitString>?
  
  /// Server's date/time modified
  public var lastModified: FHIRKitPrimitive<FHIRKitInstant>?
  
  /// Operation outcome with hints/warnings for batch/transaction
  public var outcome: ResourceProxy?
  
  public init(status: FHIRKitPrimitive<FHIRKitString>) {
    self.status = status
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    status: FHIRKitPrimitive<FHIRKitString>,
    location: FHIRKitPrimitive<FHIRKitURI>? = nil,
    etag: FHIRKitPrimitive<FHIRKitString>? = nil,
    lastModified: FHIRKitPrimitive<FHIRKitInstant>? = nil,
    outcome: ResourceProxy? = nil
  ) {
    self.init(status: status)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    
    self.status = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKey: .status, auxKey: ._status)
    self.location = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .location, auxKey: ._location)
    self.etag = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .etag, auxKey: ._etag)
    self.lastModified = try FHIRKitPrimitive<FHIRKitInstant>(from: codingKeyContainer, forKeyIfPresent: .lastModified, auxKey: ._lastModified)
    self.outcome = try ResourceProxy(from: codingKeyContainer, forKeyIfPresent: .outcome)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    try status.encode(on: &codingKeyContainer, forKey: .status, auxKey: ._status)
    try location?.encode(on: &codingKeyContainer, forKey: .location, auxKey: ._location)
    try etag?.encode(on: &codingKeyContainer, forKey: .etag, auxKey: ._etag)
    try lastModified?.encode(on: &codingKeyContainer, forKey: .lastModified, auxKey: ._lastModified)
    try outcome?.encode(on: &codingKeyContainer, forKey: .outcome)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(status)
    hasher.combine(location)
    hasher.combine(etag)
    hasher.combine(lastModified)
    hasher.combine(outcome)
  }
}
