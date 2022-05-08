//
//  ExpansionParameterSource.swift
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
 Declares what the source of a parameter is.
 
 URL: http://terminology.hl7.org/CodeSystem/expansion-parameter-source
 ValueSet: http://hl7.org/fhir/ValueSet/expansion-parameter-source
 */
public enum ExpansionParameterSource: String, AlexandriaHRMPrimitiveType {
  /// The parameter was supplied by the client in the $expand request.
  case input
  
  /// The parameter was added by the expansion engine on the server.
  case server
  
  /// The parameter was added from one the code systems used in the $expand operation.
  case codesystem
}
