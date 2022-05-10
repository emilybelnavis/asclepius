//
//  MedicationDispensePerformerFunctionCodes.swift
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
 MedicationDispense Performer Function Codes
 
 URL: http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function
 ValueSet: http://hl7.org/fhir/ValueSet/medicationdispense-performer-function
 */
public enum MedicationDispensePerformerFunctionCodes: String, AsclepiusPrimitiveType {
  /// Recorded the details of the request
  case dataenterer
  
  /// Prepared the medication.
  case packager
  
  /// Performed initial quality assurance on the prepared medication
  case checker
  
  /// Performed the final quality assurance on the prepared medication against the request. Typically, this is a
  /// pharmacist function.
  case finalchecker
}
