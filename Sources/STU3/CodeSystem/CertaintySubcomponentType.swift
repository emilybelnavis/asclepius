//
//  CertaintySubcomponentType.swift
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
 The subcomponent classification of quality of evidence rating systems.
 
 URL: http://terminology.hl7.org/CodeSystem/certainty-subcomponent-type
 ValueSet: http://hl7.org/fhir/ValueSet/certainty-subcomponent-type
 */
public enum CertaintySubcomponentType: String, AlexandriaHRMPrimitiveType {
  /// Methodological concerns reducing internal validity
  case riskOfBias = "RiskOfBias"
  
  /// Concerns that findings are not similar to support certainty
  case inconsistency = "Inconsistency"
  
  /// Concerns reducing external validity
  case indirectness = "Indirectness"
  
  /// High quality evidence
  case imprecision = "Imprecision"
  
  /// Likelyhood that what is published misprepresents what is available to publish
  case publicationBias = "PublicationBias"
  
  /// Higher certainty due to dose response relationship
  case doseResponseGradient = "DoseResponseGradient"
  
  /// Higher certainty due to risk of bias in opposite direction
  case plausibleConfounding = "PlausibleConfounding"
  
  /// Higher certainty due to large effect size
  case largeEffect = "LargeEffect"
}
