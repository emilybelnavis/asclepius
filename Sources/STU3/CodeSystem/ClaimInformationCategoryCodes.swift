//
//  ClaimInformationCategoryCodes.swift
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
 This value set includes sample Information Category codes.
 
 URL: http://terminology.hl7.org/CodeSystem/claiminformationcategory
 ValueSet: http://hl7.org/fhir/ValueSet/claim-informationcategory
 */
public enum ClaimInformationCategoryCodes: String, AsclepiusPrimitiveType {
  /// Codes conveying additional situation and condition information
  case info
  
  /// Discharge status and discharge to locations
  case discharge
  
  /// Period, start or end dates of aspects of the Condition
  case onset
  
  /// Nature and date of the related event (e.g. Last exam, service, X-ray, etc...)
  case related
  
  /// Insurance policy exceptions
  case exception
  
  /// Materials being forwarded (e.g. models, molds, images, documents, etc...)
  case material
  
  /// Materials attached (e.g. images, documents, and resources)
  case attachment
  
  /// Teeth which are missing for any reason (e.g. prior extraction, never developed)
  case missingtooth
  
  /// The type of prosthesis and date of supply if previously supplied a prosthesis
  case prosthesis
  
  /// Other information idenfied by the type system
  case other
  
  /// An indication that the patient was hospitalized, the period if known (otherwise a yes/no)
  case hospitalized
  
  /// An indication that the patient was unable to work, the period if known (otherwise a yes/no)
  case employmentimpacted
  
  /// The external cause of an illness or injury
  case externalcause
  
  /// The reason for the patient visit
  case patientreasonforvisit
}
