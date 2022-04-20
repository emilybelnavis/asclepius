//
//  NarrativeStatus.swift
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
 The status of a resource narrative.
 
 URL: http://hl7.org/fhir/narrative-status
 ValueSet: http://hl7.org/fhir/ValueSet/narrative-status
 */
public enum NarrativeStatus: String, FHIRKitPrimitiveType {
  /// The contents of the narrative are entirely generated from the core elements in the content.
  case generated
  
  /// The contents of the narrative are entirely generated from the core elements in the content and some of the
  /// content is generated from extensions. The narrative SHALL reflect the impact of all modifier extensions.
  case extensions
  
  /// The contents of the narrative may contain additional information not found in the structured data. Note that
  /// there is no computable way to determine what the extra information is, other than by human inspection.
  case additional
  
  /// The contents of the narrative are some equivalent of "No human-readable text provided in this case".
  case empty
}
