//
//  MissingToothReasonCodes.swift
//  AlexandriaHRM
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
 This value set includes sample Missing Tooth Reason codes.
 
 URL: http://terminology.hl7.org/CodeSystem/missingtoothreason
 ValueSet: http://hl7.org/fhir/ValueSet/missing-tooth-reason
 */
// swiftlint:disable identifier_name
public enum MissingToothReasonCodes: String, AlexandriaHRMPrimitiveType {
  /// Extraction
  case E = "e"
  
  /// Congenital
  case C = "c"
  
  /// Unknown
  case U = "u"
  
  /// Other
  case O = "o"
}