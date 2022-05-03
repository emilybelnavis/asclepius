//
//  ConditionVerificationStatus.swift
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
 The verification status to support or decline the clinical status of the condition or diagnosis.
 
 URL: http://terminology.hl7.org/CodeSystem/condition-ver-status
 ValueSet: http://hl7.org/fhir/ValueSet/condition-ver-status
 */
public enum ConditionVerificationStatus: String, FHIRKitPrimitiveType {
  /// There is not sufficient diagnostic and/or clinical evidence to treat this as a confirmed condition
  case unconfirmed
  
  /// This is a tentative diagnosis - still a candidate that is under consideration
  case provisional
  
  /// One of a set of potentially (and typically mutually exclusive) diagnoses asserted to further guide
  /// the diagnostic process and preliminary treatment
  case differential
  
  /// There is sufficient diagnostic and/or clinical evidence to treat this as a confirmed condition
  case confirmed
  
  /// This condition has been ruled out by diagnostic and clinical evidence
  case refuted
  
  /// The statement was entered in error and is not valid
  case enteredInError
}
