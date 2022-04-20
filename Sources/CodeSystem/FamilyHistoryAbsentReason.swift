//
//  FamilyHistoryAbsentReason.swift
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
 Codes describing the reason why a family member's history is not available.
 
 URL: http://terminology.hl7.org/CodeSystem/history-absent-reason
 ValueSet: http://hl7.org/fhir/ValueSet/history-absent-reason
 */
public enum FamilyHistoryAbsentReason: String, FHIRKitPrimitiveType {
  /// Patient does not know the subject, e.g. the biological parent of an adopted patient.
  case subjectUnknown = "subject-unknown"
  
  /// The patient withheld or refused to share the information.
  case withheld
  
  /// Information cannot be obtained; e.g. unconscious patient.
  case unableToObtain = "unable-to-obtain"
  
  /// Patient does not have the information now, but can provide the information at a later date.
  case deferred
}
