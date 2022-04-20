//
//  AllergyIntoleranceCertainty.swift
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
 Statement about the degree of clinical certainty that a specific substance was the cause of the manifestation in a
 reaction event.
 
 URL: http://terminology.hl7.org/CodeSystem/reaction-event-certainty
 ValueSet: http://hl7.org/fhir/ValueSet/reaction-event-certainty
 */
public enum AllergyIntoleranceCertainty: String, FHIRKitPrimitiveType {
  /// There is a low level of clinical certainty that the reaction was caused by the identified substance.
  case unlikely
  
  /// There is a high level of clinical certainty that the reaction was caused by the identified substance
  case likely
  
  /// There is a very high level of clinical certainty that the reaction was due to the identified substance,
  /// which may include clinical evidence by testing or re-challenge
  case confirmed
  
  /// The clinical certainty that the reaction was caused by the identified substance is unknown. It is an
  /// explicit assertation that certainty is not known.
  case unknown
}
