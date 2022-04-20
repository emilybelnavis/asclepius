//
//  SynthesisType.swift
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
 Types of combining results from a body of evidence (eg. summary data meta-analysis).
 
 URL: http://terminology.hl7.org/CodeSystem/synthesis-type
 ValueSet: http://hl7.org/fhir/ValueSet/synthesis-type
 */
public enum SynthesisType: String, FHIRKitPrimitiveType {
  /// A meta-analysis of the summary data of estimates from individual studies or data sets.
  case stdMA = "std-MA"
  
  /// A meta-analysis of the individual participant data from individual studies or data sets.
  case IPDMA = "IPD-MA"
  
  /// An indirect meta-analysis derived from 2 or more direct comparisons in a network meta-analysis.
  case indirectNMA = "indirect-NMA"
  
  /// An composite meta-analysis derived from direct comparisons and indirect comparisons in a network meta-analysis.
  case combinedNMA = "combined-NMA"
  
  /// A range of results across a body of evidence.
  case range
  
  /// An approach describing a body of evidence by categorically classifying individual studies (eg 3 studies showed
  /// beneft and 2 studied found no effect).
  case classification
}
