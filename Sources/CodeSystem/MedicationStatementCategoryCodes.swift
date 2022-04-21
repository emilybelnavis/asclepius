//
//  MedicationStatementCategoryCodes.swift
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
 Medication Status Codes
 
 URL: http://terminology.hl7.org/CodeSystem/medication-statement-category
 ValueSet: http://hl7.org/fhir/ValueSet/medication-statement-category
 */
public enum MedicationStatementCategoryCodes: String, FHIRKitPrimitiveType {
  /// Includes orders for medications to be administered or consumed in an inpatient or acute care setting
  case inpatient
  
  /// Includes orders for medications to be administered or consumed in an outpatient setting (for example, Emergency
  /// Department, Outpatient Clinic, Outpatient Surgery, Doctor's office)
  case outpatient
  
  /// Includes orders for medications to be administered or consumed by the patient in their home (this would include
  /// long term care or nursing homes, hospices, etc.).
  case community
  
  /// Includes statements about medication use, including over the counter medication, provided by the patient, agent
  /// or another provider
  case patientspecified
}