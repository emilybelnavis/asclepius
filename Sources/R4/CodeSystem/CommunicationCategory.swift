//
//  CommunicationCategory.swift
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
 Codes for general categories of communications such as alerts, instructions, etc.
 
 URL: http://terminology.hl7.org/CodeSystem/communication-category
 ValueSet: http://hl7.org/fhir/ValueSet/communication-category
 */
public enum CommunicationCategory: String, AsclepiusPrimitiveType {
  /// The communication conveys an alert
  case alert
  
  /// The communication conveys a notification
  case notification
  
  /// The communication conveys a reminder
  case reminder
  
  /// The communication conveys an instruction
  case instruction
}
