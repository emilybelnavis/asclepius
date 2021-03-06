//
//  SupplyRequestReason.swift
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

/**
 The reason why the supply item was requested.
 
 URL: http://terminology.hl7.org/CodeSystem/supplyrequest-reason
 ValueSet: http://hl7.org/fhir/ValueSet/supplyrequest-reason
 */
public enum SupplyRequestReason: String, AsclepiusPrimitiveType {
  /// The supply has been requested for use in direct patient care.
  case patientCare = "patient-care"
  
  /// The supply has been requested for creating or replenishing ward stock.
  case wardStock = "ward-stock"
}
