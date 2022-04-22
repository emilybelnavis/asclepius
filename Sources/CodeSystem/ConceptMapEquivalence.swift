//
//  ConceptMapEquivalence.swift
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
 The degree of equivalence between concepts.
 
 URL: http://hl7.org/fhir/concept-map-equivalence
 ValueSet: http://hl7.org/fhir/ValueSet/concept-map-equivalence
 */
public enum ConceptMapEquivalence: String, FHIRKitPrimitiveType {
  /// The concepts are related to eachother and have at least some overlap in meaning but the exact
  /// relationship is not known
  case relatedto
  
  /// The definitions of the concepts mean the smae thing (including when structural implications of
  /// meaning are considered) (i.e. extensionally identical)
  case equivalent
  
  /// The definitions of the concepts are exactly the same (e.g. only grammatical differences) and structural
  /// implications of meaning are identical or irrelevant (i.e. intentionally identical)
  case equal
  
  /// The target mapping is wider in meaning than the source concept
  case wider
  
  /// The target mapping subsumes the meaning of the source concept (e.g. the source `is-a` target).
  case subsumes
  
  /// The target mapping is narrower in meaning than the source concept. The sens in which the mapping
  /// is narrower SHALL be described in the comments in this case and applications should be careful
  /// when attempting to use these mappings operationally
  case narrower
  
  /// The target mapping specializes the meaning of the source concept (e.g. the target `is-a` source)
  case specializes
  
  /// The target mapping overlaps with the source concept but both source and target cover additional
  /// meaning or the definitions are imprecise and it is uncertain whether they have the same boundaries to
  /// their meaning. The sense in which the mapping is inexact SHALL be described in the comments in this
  /// case and applications should be careful when attempting to use this mappings operationally,
  case inexact
  
  /// There is no match for this concept in the target code system
  case unmatched
  
  /// This is an explict assertion that there is no mapping between the source and target concept.
  case disjoint
}
