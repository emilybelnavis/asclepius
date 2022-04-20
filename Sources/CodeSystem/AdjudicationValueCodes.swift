//
//  AdjudicationValueCodes.swift
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
 This value set includes a smattering of Adjudication Value codes which includes codes to indicate the amounts eligible
 under the plan, the amount of benefit, copays etc.
 
 URL: http://terminology.hl7.org/CodeSystem/adjudication
 ValueSet: http://hl7.org/fhir/ValueSet/adjudication
 */
public enum AdjudicationValueCodes: String, FHIRKitPrimitiveType {
  /// Total submitted amount for the claim, group, or line item
  case submitted
  
  /// Patient co-payment
  case copay
  
  /// Amount of the charge which is considered for adjudication
  case eligible
  
  /// Amount deducted from the eligible amount prior to adjudication
  case deductible
  
  /// The amount of deductable which could not be allocated to other line items.
  case unallocdeduct
  
  /// Eligible percentage
  case eligpercent
  
  /// The amount of tax
  case tax
  
  /// Amount payable under coverage
  case benefit
  
}
