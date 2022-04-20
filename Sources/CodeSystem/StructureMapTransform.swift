//
//  StructureMapTransform.swift
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
 How data is copied/created.
 
 URL: http://hl7.org/fhir/map-transform
 ValueSet: http://hl7.org/fhir/ValueSet/map-transform
 */
public enum StructureMapTransform: String, FHIRKitPrimitiveType {
  /// create(type : string) - type is passed through to the application on the standard API, and must be known by it.
  case create
  
  /// copy(source).
  case copy
  
  /// truncate(source, length) - source must be stringy type.
  case truncate
  
  /// escape(source, fmt1, fmt2) - change source from one kind of escaping to another (plain, java, xml, json). note
  /// that this is for when the string itself is escaped.
  case escape
  
  /// cast(source, type?) - case source from one type to another. target type can be left as implicit if there is one
  /// and only one target type known.
  case cast
  
  /// append(source...) - source is element or string.
  case append
  
  /// translate(source, uri_of_map) - use the translate operation.
  case translate
  
  /// reference(source : object) - return a string that references the provided tree properly.
  case reference
  
  /// Perform a date operation. *Parameters to be documented*.
  case dateOp
  
  /// Generate a random UUID (in lowercase). No Parameters.
  case uuid
  
  /// Return the appropriate string to put in a reference that refers to the resource provided as a parameter.
  case pointer
  
  /// Execute the supplied FHIRPath expression and use the value returned by that.
  case evaluate
  
  /// Create a CodeableConcept. Parameters = (text) or (system. Code[, display]).
  case cc
  
  /// Create a Coding. Parameters = (system. Code[, display]).
  case C = "c"
  
  /// Create a quantity. Parameters = (text) or (value, unit, [system, code]) where text is the natural representation
  /// e.g. [comparator]value[space]unit.
  case qty
  
  /// Create an identifier. Parameters = (system, value[, type]) where type is a code from the identifier type value
  /// set.
  case id
  
  /// Create a contact details. Parameters = (value) or (system, value). If no system is provided, the system should
  /// be inferred from the content of the value.
  case cp
}
