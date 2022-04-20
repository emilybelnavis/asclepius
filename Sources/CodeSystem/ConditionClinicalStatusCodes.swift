//
//  ConditionClinicalStatusCodes.swift
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
 Preferred value set for Condition Clinical Status.
 
 URL: http://terminology.hl7.org/CodeSystem/condition-clinical
 ValueSet: http://hl7.org/fhir/ValueSet/condition-clinical
 */
public enum ConditionClinicalStatusCodes: String, FHIRKitPrimitiveType {
  /// The subject is currently experiencing the symptoms of the condition or there is evidence of the
  /// condition
  case active
  
  /// The subject is experiencing a re-occurence or repeating of a previously resolved condition,
  /// e.g. urinary tract infectoin, pancreatitis, cholangitis, conjunctivitis.
  case recurrence
  
  /// The subject is expreiencing a return of a conditoin or signs and symptoms after a period of
  /// improvement or remission, e.g. relapse of cancer, multiple sclerosis, rheumatoid arthritis,
  /// systemic lupus erythematosus, bipolar disorder, [psychotic relapse of] schizophrenia, etc...
  case relapse
  
  /// The subject is no longer experiencing the symptoms of the condition or there is no longer evidence
  /// of the condition
  case inactive
  
  /// The subject is no longer experiencing the symptoms of the condition, but there is a risk of the
  /// symptoms returning
  case remission
  
  /// The subject is no longer experiencing the symptoms of the condition and there is a negligible
  /// percieved risk of the symptoms returning
  case resolved
}
