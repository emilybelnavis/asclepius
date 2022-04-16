//
//  ContractContentDerivationCodes.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

/**
 This is an example set of Content Derivative type codes, which represent the minimal content derived from the basal
 information source at a specific stage in its lifecycle, which is sufficient to manage that source information, for
 example, in a repository, registry, processes and workflows, for making access control decisions, and providing query
 responses.
 
 URL: http://terminology.hl7.org/CodeSystem/contract-content-derivative
 ValueSet: http://hl7.org/fhir/ValueSet/contract-content-derivative
 */
public enum ContractContentDerivationCodes: String, FHIRKitPrimitiveType {
  
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
