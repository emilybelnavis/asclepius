//
//  FHIRDefinedConceptProperties.swift
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
 A set of common concept properties for use on coded systems throughout the FHIR eco-system.
 
 URL: http://hl7.org/fhir/concept-properties
 ValueSet: http://hl7.org/fhir/ValueSet/concept-properties
 */
public enum FHIRDefinedConceptProperties: String, FHIRKitPrimitiveType {
  /// True if the concept is not considered active - e.g. not a valid concept any more. Property type is boolean,
  /// default value is false
  case inactive
  
  /// The date at which a concept was deprecated. Concepts that are deprecated but not inactive can still be used, but
  /// their use is discouraged, and they should be expected to be made inactive in a future release. Property type is
  /// dateTime
  case deprecated
  
  /// The concept is not intended to be chosen by the user - only intended to be used as a selector for other
  /// concepts. Note, though, that the interpretation of this is highly contextual; all concepts are selectable in
  /// some context. Property type is boolean
  case notSelectable
  
  /// The concept identified in this property is a parent of the concept on which it is a property. The property type
  /// will be 'code'. The meaning of 'parent' is defined by the hierarchyMeaning attribute
  case parent
  
  /// The concept identified in this property is a child of the concept on which it is a property. The property type
  /// will be 'code'. The meaning of 'child' is defined by the hierarchyMeaning attribute
  case child
}
