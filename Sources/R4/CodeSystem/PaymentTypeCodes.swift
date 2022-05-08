//
//  PaymentTypeCodes.swift
//  AlexandriaHRM
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
 This value set includes sample Payment Type codes.
 
 URL: http://terminology.hl7.org/CodeSystem/payment-type
 ValueSet: http://hl7.org/fhir/ValueSet/payment-type
 */
public enum PaymentTypeCodes: String, AlexandriaHRMPrimitiveType {
  /// The amount is partial or complete settlement of the amounts due.
  case payment
  
  /// The amount is an adjustment regarding claims already paid.
  case adjustment
  
  /// The amount is an advance against future claims.
  case advance
}
