//
//  DiagnosisRole.swift
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
 This value set defines a set of codes that can be used to express the role of a diagnosis on the Encounter or
 EpisodeOfCare record.
 
 URL: http://terminology.hl7.org/CodeSystem/diagnosis-role
 ValueSet: http://hl7.org/fhir/ValueSet/diagnosis-role
 */
public enum DiagnosisRole: String, AlexandriaHRMPrimitiveType {
  /// AD
  case AD
  
  /// DD
  case DD
  
  /// CC
  case CC
  
  /// CM
  case CM
  
  /// preOp
  case preOp = "pre-op"
  
  /// postOp
  case postOp = "post-op"
  
  /// billing
  case billing
}
