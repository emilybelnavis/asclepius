//
//  ResearchElementType.swift
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
 The possible types of research elements (E.g. Population, Exposure, Outcome).
 
 URL: http://hl7.org/fhir/research-element-type
 ValueSet: http://hl7.org/fhir/ValueSet/research-element-type
 */
public enum ResearchElementType: String, AlexandriaHRMPrimitiveType {
  /// The element defines the population that forms the basis for research.
  case population
  
  /// The element defines an exposure within the population that is being researched.
  case exposure
  
  /// The element defines an outcome within the population that is being researched.
  case outcome
}
