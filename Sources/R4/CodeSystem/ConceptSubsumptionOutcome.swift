//
//  ConceptSubsumptionOutcome.swift
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
 The subsumption relationship between code/Coding "A" and code/Coding "B". There are 4 possible codes to be returned:
 equivalent, subsumes, subsumed-by, and not-subsumed. If the server is unable to determine the relationship between the
 codes/Codings, then it returns an error (i.e. an OperationOutcome).
 
 URL: http://hl7.org/fhir/concept-subsumption-outcome
 ValueSet: http://hl7.org/fhir/ValueSet/concept-subsumption-outcome
 */
public enum ConceptSubsumptionOutcome: String, FHIRKitPrimitiveType {
  /// The two concepts are equivalent (have the same properties)
  case equivalent
  
  /// Coding/code "A" subsumes Coding/code "B" (e.g. B has all the properties A has, and some of it's own)
  case subsumes
  
  /// Coding/code "A" is subsumed by Coding/code "B" (e.g. A has all the properties B has, and some of it's own)
  case subsumedBy = "subsumed-by"
  
  /// Coding/code "A" and Coding/code "B" are disjoint (e.g. each has properties that the other doesn't have)
  case notSubsumed = "not-subsumed"
}
