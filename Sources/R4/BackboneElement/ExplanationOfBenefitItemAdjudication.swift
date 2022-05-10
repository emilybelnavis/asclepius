//
//  ExplanationOfBenefitItemAdjudication.swift
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

/// Adjudicaation details; If this item is a group then the values here are a summary of the adjudication of the
/// detail items. If this item is a simple product/service then this is the result of the adjudication of this item
open class ExplanationOfBenefitItemAdjudication: BackboneElement {
  /// Type of adjudication information
  public var category: CodeableConcept
  
  /// Explanation of adjudication outcome
  public var reason: CodeableConcept?
  
  /// Monetary amount
  public var amount: Money?
  
  /// Non-monatary value
  public var value: AsclepiusPrimitive<AsclepiusDecimal>?
  
  // MARK: - Class Functions
}
