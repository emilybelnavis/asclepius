//
//  BenefitTypeCodes.swift
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
 This value set includes a smattering of Benefit type codes.
 
 URL: http://terminology.hl7.org/CodeSystem/benefit-type
 ValueSet: http://hl7.org/fhir/ValueSet/benefit-type
 */
public enum BenefitTypeCodes: String, FHIRKitPrimitiveType {
  /// Maximum benefit allowable
  case benefit
  
  /// Cost to be incurred before benefits are applied
  case deductible
  
  /// Service visit
  case visit
  
  /// Type of room
  case room
  
  /// Copayment per service
  case copay
  
  /// Copayment percentage per service
  case copayPercent = "copay-percent"
  
  /// Copayment maximum per service
  case copayMaximum = "copay-maximum"
  
  /// Vision exam
  case visionExam = "vision-exam"
  
  /// Frames and lenses
  case visionGlasses = "vision-glasses"
  
  /// Contact lenses
  case visionContacts = "vision-contacts"
  
  /// Medical primary health coverage
  case medicalPrimarycare = "medical-primarycare"
  
  /// Pharmacy dispense coverage
  case pharmacyDispense = "pharmacy-dispense"
}
