//
//  StructureDefinitionKind.swift
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
 Defines the type of structure that a definition is describing.
 
 URL: http://hl7.org/fhir/structure-definition-kind
 ValueSet: http://hl7.org/fhir/ValueSet/structure-definition-kind
 */
public enum StructureDefinitionKind: String, FHIRKitPrimitiveType {
  /// A primitive type that has a value and an extension. These can be used throughout complex datatype, Resource and
  /// extension definitions. Only the base specification can define primitive types.
  case primitiveType = "primitive-type"
  
  /// A  complex structure that defines a set of data elements that is suitable for use in 'resources'. The base
  /// specification defines a number of complex types, and other specifications can define additional types. These
  /// structures do not have a maintained identity.
  case complexType = "complex-type"
  
  /// A 'resource' - a directed acyclic graph of elements that aggregrates other types into an identifiable entity.
  /// The base FHIR resources are defined by the FHIR specification itself but other 'resources' can be defined in
  /// additional specifications (though these will not be recognised as 'resources' by the FHIR specification (i.e.
  /// they do not get end-points etc, or act as the targets of references in FHIR defined resources - though other
  /// specificatiosn can treat them this way).
  case resource
  
  /// A pattern or a template that is not intended to be a real resource or complex type.
  case logical
}
