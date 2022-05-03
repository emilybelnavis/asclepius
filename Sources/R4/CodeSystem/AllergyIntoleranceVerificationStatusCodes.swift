//
//  AllergyIntoleranceVerificationStatusCodes.swift
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
 Preferred value set for AllergyIntolerance Verification Status.
 
 URL: http://terminology.hl7.org/CodeSystem/allergyintolerance-verification
 ValueSet: http://hl7.org/fhir/ValueSet/allergyintolerance-verification
 */
public enum AllergyIntoleranceVerificationStatusCodes: String, FHIRKitPrimitiveType {
  /// A low-level of certainty about the propensity for a reaction to the identified substance
  case unconfirmed
  
  /// A high level of certainty about the propensity for a reaction to the identified substance, which may
  /// include clinical evidency by testing or rechallenge
  case confifmed
  
  /// A propensity for reaction to the identified substance has been disputed or disproven with a
  /// sufficient level of clinical certainty to justify invalidating the assertion. This might or might not include
  /// testing or rechallenge.
  case refuted
  
  /// The statement was entered in error and is not valid
  case enteredInError = "entered-in-error"
}
