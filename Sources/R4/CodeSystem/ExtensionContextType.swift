//
//  ExtensionContextType.swift
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
 How an extension context is interpreted.
 
 URL: http://hl7.org/fhir/extension-context-type
 ValueSet: http://hl7.org/fhir/ValueSet/extension-context-type
 */
public enum ExtensionContextType: String, FHIRKitPrimitiveType {
  /// The context is all elements that match the FHIRPath query found in the expression.
  case fhirpath
  
  /// The context is any element that has an ElementDefinition.id that matches that found in the expression. This
  /// includes ElementDefinition Ids that have slicing identifiers. The full path for the element is
  /// [url]#[elementid]. If there is no #, the Element id is one defined in the base specification.
  case element
  
  /// The context is a particular extension from a particular StructureDefinition, and the expression is just a uri
  /// that identifies the extension.
  case `extension`
}
