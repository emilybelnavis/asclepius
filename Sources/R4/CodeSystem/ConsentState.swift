//
//  ConsentState.swift
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
 Indicates the state of the consent.
 
 URL: http://hl7.org/fhir/consent-state-codes
 ValueSet: http://hl7.org/fhir/ValueSet/consent-state-codes
 */
public enum ConsentState: String, FHIRKitPrimitiveType {
  /// The consent is in development or awaiting use but is not yet intended to be acted upon
  case draft
  
  /// The consent has been proposed but not yet agreed to by all parties. The negotiation stage.
  case proposed
  
  /// The consent is to be followed and enforced
  case active
  
  /// The concent has been rejected by one or more of the parties
  case rejected
  
  /// The consent is terminated or replaced
  case inactive
  
  /// The consent was created wrongly (e.g. wrong patient) and should be ignored.
  case enteredInError = "entered-in-error"
}
