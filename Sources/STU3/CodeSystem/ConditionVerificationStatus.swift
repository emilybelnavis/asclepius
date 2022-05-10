//
//  ConditionVerificationStatus.swift
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
 The verification status to support or decline the clinical status of the condition or diagnosis.
 
 URL: http://terminology.hl7.org/CodeSystem/condition-ver-status
 ValueSet: http://hl7.org/fhir/ValueSet/condition-ver-status
 */
public enum ConditionVerificationStatus: String, AsclepiusPrimitiveType {
  /// There is not sufficient diagnostic and/or clinical evidence to treat this as a confirmed condition
  case unconfirmed
  
  /// This is a tentative diagnosis - still a candidate that is under consideration
  case provisional
  
  /// One of a set of potentially (and typically mutually exclusive) diagnoses asserted to further guide
  /// the diagnostic process and preliminary treatment
  case differential
  
  /// There is sufficient diagnostic and/or clinical evidence to treat this as a confirmed condition
  case confirmed
  
  /// This condition has been ruled out by diagnostic and clinical evidence
  case refuted
  
  /// The statement was entered in error and is not valid
  case enteredInError
}
