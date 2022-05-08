//
//  ListStatus.swift
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
 The current state of the list.
 
 URL: http://hl7.org/fhir/list-status
 ValueSet: http://hl7.org/fhir/ValueSet/list-status
 */
public enum ListStatus: String, AlexandriaHRMPrimitiveType {
  /// The list is considered to be an active part of the patient's record.
  case current
  
  /// The list is "old" and should no longer be considered accurate or relevant.
  case retired
  
  /// The list was never accurate.  It is retained for medico-legal purposes only.
  case enteredInError = "entered-in-error"
}
