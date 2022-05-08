//
//  CompositionSection.swift
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

/// Composition is broken into sections - The root of the sections that make up the composition
open class CompositionSection: BackboneElement {
  /// Label for section (e.g. for ToC)
  public var title: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Classification of section
  public var code: CodeableConcept?
  
  /// Who and/or what authored the section
  public var author: [Reference]?
  
  /// Who and/or what the section is about
  public var focus: Reference?
  
  /// Text summary of the section for human interpretation
  public var text: Narrative?
  
  /// How the entry list was prepared - wheter it is a working list that is suitable for being maintained
  /// on an ongoing basis or if it represents a snapshot of a list of items from another source, or
  /// whether it is a prepared list where items may be marked as added, modified, or deleted
  public var mode: AlexandriaHRMPrimitive<ListMode>?
  
  /// Order of section entries
  public var orderedBy: CodeableConcept?
  
  /// A reference to data that supports this section
  public var entry: [Reference]?
  
  /// Why the section is empty
  public var emptyReason: CodeableConcept?
  
  /// Nested section
  public var section: [CompositionSection]?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    title: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    code: CodeableConcept? = nil,
    author: [Reference]? = nil,
    focus: Reference? = nil,
    text: Narrative? = nil,
    mode: AlexandriaHRMPrimitive<ListMode>? = nil,
    entry: [Reference]? = nil,
    emptyReason: CodeableConcept? = nil,
    section: [CompositionSection]? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.title = title
    self.code = code
    self.author = author
    self.focus = focus
    self.text = text
    self.mode = mode
    self.entry = entry
    self.emptyReason = emptyReason
    self.section = section
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case title; case _title
    case code
    case author
    case focus
    case text
    case mode; case _mode
    case entry
    case emptyReason
    case section
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.title = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .title, auxKey: ._title)
    self.code = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .code)
    self.author = try [Reference](from: codingKeyContainer, forKeyIfPresent: .author)
    self.focus = try Reference(from: codingKeyContainer, forKeyIfPresent: .focus)
    self.text = try Narrative(from: codingKeyContainer, forKeyIfPresent: .text)
    self.mode = try AlexandriaHRMPrimitive<ListMode>(from: codingKeyContainer, forKeyIfPresent: .mode, auxKey: ._mode)
    self.entry = try [Reference](from: codingKeyContainer, forKeyIfPresent: .entry)
    self.emptyReason = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .emptyReason)
    self.section = try [CompositionSection](from: codingKeyContainer, forKeyIfPresent: .section)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try title?.encode(on: &codingKeyContainer, forKey: .title, auxKey: ._title)
    try code?.encode(on: &codingKeyContainer, forKey: .code)
    try author?.encode(on: &codingKeyContainer, forKey: .author)
    try focus?.encode(on: &codingKeyContainer, forKey: .focus)
    try text?.encode(on: &codingKeyContainer, forKey: .text)
    try mode?.encode(on: &codingKeyContainer, forKey: .mode, auxKey: ._mode)
    try entry?.encode(on: &codingKeyContainer, forKey: .entry)
    try emptyReason?.encode(on: &codingKeyContainer, forKey: .emptyReason)
    try section?.encode(on: &codingKeyContainer, forKey: .section)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CompositionSection else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return title == _other.title
    && code == _other.code
    && author == _other.author
    && focus == _other.focus
    && text == _other.text
    && mode == _other.mode
    && entry == _other.entry
    && emptyReason == _other.emptyReason
    && section == _other.section
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(title)
    hasher.combine(code)
    hasher.combine(author)
    hasher.combine(focus)
    hasher.combine(text)
    hasher.combine(mode)
    hasher.combine(entry)
    hasher.combine(emptyReason)
    hasher.combine(section)
  }
}
