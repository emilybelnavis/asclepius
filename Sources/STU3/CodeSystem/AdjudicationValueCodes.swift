//
//  AdjudicationValueCodes.swift
//  Asclepius
//  Module: STU3
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
 This value set includes a smattering of Adjudication Value codes which includes codes to indicate the amounts eligible
 under the plan, the amount of benefit, copays etc.
 
 URL: http://terminology.hl7.org/CodeSystem/adjudication
 ValueSet: http://hl7.org/fhir/ValueSet/adjudication
 */
public enum AdjudicationValueCodes: String, AsclepiusPrimitiveType {
  /// Total submitted amount for the claim, group, or line item
  case submitted
  
  /// Patient co-payment
  case copay
  
  /// Amount of the charge which is considered for adjudication
  case eligible
  
  /// Amount deducted from the eligible amount prior to adjudication
  case deductible
  
  /// The amount of deductable which could not be allocated to other line items.
  case unallocdeduct
  
  /// Eligible percentage
  case eligpercent
  
  /// The amount of tax
  case tax
  
  /// Amount payable under coverage
  case benefit
  
}
