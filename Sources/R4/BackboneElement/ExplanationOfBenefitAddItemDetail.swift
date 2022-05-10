//
//  ExplanationOfBenefitAddItemDetail.swift
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

/// Second-tier service adjudications for payor-added services
open class ExplanationOfBenefitAddItemDetail: BackboneElement {
  /// Billing, service, product, or drug code
  public var productOrService: CodeableConcept
  
  /// Service/product billing modifiers
  public var modifier: [CodeableConcept]?
  
  /// Count of product/services
  public var quantity: Quantity?
  
  /// Fee, charge, or cost per item
  public var unitPrice: Money?
  
  /// Price scaling factor
  public var factor: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// Total item cost
  public var net: Money?
  
  /// Applicable note numbers
  public var noteNumber: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Added items adjudication
  public var adjudication: [ExplanationOfBenefitItemAdjudication]?
  
  /// Insurer added line items
  public var subDetail: [ExplanationOfBenefitAddItemDetailSubDetail]?
  
  // MARK: - Class Functions
}
