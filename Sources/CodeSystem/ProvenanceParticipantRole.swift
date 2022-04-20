//
//  ProvenanceParticipantRole.swift
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
 The role that a provenance participant played
 
 URL: http://hl7.org/fhir/provenance-participant-role
 ValueSet: http://hl7.org/fhir/ValueSet/provenance-agent-role
 */
public enum ProvenanceParticipantRole: String, FHIRKitPrimitiveType {
  /// A person entering the data into the originating system
  case enterer
  
  /// A person, animal, organization or device that who actually and principally carries out the activity
  case performer
  
  /// A party that originates the resource and therefore has responsibility for the information given in the resource
  /// and ownership of this resource
  case author
  
    /// A person who verifies the correctness and appropriateness of activity
  case verifier
  
    /// The person authenticated the content and accepted legal responsibility for its content
  case legal
  
    /// A verifier who attests to the accuracy of the resource
  case attester
  
    /// A person who reported information that contributed to the resource
  case informant
  
    /// The entity that is accountable for maintaining a true an accurate copy of the original record
  case custodian
  
    /// A device that operates independently of an author on custodian's algorithms for data extraction of existing
    /// information for purpose of generating a new artifact.
  case assembler
  
    /// A device used by an author to record new information, which may also be used by the author to select existing
    /// information for aggregation with newly recorded information for the purpose of generating a new artifact.
  case composer
}
