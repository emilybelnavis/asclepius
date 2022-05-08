//
//  ConformanceExpectation.swift
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
 Indicates the degree of adherence to a specified behavior or capability expected for a system to be deemed conformant
 with a specification.
 
 URL: http://terminology.hl7.org/CodeSystem/conformance-expectation
 ValueSet: http://hl7.org/fhir/ValueSet/conformance-expectation
 */
public enum ConformanceExpectation: String, AlexandriaHRMPrimitiveType {
  /// Support for the specified capability is required to be considered conformant
  case SHALL
  
  /// Support for the specified capability is strongly encouraged and failure to support it should only
  /// occur after careful consideration
  case SHOULD
  
  /// Support for the specified capability is not necessary to be considered conformant and the
  /// requirement should be considered strictly optional
  case MAY
  
  /// Support for the specified capability is strongly discouraged and should only occur after careful
  ///  consideration
  case SHOULDNOT = "SHOULD-NOT"
}
