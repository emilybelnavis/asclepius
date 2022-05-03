//
//  RequestIntent.swift
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
 Codes indicating the degree of authority/intentionality associated with a request.
 
 URL: http://hl7.org/fhir/request-intent
 ValueSet: http://hl7.org/fhir/ValueSet/request-intent
 */
public enum RequestIntent: String, FHIRKitPrimitiveType {
  /// The request is a suggestion made by someone/something that does not have an intention to ensure it occurs and
  /// without providing an authorization to act.
  case proposal
  
  /// The request represents an intention to ensure something occurs without providing an authorization for others to
  /// act.
  case plan
  
  /// The request represents a legally binding instruction authored by a Patient or RelatedPerson.
  case directive
  
  /// The request represents a request/demand and authorization for action by a Practitioner.
  case order
  
  /// The request represents an original authorization for action.
  case originalOrder = "original-order"
  
  /// The request represents an automatically generated supplemental authorization for action based on a parent
  /// authorization together with initial results of the action taken against that parent authorization.
  case reflexOrder = "reflex-order"
  
  /// The request represents the view of an authorization instantiated by a fulfilling system representing the details
  /// of the fulfiller's intention to act upon a submitted order.
  case fillerOrder = "filler-order"
  
  /// An order created in fulfillment of a broader order that represents the authorization for a single activity
  /// occurrence.  E.g. The administration of a single dose of a drug.
  case instanceOrder = "instance-order"
  
  /// The request represents a component or option for a RequestGroup that establishes timing, conditionality and/or
  /// other constraints among a set of requests.  Refer to [[[RequestGroup]]] for additional information on how this
  /// status is used.
  case option
}
