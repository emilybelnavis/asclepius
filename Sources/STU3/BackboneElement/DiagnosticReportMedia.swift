//
//  DiagnosticReportMedia.swift
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
 Key images associated with this report; A list of key images associated with this report. The images are generally
 created during the diagnostic process, and may be directly of the patient, or of treated specimens (i.e. slides
 of interest)
 */
open class DiagnosticReportMedia: BackboneElement {
  /// Comment about the image (e.g. explanation)
  public var comment: AsclepiusPrimitive<AsclepiusString>?
  
  /// Reference to the image source
  public var link: Reference
  
  public init(link: Reference) {
    self.link = link
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    comment: AsclepiusPrimitive<AsclepiusString>? = nil,
    link: Reference
  ) {
    self.init(link: link)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.comment = comment
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case comment; case _comment
    case link
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.comment = try AsclepiusPrimitive<AsclepiusString>(from: codingKeyContainer, forKeyIfPresent: .comment, auxKey: ._comment)
    self.link = try Reference(from: codingKeyContainer, forKey: .link)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try comment?.encode(on: &codingKeyContainer, forKey: .comment, auxKey: ._comment)
    try link.encode(on: &codingKeyContainer, forKey: .link)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DiagnosticReportMedia else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return comment == _other.comment
    && link == _other.link
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(comment)
    hasher.combine(link)
  }
}
