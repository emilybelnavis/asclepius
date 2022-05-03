//
//  DetectedIssueSeverity.swift
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
 Indicates the potential degree of impact of the identified issue on the patient.
 
 URL: http://hl7.org/fhir/detectedissue-severity
 ValueSet: http://hl7.org/fhir/ValueSet/detectedissue-severity
 */
public enum DetectedIssueSeverity: String, FHIRKitPrimitiveType {
  /// Indicates the issue may be life-threatening or has the potential to cause permanent injury.
  case high
  
  /// Indicates the issue may result in noticeable adverse consequences but is unlikely to be life-threatening or
  /// cause permanent injury.
  case moderate
  
  /// Indicates the issue may result in some adverse consequences but is unlikely to substantially affect the
  /// situation of the subject.
  case low
}
