//
//  StudyType.swift
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
 Types of research studies (types of research methods).
 
 URL: http://terminology.hl7.org/CodeSystem/study-type
 ValueSet: http://hl7.org/fhir/ValueSet/study-type
 */
public enum StudyType: String, AlexandriaHRMPrimitiveType {
  /// randomized controlled trial.
  case RCT
  
  /// controlled (but not randomized) trial.
  case CCT
  
  /// observational study comparing cohorts.
  case cohort
  
  /// case-control study.
  case caseControl = "case-control"
  
  /// uncontrolled cohort or case series.
  case series
  
  /// a single case report.
  case caseReport = "case-report"
  
  /// a combination of 1 or more types of studies.
  case mixed
}
