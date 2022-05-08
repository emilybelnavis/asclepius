//
//  CertaintySubcomponentRating.swift
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
 The quality rating of the subcomponent of a quality of evidence rating.
 
 URL: http://terminology.hl7.org/CodeSystem/certainty-subcomponent-rating
 ValueSet: http://hl7.org/fhir/ValueSet/certainty-subcomponent-rating
 */
public enum CertaintySubcomponentRating: String, AlexandriaHRMPrimitiveType {
  /// No change to quality rating
  case noChange = "no-change"
  
  /// Reduce quality rating by 1
  case downcode1
  
  /// Reduce quality rating by 2
  case downcode2
  
  /// Reduce quality rating by 3
  case downcode3
  
  /// Increase quality rating by 1
  case upcode1
  
  /// Increase quality rating by 2
  case upcode2
  
  /// No serious concern
  case noConcern = "no-concern"
  
  /// Serious concern
  case seriousConcern = "serious-concern"
  
  /// Critical concern
  case criticalConcern = "critical-concern"
  
  /// Possible reason for increasing quality rating was checked and found to be present
  case present
  
  /// Possible reason for increasing quality rating was checked and found to be absent
  case absent
}
