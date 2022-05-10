//
//  ExplanationOfBenefitBenefitBalance.swift
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

open class ExplanationOfBenefitBenefitBalance: BackboneElement {
  /// Benefit classification
  public var category: CodeableConcept
  
  /// Excluded from the plan
  public var excluded: AsclepiusPrimitive<AsclepiusBool>?
  
  /// Short name for the benefit
  public var name: AsclepiusPrimitive<AsclepiusString>?
  
  /// Description of the benefit or services covered
  public var fhirDescription: AsclepiusPrimitive<AsclepiusString>?
  
  /// In/out-of network
  public var network: CodeableConcept?
  
  /// Individual or family
  public var unit: CodeableConcept?
  
  /// Annual or lifetime
  public var term: CodeableConcept?
  
  /// Benefit summary
  public var financial: [ExplanationOfBenefitBenefitBalanceFinancial]?
  
  // MARK: - Class Functions
}
