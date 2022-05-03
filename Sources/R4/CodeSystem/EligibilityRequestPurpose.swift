//
//  EligibilityRequestPurpose.swift
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
 A code specifying the types of information being requested.
 
 URL: http://hl7.org/fhir/eligibilityrequest-purpose
 ValueSet: http://hl7.org/fhir/ValueSet/eligibilityrequest-purpose
 */
public enum EligibilityRequestPurpose: String, FHIRKitPrimitiveType {
  /// The prior authorization requirements for the listed, or discovered if specified, converages for the categories
  /// of service and/or specifed biling codes are requested.
  case authRequirements = "auth-requirements"
  
  /// The plan benefits and optionally benefits consumed  for the listed, or discovered if specified, converages are
  /// requested.
  case benefits
  
  /// The insurer is requested to report on any coverages which they are aware of in addition to any specifed.
  case discovery
  
  /// A check that the specified coverages are in-force is requested.
  case validation
}
