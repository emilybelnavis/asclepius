//
//  DiagnosisRole.swift
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
 This value set defines a set of codes that can be used to express the role of a diagnosis on the Encounter or
 EpisodeOfCare record.
 
 URL: http://terminology.hl7.org/CodeSystem/diagnosis-role
 ValueSet: http://hl7.org/fhir/ValueSet/diagnosis-role
 */
public enum DiagnosisRole: String, FHIRKitPrimitiveType {
  /// AD
  case AD
  
  /// DD
  case DD
  
  /// CC
  case CC
  
  /// CM
  case CM
  
  /// preOp
  case preOp = "pre-op"
  
  /// postOp
  case postOp = "post-op"
  
  /// billing
  case billing
}
