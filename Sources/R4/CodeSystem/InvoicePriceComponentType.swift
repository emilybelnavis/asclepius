//
//  InvoicePriceComponentType.swift
//  FHIRKit
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

/**
 Codes indicating the kind of the price component.
 
 URL: http://hl7.org/fhir/invoice-priceComponentType
 ValueSet: http://hl7.org/fhir/ValueSet/invoice-priceComponentType
 */
public enum InvoicePriceComponentType: String, FHIRKitPrimitiveType {
  /// the amount is the base price used for calculating the total price before applying surcharges, discount or taxes.
  case base
  
  /// the amount is a surcharge applied on the base price.
  case surcharge
  
  /// the amount is a deduction applied on the base price.
  case deduction
  
  /// the amount is a discount applied on the base price.
  case discount
  
  /// the amount is the tax component of the total price.
  case tax
  
  /// the amount is of informational character, it has not been applied in the calculation of the total price.
  case informational
}
