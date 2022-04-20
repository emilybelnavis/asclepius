//
//  KnowledgeResourceTypes.swift
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
 A list of all the knowledge resource types defined in this version of the FHIR specification.
 
 URL: http://hl7.org/fhir/knowledge-resource-types
 ValueSet: http://hl7.org/fhir/ValueSet/knowledge-resource-types
 */
public enum KnowledgeResourceType: String, FHIRKitPrimitiveType {
  /// The definition of a specific activity to be taken, independent of any particular patient or context.
  case activityDefinition = "ActivityDefinition"
  
  /// A set of codes drawn from one or more code systems.
  case codeSystem = "CodeSystem"
  
  /// A map from one set of concepts to one or more other concepts.
  case conceptMap = "ConceptMap"
  
  /// Represents a library of quality improvement components.
  case library = "Library"
  
  /// A quality measure definition.
  case measure = "Measure"
  
  /// The definition of a plan for a series of actions, independent of any specific patient or context.
  case planDefinition = "PlanDefinition"
  
  /// Structural Definition.
  case structureDefinition = "StructureDefinition"
  
  /// A Map of relationships between 2 structures that can be used to transform data.
  case structureMap = "StructureMap"
  
  /// A set of codes drawn from one or more code systems.
  case valueSet = "ValueSet"
}
