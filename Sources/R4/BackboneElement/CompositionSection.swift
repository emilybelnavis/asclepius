//
//  CompositionSection.swift
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

/// Composition is broken into sections - The root of the sections that make up the composition
open class CompositionSection: BackboneElement {
  /// Label for section (e.g. for ToC)
  public var title: FHIRKitPrimitive<FHIRKitString>?
  
  /// Classification of section
  public var code: CodableConcept?
  
  /// Who and/or what authored the section
  public var author: [Reference]?
  
  /// Who and/or what the section is about
  public var focus: Reference?
  
  /// Text summary of the section for human interpretation
  public var text: Narrative?
  
  /// How the entry list was prepared - wheter it is a working list that is suitable for being maintained
  /// on an ongoing basis or if it represents a snapshot of a list of items from another source, or
  /// whether it is a prepared list where items may be marked as added, modified, or deleted
  public var mode: FHIRKitPrimitive<ListMode>?
  
  /// Order of section entries
  public var orderedBy: CodableConcept?
  
  /// A reference to data that supports this section
  public var entry: [Reference]?
  
  /// Why the section is empty
  public var emptyReason: CodableConcept?
  
  /// Nested section
  public var section: [CompositionSection]?
}
