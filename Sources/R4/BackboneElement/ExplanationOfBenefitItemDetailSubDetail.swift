//
//  ExplanationOfBenefitItemDetailSubDetail.swift
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

/// Third-tier of goods/services
open class ExplanationOfBenefitItemDetailSubDetail: BackboneElement {
  /// Product/service provided
  public var sequence: AsclepiusPrimitive<AsclepiusPositiveInteger>
  
  /// Revenue/cost-centre code
  public var revenue: CodeableConcept?
  
  /// Benefit classification
  public var category: CodeableConcept?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodeableConcept
  
  /// Service/product billing modifier
  public var modifier: [CodeableConcept]?
  
  /// Program the product/service is provided under
  public var programCode: [CodeableConcept]?
  
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
  
  /// Applicable note numbers
  public var noteNumber: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Detaul level adjudication details
  public var adjudication: [ExplanationOfBenefitItemAdjudication]?
  
  // MARK: - Class Functions
}
