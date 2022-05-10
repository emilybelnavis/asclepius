//
//  ContractDataMeaning.swift
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
 How a resource reference is interpreted when evaluating contract offers.
 
 URL: http://terminology.hl7.org/CodeSystem/contract-data-meaning
 ValueSet: http://hl7.org/fhir/ValueSet/contract-data-meaning
 */
public enum ContractDataMeaning: String, AsclepiusPrimitiveType {
  /// The consent applies directly to the instance of the resouce.
  case instance
  
  /// The consent applies directly to the instance of the resource and instances it refers to.
  case related
  
  /// The consent applies directly to the instance of the resource and instances that refer to it
  case dependents
  
  /// The consent applies to instances of resources that are authored by
  case authoredby
}
