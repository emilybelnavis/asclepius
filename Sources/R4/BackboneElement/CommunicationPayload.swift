//
//  CommunicationPayload.swift
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
 Message payload - Text, attachment(s), or resource(s) that were communicated to the recipient
 */
open class CommunicationPayload: BackboneElement {
  /// all possible types for `content[x]`
  public enum ContentX: Hashable {
    case attachment(Attachment)
    case reference(Reference)
    case string(AlexandriaHRMPrimitive<AlexandriaHRMString>)
  }
  
  /// message part content
  public var content: ContentX
  
  public init(content: ContentX) {
    self.content = content
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    content: ContentX
  ) {
    self.init(content: content)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case contentAttachment
    case contentReference
    case contentString; case _contentString
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempContent: ContentX?
    if let contentAttachment = try Attachment(from: codingKeyContainer, forKeyIfPresent: .contentAttachment) {
      if tempContent != nil {
        throw DecodingError.dataCorruptedError(forKey: .contentAttachment, in: codingKeyContainer, debugDescription: "More than one value provided for \"content\"")
      }
      tempContent = .attachment(contentAttachment)
    }
    
    if let contentReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .contentReference) {
      if tempContent != nil {
        throw DecodingError.dataCorruptedError(forKey: .contentReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"content\"")
      }
      tempContent = .reference(contentReference)
    }
    
    if let contentString = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .contentString, auxKey: ._contentString) {
      if tempContent != nil {
        throw DecodingError.dataCorruptedError(forKey: .contentString, in: codingKeyContainer, debugDescription: "More than one value provided for \"content\"")
      }
      tempContent = .string(contentString)
    }
    
    self.content = tempContent!
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch content {
    case .attachment(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .contentAttachment)
    case .reference(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .contentReference)
    case .string(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .contentString, auxKey: ._contentString)
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CommunicationPayload else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return content == _other.content
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(content)
  }
}
