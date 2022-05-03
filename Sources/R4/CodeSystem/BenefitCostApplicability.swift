//
//  BenefitCostApplicability.swift
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
 Whether the cost applies to in-network or out-of-network providers.
 
 URL: http://terminology.hl7.org/CodeSystem/applicability
 ValueSet: http://hl7.org/fhir/ValueSet/insuranceplan-applicability
 */
public enum BenefitCostApplicability: String, FHIRKitPrimitiveType {
  /// Provider is contracted with the health insurance company to provide services to plan members for
  /// specific pre-negotiated rates
  case inNetwork = "in-network"
  
  /// Provider is not contracted with the health insurance company to provide services to plan members for
  /// specific pre-negotiated rates
  case outOfNetwork = "out-of-network"
  
  /// Other applicability
  case other
}
