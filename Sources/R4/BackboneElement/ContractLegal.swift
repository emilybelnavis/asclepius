//
//  ContractLegal.swift
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

/// Contract Legal Language - List of legal expressions or representations of this `Contract`
open class ContractLegal: BackboneElement {
  public enum ContentX: Hashable {
    case attachment(Attachment)
    case reference(Reference)
  }
  
  public var content: ContentX
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    content: ContentX
  ) {
    self.init(content: content)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case contentAttachment
    case contentReference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tContent: ContentX?
    if let contentAttachment = try Attachment(from: codingKeyContainer, forKeyIfPresent: .contentAttachment) {
      if tContent != nil {
        throw DecodingError.dataCorruptedError(forKey: .contentAttachment, in: codingKeyContainer, debugDescription: "More than one value provided for \"content\"")
      }
      tContent = .attachment(contentAttachment)
    }
    
    if let contentReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .contentReference) {
      if tContent != nil {
        throw DecodingError.dataCorruptedError(forKey: .contentReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"content\"")
      }
      tContent = .reference(contentReference)
    }
    
    self.content = tContent!
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch content {
    case .attachment(let attachment):
      try attachment.encode(on: &codingKeyContainer, forKey: .contentAttachment)
    case .reference(let reference):
      try reference.encode(on: &codingKeyContainer, forKey: .contentReference)
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractLegal else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return content == _other.content
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(content)
  }
}
