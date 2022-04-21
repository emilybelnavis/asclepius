//
//  PlanDefinitionType.swift
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
 The type of PlanDefinition.
 
 URL: http://terminology.hl7.org/CodeSystem/plan-definition-type
 ValueSet: http://hl7.org/fhir/ValueSet/plan-definition-type
 */
public enum PlanDefinitionType: String, FHIRKitPrimitiveType {
  /// A pre-defined and approved group of orders related to a particular clinical condition (e.g. hypertension
  /// treatment and monitoring) or stage of care (e.g. hospital admission to Coronary Care Unit). An order set is used
  /// as a checklist for the clinician when managing a patient with a specific condition. It is a structured
  /// collection of orders relevant to that condition and presented to the clinician in a computerized provider order
  /// entry (CPOE) system.
  case orderSet = "order-set"
  
  /// Defines a desired/typical sequence of clinical activities including preconditions, triggers and temporal
  /// relationships.
  case clinicalProtocol = "clinical-protocol"
  
  /// A decision support rule of the form [on Event] if Condition then Action. It is intended to be a shareable,
  /// computable definition of actions that should be taken whenever some condition is met in response to a particular
    /// event or events.
  case ecaRule = "eca-rule"
  
  /// Defines the steps for a group of one or more systems in an event flow process along with the step constraints,
  /// sequence, pre-conditions and decision points to complete a particular objective.
  case workflowDefinition = "workflow-definition"
}