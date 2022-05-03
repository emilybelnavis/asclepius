//
//  CopayCoverageTypeCodes.swift
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
 This value set includes sample Coverage Copayment Type codes.
 
 URL: http://terminology.hl7.org/CodeSystem/coverage-copay-type
 ValueSet: http://hl7.org/fhir/ValueSet/coverage-copay-type
 */
public enum CoverageCopayTypeCodes: String, FHIRKitPrimitiveType {
  /// An office visit for a general practitioner of a discipline.
  case gpvisit
  
  /// An office visit for a specialist practitioner of a discipline
  case spvisit
  
  /// An episode in an emergency department.
  case emergency

  /// An episode of an Inpatient hospital stay.
  case inpthosp
  
  /// A visit held where the patient is remote relative to the practitioner, e.g. by phone, computer or video
  /// conference.
  case televisit
  
  /// A visit to an urgent care facility - typically a community care clinic.
  case urgentcare
  
  /// A standard percentage applied to all classes or service or product not otherwise specified.
  case copaypct
  
  /// A standard fixed currency amount applied to all classes or service or product not otherwise specified.
  case copay
  
  /// The accumulated amount of patient payment before the coverage begins to pay for services.
  case deductible
  
  /// The maximum amout of payment for services which a patient, or family, is expected to incur - typically annually.
  case maxoutofpocket
}
