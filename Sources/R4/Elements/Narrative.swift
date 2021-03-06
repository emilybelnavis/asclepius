//
//  Narrative.swift
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
 A human-readable summary of the resouce conveying the essential clinical and business information for the
 resource.
 */
open class Narrative: Element {
  /// The status of the narrative - whether it's entirely generated, or wheter a human authored it and it may
  /// contain additional data.
  public var status: AsclepiusPrimitive<NarrativeStatus>
  
  /// Limited XHTML content
  public var div: AsclepiusPrimitive<AsclepiusString>
  
  public init(status: AsclepiusPrimitive<NarrativeStatus>, div: AsclepiusPrimitive<AsclepiusString>) {
    self.status = status
    self.div = div
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    status: AsclepiusPrimitive<NarrativeStatus>,
    div: AsclepiusPrimitive<AsclepiusString>
  ) {
    self.init(status: status, div: div)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case status; case _status
    case div; case _div
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.status = try AsclepiusPrimitive<NarrativeStatus>(from: codingKeyContainer, forKey: .status, auxKey: ._status)
    self.div = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKey: .div, auxKey: ._div)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try status.encode(on: &codingKeyContainer, forKey: .status, auxKey: ._status)
    try div.encode(on: &codingKeyContainer, forKey: .div, auxKey: ._div)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Narrative else {
      return false
    }

    guard super.isEqual(to: _other) else {
      return false
    }
    
    return status == _other.status
    && div == _other.div
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(status)
    hasher.combine(div)
  }
}
