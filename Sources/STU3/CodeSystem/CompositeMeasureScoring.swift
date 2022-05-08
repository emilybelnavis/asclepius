//
//  CompositeMeasureScoring.swift
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
 The composite scoring method of the measure.
 
 URL: http://terminology.hl7.org/CodeSystem/composite-measure-scoring
 ValueSet: http://hl7.org/fhir/ValueSet/composite-measure-scoring
 */
public enum CompositeMeasureScoring: String, AlexandriaHRMPrimitiveType {
  /// Opportunity scoring combines the scores from component measures by combining the numerators
  /// and denominators for each component
  case opportunity
  
  /// All-or-nothing scoring includes an individual in the numerator of the composite measure if they are in
  /// the numerators of all the component measures in which they are the denominator
  case allOrNothing = "all-or-nothing"
  
  /// Linear scoring gives an individual a score based on the number of numerators in which they appear
  case linear
  
  /// Weighted scoring gives an individual a score based on a weighted factor for each component
  /// numerator in which they appear
  case weighted
}
