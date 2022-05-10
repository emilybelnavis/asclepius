//
//  ExplanationOfBenefitItem.swift
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

/// Product/service provided; A claim line. Either a simple (product/service) or a `group` of detals which can
/// also be a list of simple items or groups of sub-details
open class ExplanationOfBenefitItem: BackboneElement {
  /// Item instance identifier
  public var sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// Applicable care team members
  public var careTeamSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Applicable diagnoses
  public var diagnosisSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Applicable procedures
  public var procedureSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Applicable exception and supporting information
  public var informationSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Revenue or cost center code
  public var revenue: CodeableConcept?
  
  /// Benefit classification
  public var category: CodeableConcept?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodeableConcept
  
  /// Product or service billing modifiers
  public var modifier: [CodeableConcept]?
  
  /// Program the product/service is provided under
  public var programCode: [CodeableConcept]?
  
  /// Date(s) of service/product delivery
  public var serviced: ExplanationOfBenefitServicedX?
  
  /// Place of service/product was supplied
  public var location: ExplanationOfBenefitLocationX?
  
  /// Count of products/services
  public var quantity: Quantity?
  
  /// Fee, charge, or cost per item
  public var unitPrice: Money?
  
  /// Price scaling factor
  public var factor: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// Total item cost
  public var net: Money?
  
  /// Unique device identifier
  public var udi: [Reference]?
  
  /// anatomical location
  public var bodySite: CodeableConcept?
  
  /// anatomical sub-location
  public var subSite: [CodeableConcept]?
  
  /// encounters related to this billed item
  public var encounter: [Reference]?
  
  /// applicable note numbers
  public var noteNumber: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// adjudication details
  public var adjudication: [ExplanationOfBenefitItemAdjudication]?
  
  /// additional items
  public var detail: [ExplanationOfBenefitItemDetail]?
  
  // MARK: - Class Functions
  
}
