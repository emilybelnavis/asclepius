//
//  DocumentReferenceContent.swift
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
 The document and format referenced. There may be multiple content element repititions, each with a different
 format.
 */
open class DocumentReferenceContent: BackboneElement {
  /// Where to access the document
  public var attachment: Attachment
  
  /// Format/content rules for the document
  public var format: Coding?
  
  public init(attachment: Attachment) {
    self.attachment = attachment
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    attachment: Attachment,
    format: Coding?
  ) {
    self.init(attachment: attachment)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.format = format
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case attachment
    case format
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.attachment = try Attachment(from: codingKeyContainer, forKey: .attachment)
    self.format = try Coding(from: codingKeyContainer, forKeyIfPresent: .format)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try attachment.encode(on: &codingKeyContainer, forKey: .attachment)
    try format?.encode(on: &codingKeyContainer, forKey: .format)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DocumentReferenceContent else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return attachment == _other.attachment
    && format == _other.format
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(attachment)
    hasher.combine(format)
  }
}
