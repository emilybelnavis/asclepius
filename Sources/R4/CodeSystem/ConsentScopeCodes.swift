//
//  ConsentScopeCodes.swift
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
 This value set includes the four Consent scope codes.
 
 URL: http://terminology.hl7.org/CodeSystem/consentscope
 ValueSet: http://hl7.org/fhir/ValueSet/consent-scope
 */
public enum ConsentScopeCodes: String, FHIRKitPrimitiveType {
  /// Actions to be taken if they are no longer able to make decisions for themselves
  case adr
  
  /// Consent to participate in research protocol and information sharing required
  case research
  
  /// Agreement to collect, access, use or disclose (share) information
  case patientPrivacy = "patient-privacy"
  
  /// Consent to undergo a specific treatment
  case treatment
}
