//
//  FlagCategory.swift
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
 Example list of general categories for flagged issues. (Not complete or necessarily appropriate.)
 
 URL: http://terminology.hl7.org/CodeSystem/flag-category
 ValueSet: http://hl7.org/fhir/ValueSet/flag-category
 */
public enum FlagCategory: String, FHIRKitPrimitiveType {
  /// Flags related to the subject's dietary needs.
  case diet
  
  /// Flags related to the subject's medications.
  case drug
  
  /// Flags related to performing laboratory tests and related processes (e.g. phlebotomy).
  case lab
  
  /// Flags related to administrative and financial processes.
  case admin
  
  /// Flags related to coming into contact with the patient.
  case contact
  
  /// Flags related to the subject's clinical data.
  case clinical
  
  /// Flags related to behavior.
  case behavioral
  
  /// Flags related to research.
  case research
  
  /// Flags related to subject's advance directives.
  case advanceDirective = "advance-directive"
  
  /// Flags related to safety precautions.
  case safety
}
