//
//  MedicationRequestIntent.swift
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
 MedicationRequest Intent Codes
 
 URL: http://hl7.org/fhir/CodeSystem/medicationrequest-intent
 ValueSet: http://hl7.org/fhir/ValueSet/medicationrequest-intent
 */
public enum MedicationRequestIntent: String, FHIRKitPrimitiveType {
  /// The request is a suggestion made by someone/something that doesn't have an intention to ensure it occurs and
  /// without providing an authorization to act
  case proposal
  
  /// The request represents an intention to ensure something occurs without providing an authorization for others to
  /// act.
  case plan
  
  /// The request represents a request/demand and authorization for action
  case order
  
  /// The request represents the original authorization for the medication request.
  case originalOrder = "original-order"
  
  /// The request represents an automatically generated supplemental authorization for action based on a parent
  /// authorization together with initial results of the action taken against that parent authorization..
  case reflexOrder = "reflex-order"
  
  /// The request represents the view of an authorization instantiated by a fulfilling system representing the details
  /// of the fulfiller's intention to act upon a submitted order.
  case fillerOrder = "filler-order"
  
  /// The request represents an instance for the particular order, for example a medication administration record.
  case instanceOrder = "instance-order"
  
  /// The request represents a component or option for a RequestGroup that establishes timing, conditionality and/or
  /// other constraints among a set of requests.
  case option
}
