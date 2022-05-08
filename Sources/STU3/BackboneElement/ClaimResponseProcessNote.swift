//
//  ClaimResponseProcessNote.swift
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

/**
 Note concerning adjudication; A note that describes or explains adjudication results in a human-readable form
 */
open class ClaimResponseProcessNote: BackboneElement {
  /// Note instance identifier
  public var number: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>?
  
  /// The business purpose of the note text
  public var type: AlexandriaHRMPrimitive<NoteType>?
  
  /// Note explanatory text
  public var text: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// Language of the text
  public var language: CodeableConcept?
  
  public init(text: AlexandriaHRMPrimitive<AlexandriaHRMString>) {
    self.text = text
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    number: AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>? = nil,
    type: AlexandriaHRMPrimitive<NoteType>? = nil,
    text: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    language: CodeableConcept? = nil
  ) {
    self.init(text: text)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.number = number
    self.type = type
    self.language = language
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case number; case _number
    case type; case _type
    case text; case _text
    case language
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.number = try AlexandriaHRMPrimitive<AlexandriaHRMPositiveInteger>(from: codingKeyContainer, forKey: .number, auxKey: ._number)
    self.type = try AlexandriaHRMPrimitive<NoteType>(from: codingKeyContainer, forKeyIfPresent: .type, auxKey: ._type)
    self.text = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .text, auxKey: ._text)
    self.language = try CodeableConcept(from: codingKeyContainer, forKey: .language)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try number?.encode(on: &codingKeyContainer, forKey: .number, auxKey: ._number)
    try type?.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try text.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    try language?.encode(on: &codingKeyContainer, forKey: .language)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimResponseProcessNote else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return number == _other.number
    && type == _other.type
    && text == _other.text
    && language == _other.language
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(number)
    hasher.combine(type)
    hasher.combine(text)
    hasher.combine(language)
  }
}
