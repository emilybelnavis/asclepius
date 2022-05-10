//
//  ContractContentDerivationCodes.swift
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
 This is an example set of Content Derivative type codes, which represent the minimal content derived from the basal
 information source at a specific stage in its lifecycle, which is sufficient to manage that source information, for
 example, in a repository, registry, processes and workflows, for making access control decisions, and providing query
 responses.
 
 URL: http://terminology.hl7.org/CodeSystem/contract-content-derivative
 ValueSet: http://hl7.org/fhir/ValueSet/contract-content-derivative
 */
public enum ContractContentDerivationCodes: String, AsclepiusPrimitiveType {
  
    /// Content derivative that conveys sufficient information needed to register the source basal content from which it
    /// is derived.  This derivative content may be used to register the basal content as it changes status in its
    /// lifecycle.  For example, content registration may occur when the basal content is created, updated, inactive, or
    /// deleted.
  case registration
  
    /// A content derivative that conveys sufficient information to locate and retrieve the content.
  case retrieval
  
    /// Content derivative that has less than full fidelity to the basal information source from which it was
    /// 'transcribed'. It provides recipients with the full content representation they may require for compliance
    /// purposes, and typically include a reference to or an attached unstructured representation for recipients needing
    /// an exact copy of the legal agreement.
  case statement
  
    /// A Content Derivative that conveys sufficient information to determine the authorized entities with which the
    /// content may be shared.
  case shareable
}
