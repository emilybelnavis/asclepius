//
//  ExplanationOfBenefitPayment.swift
//  Asclepius
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import AsclepiusCore

/// Payment details for the adjudication of the claim
open class ExplanationOfBenefitPayment: BackboneElement {
  /// Partial or complete payment
  public var type: CodeableConcept?
  
  /// Payment adjustment for non-claim issues
  public var adjustment: Money?
  
  /// Explanation for the adjustment
  public var adjustmentReason: CodeableConcept?
  
  /// Expected date of payment
  public var date: AsclepiusPrimitive<AsclepiusDate>
  
  /// Payable amount after adjustment
  public var amount: Money?
  
  /// Business identifier for the payment
  public var identifier: Identifier?
  
  // MARK: Class Functions
}
