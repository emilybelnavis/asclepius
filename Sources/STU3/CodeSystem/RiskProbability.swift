//
//  RiskProbability.swift
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
 Codes representing the likelihood of a particular outcome in a risk assessment.
 
 URL: http://terminology.hl7.org/CodeSystem/risk-probability
 ValueSet: http://hl7.org/fhir/ValueSet/risk-probability
 */
public enum RiskProbability: String, AsclepiusPrimitiveType {
  /// The specified outcome is exceptionally unlikely.
  case negligible
  
  /// The specified outcome is possible but unlikely.
  case low
  
  /// The specified outcome has a reasonable likelihood of occurrence.
  case moderate
  
  /// The specified outcome is more likely to occur than not.
  case high
  
  /// The specified outcome is effectively guaranteed.
  case certain
}
