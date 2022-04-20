//
//  DefinitionResourceType.swift
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
 A list of all the definition resource types defined in this version of the FHIR specification.
 
 URL: http://hl7.org/fhir/definition-resource-types
 ValueSet: http://hl7.org/fhir/ValueSet/definition-resource-types
 */
public enum DefinitionResourceType: String, FHIRKitPrimitiveType {
  /// This resource allows for the definition of some activity to be performed, independent of a particular patient,
  /// practitioner, or other performance context.
  case activityDefinition = "ActivityDefinition"
  
  /// The EventDefinition resource provides a reusable description of when a particular event can occur.
  case eventDefinition = "EventDefinition"
  
  /// The Measure resource provides the definition of a quality measure.
  case measure = "Measure"
  
  /// A formal computable definition of an operation (on the RESTful interface) or a named query (using the search
  /// interaction).
  case operationDefinition = "OperationDefinition"
  
  /// This resource allows for the definition of various types of plans as a sharable, consumable, and executable
  /// artifact. The resource is general enough to support the description of a broad range of clinical artifacts such
  /// as clinical decision support rules, order sets and protocols.
  case planDefinition = "PlanDefinition"
  
  /// A structured set of questions intended to guide the collection of answers from end-users. Questionnaires provide
  /// detailed control over order, presentation, phraseology and grouping to allow coherent, consistent data
  /// collection.
  case questionnaire = "Questionnaire"
}

