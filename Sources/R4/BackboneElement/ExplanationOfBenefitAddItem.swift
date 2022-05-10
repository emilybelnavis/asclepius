//
//  ExplanationOfBenefitAddItem.swift
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

/// First-tier service adjudications for payor-added product/service lines
open class ExplanationOfBenefitAddItem: BackboneElement {
  /// Item sequence number
  public var itemSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Detail sequence number
  public var detailSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Subdetail sequence number
  public var subDetailSequence: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Authorized providers
  public var provider: [Reference]?
  
  /// Billing, service, product, or drug code
  public var productOrService: CodeableConcept
  
  /// Service or product billing modifier
  public var modifier: [CodeableConcept]?
  
  /// Program the product or service is provided under
  public var programCode: [CodeableConcept]?
  
  /// Date(s) of service or product delivery
  public var serviced: ExplanationOfBenefitServicedX?
  
  /// Place of service or where product was supplied
  public var location: ExplanationOfBenefitLocationX?
  
  /// Count of products/services
  public var quantity: Quantity?
  
  /// Fee, charge, or cost per item
  public var unitPrice: Money?
  
  /// Price scaling factor
  public var factor: AsclepiusPrimitive<AsclepiusDecimal>?
  
  /// Total item cost
  public var net: Money?
  
  /// Anatomical location
  public var bodySite: CodeableConcept?
  
  /// Anatomical sub-location
  public var subSite: [CodeableConcept]?
  
  /// Applicable note numbers
  public var noteNumber: [AsclepiusPrimitive<AsclepiusPositiveInteger>]?
  
  /// Added items adjudication
  public var adjudication: [ExplanationOfBenefitItemAdjudication]?
  
  /// Insurer added line items
  public var detail: [ExplanationOfBenefitAddItemDetail]?
  
  // MARK: - Class Functions
}
