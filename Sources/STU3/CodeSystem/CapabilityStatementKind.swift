//
//  CapabilityStatementKind.swift
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
 How a capability statement is intended to be used.
 
 URL: http://hl7.org/fhir/capability-statement-kind
 ValueSet: http://hl7.org/fhir/ValueSet/capability-statement-kind
 */
public enum CapabilityStatementKind: String, AsclepiusPrimitiveType {
  /// The CapabilityStatement instance represents the present capabilities of a specific system instance.
  /// This is the kind returned by /metadata for a FHIR server end-point
  case instance
  
  /// The CapabilityStatement isntance represents the capabilities of a system of piece of software,
  /// independent of a particular installation.
  case capability
  
  /// The CapabilityStatement instance represents a set of requirements for other systems to meet;
  /// e.g. as part of an implementation guide of "request for proposal"
  case requirements
}
