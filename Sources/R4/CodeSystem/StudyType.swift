//
//  StudyType.swift
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
 Types of research studies (types of research methods).
 
 URL: http://terminology.hl7.org/CodeSystem/study-type
 ValueSet: http://hl7.org/fhir/ValueSet/study-type
 */
public enum StudyType: String, FHIRKitPrimitiveType {
  /// randomized controlled trial.
  case RCT
  
  /// controlled (but not randomized) trial.
  case CCT
  
  /// observational study comparing cohorts.
  case cohort
  
  /// case-control study.
  case caseControl = "case-control"
  
  /// uncontrolled cohort or case series.
  case series
  
  /// a single case report.
  case caseReport = "case-report"
  
  /// a combination of 1 or more types of studies.
  case mixed
}
