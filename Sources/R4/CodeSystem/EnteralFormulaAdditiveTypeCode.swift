//
//  EnteralFormulaAdditiveTypeCode.swift
//  FHIRKit
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
 EnteralFormulaAdditiveType: Codes for the type of modular component such as protein, carbohydrate or fiber to be
 provided in addition to or mixed with the base formula. This value set is provided as a suggestive example.
 
 URL: http://terminology.hl7.org/CodeSystem/entformula-additive
 ValueSet: http://hl7.org/fhir/ValueSet/entformula-additive
 */
public enum EnteralFormulaAdditiveTypeCode: String, FHIRKitPrimitiveType {
  /// Modular lipid enteral formula component
  case lipid
  
  /// Modular protein enteral formula component
  case protein
  
  /// Modular carbohydrate enteral formula component
  case carbohydrate
  
  /// Modular fiber enteral formula component
  case fiber
  
  /// Added water
  case water
}
