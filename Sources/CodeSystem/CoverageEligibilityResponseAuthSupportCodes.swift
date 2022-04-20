//
//  CoverageEligibilityResponseAuthSupportCodes.swift
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
 This value set includes CoverageEligibilityResponse Auth Support codes.
 
 URL: http://terminology.hl7.org/CodeSystem/coverageeligibilityresponse-ex-auth-support
 ValueSet: http://hl7.org/fhir/ValueSet/coverageeligibilityresponse-ex-auth-support
 */
public enum CoverageEligibilityResponseAuthSupportCodes: String, FHIRKitPrimitiveType {
  /// A request or authorization for laboratory diagnostic tests.
  case laborder
  
  /// A report on laboratory diagnostic test(s).
  case labreport
  
  /// A request or authorization for diagnostic imaging.
  case diagnosticimageorder
  
  /// A report on diagnostic image(s).
  case diagnosticimagereport
  
  /// A report from a licensed professional regarding the siutation, condition or proposed treatment.
  case professionalreport
  
  /// A formal accident report as would be filed with police or a simlar official body.
  case accidentreport
  
  /// A physical model of the affected area.
  case model
  
  /// A photograph of the affected area.
  case picture
}
