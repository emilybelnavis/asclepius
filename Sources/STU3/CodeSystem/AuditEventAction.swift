//
//  AuditEventAction.swift
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
 Indicator for type of action performed during the event that generated the event.
 
 URL: http://hl7.org/fhir/audit-event-action
 ValueSet: http://hl7.org/fhir/ValueSet/audit-event-action
 */
// swiftlint:disable identifier_name
public enum AuditEventAction: String, AsclepiusPrimitiveType {
  /// Create new database object (ex: placing an order)
  case C
  
  /// Dispaly or print data
  case R
  
  /// Update data
  case U
  
  /// Delete items
  case D
  
  /// Perform a system/application function (like logging on, program execution, search/query operations)
  case E
}
