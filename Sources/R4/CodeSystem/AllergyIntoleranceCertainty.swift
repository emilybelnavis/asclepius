//
//  AllergyIntoleranceCertainty.swift
//  Asclepius
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
 Statement about the degree of clinical certainty that a specific substance was the cause of the manifestation in a
 reaction event.
 
 URL: http://terminology.hl7.org/CodeSystem/reaction-event-certainty
 ValueSet: http://hl7.org/fhir/ValueSet/reaction-event-certainty
 */
public enum AllergyIntoleranceCertainty: String, AsclepiusPrimitiveType {
  /// There is a low level of clinical certainty that the reaction was caused by the identified substance.
  case unlikely
  
  /// There is a high level of clinical certainty that the reaction was caused by the identified substance
  case likely
  
  /// There is a very high level of clinical certainty that the reaction was due to the identified substance,
  /// which may include clinical evidence by testing or re-challenge
  case confirmed
  
  /// The clinical certainty that the reaction was caused by the identified substance is unknown. It is an
  /// explicit assertation that certainty is not known.
  case unknown
}
