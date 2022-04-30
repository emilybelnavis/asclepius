//
//  ConsentProvision.swift
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
 Constraints to the base `Consent.policyRule`.
 
 An exception to the base policy of this consent. An exception can be an addition or removal of access
 permissions
 */
open class ConsentProvision: BackboneElement {
  /// Action to take (permit/deny) when the rule conditions are met. Not permitted in root rule
  /// required in all nested rules.
  public var type: FHIRKitPrimitive<ConsentProvisionType>
  
  /// Timeframe for this rule
  public var period: Period?
  
  /// Who and/or what controlled by this rule (or group, by role)
  public var actor: [ConsentProvisionActor]?
  
  /// Actions controlled by this rule
  public var action: [CodableConcept]?
  
  /// Security lables that define affected resources
  public var securityLabel: [Coding]?
  
  /// Context of activities covered by this rule
  public var purpose: [Coding]?
  
  /// Consent Provision Class (e.g. `ResourceType`, `Profile`, `CDA`, etc...)
  public var provisionClass: [Coding]?
  
  /// e.g. `LOINC` or `SNOMED CT` code, etc, in the content
  public var code: [CodableConcept]?
  
  /// Timeframe for data controlled by this rule
  public var dataPeriod: Period?
  
  /// Data controlled by this rule
  public var data: [ConceptProvisionData]?
  
  /// Nested Exception Rules
  public var provision: [ConsentProvision]?
  
}
