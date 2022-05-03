//
//  DefinitionStatus.swift
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
 Codes identifying the lifecycle stage of a definition.
 
 URL: http://terminology.hl7.org/CodeSystem/definition-status
 ValueSet: http://hl7.org/fhir/ValueSet/definition-status
 */
public enum DefinitionStatus: String, FHIRKitPrimitiveType {
  /// The definition is in the design stage and is not yet considered to be "ready for use".
  case draft
  
  /// The definition is considered ready for use.
  case active
  
  /// The definition should no longer be used.
  case withdrawn
  
  /// The authoring/source system does not know which of the status values currently applies for this resource.  Note:
  /// This concept is not to be used for "other" - one of the listed statuses is presumed to apply,  but the
  /// authoring/source system does not know which.
  case unknown
}
