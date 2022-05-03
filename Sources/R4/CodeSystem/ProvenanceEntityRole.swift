//
//  ProvenanceEntityRole.swift
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
 How an entity was used in an activity.
 
 URL: http://hl7.org/fhir/provenance-entity-role
 ValueSet: http://hl7.org/fhir/ValueSet/provenance-entity-role
 */
public enum ProvenanceEntityRole: String, FHIRKitPrimitiveType {
  
  /// A transformation of an entity into another, an update of an entity resulting in a new one, or the construction
  /// of a new entity based on a pre-existing entity.
  case derivation
  
  /// A derivation for which the resulting entity is a revised version of some original.
  case revision
  
  /// The repeat of (some or all of) an entity, such as text or image, by someone who might or might not be its
  /// original author.
  case quotation
  
  /// A primary source for a topic refers to something produced by some agent with direct experience and knowledge
  /// about the topic, at the time of the topic's study, without benefit from hindsight.
  case source
  
  /// A derivation for which the entity is removed from accessibility usually through the use of the Delete operation.
  case removal
}
