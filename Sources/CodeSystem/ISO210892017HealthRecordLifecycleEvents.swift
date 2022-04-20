//
//  ISO210892017HealthRecordLifecycleEvents.swift
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
 Attached is vocabulary for the 27 record lifecycle events, as per ISO TS 21089-2017, Health Informatics - Trusted End-
 to-End Information Flows, Section 3, Terms and Definitions (2017, at ISO Central Secretariat, passed ballot and ready
 for publication).  This will also be included in the FHIR EHR Record Lifecycle Event Implementation Guide, balloted and
 (to be) published with FHIR STU-3.
 
 URL: http://terminology.hl7.org/CodeSystem/iso-21089-lifecycle
 */
public enum ISO210892017HealthRecordLifecycleEvents: String, FHIRKitPrimitiveType {
  /// Occurs when an agent causes the system to obtain and open a record entry for inspection or review.
  case access
  
  /// Occurs when an agent causes the system to tag or otherwise indicate special access management and suspension of
  /// record entry deletion/destruction, if deemed relevant to a lawsuit or which are reasonably anticipated to be
  /// relevant or to fulfill organizational policy under the legal doctrine of “duty to preserve”.
  case hold
  
  /// Occurs when an agent makes any change to record entry content currently residing in storage considered permanent
  /// (persistent).
  case amend
  
  /// Occurs when an agent causes the system to create and move archive artifacts containing record entry content,
  /// typically to long-term offline storage.
  case archive
  
  /// Occurs when an agent causes the system to capture the agent’s digital signature (or equivalent indication)
  /// during formal validation of record entry content.
  case attest
  
  /// Occurs when an agent causes the system to decode record entry content from a cipher.
  case decrypt
  
  /// Occurs when an agent causes the system to scrub record entry content to reduce the association between a set of
  /// identifying data and the data subject in a way that might or might not be reversible.
  case deidentify
  
  /// Occurs when an agent causes the system to tag record entry(ies) as obsolete, erroneous or untrustworthy, to warn
  /// against its future use.
  case deprecate
  
  /// Occurs when an agent causes the system to permanently erase record entry content from the system.
  case destroy
  
  /// Occurs when an agent causes the system to release, transfer, provision access to, or otherwise divulge record
  /// entry content.
  case disclose
  
  /// Occurs when an agent causes the system to encode record entry content in a cipher.
  case encrypt
  
  /// Occurs when an agent causes the system to selectively pull out a subset of record entry content, based on
  /// explicit criteria.
  case extract
  
  /// Occurs when an agent causes the system to connect related record entries.
  case link
  
  /// Occurs when an agent causes the system to combine or join content from two or more record entries, resulting in
  /// a single logical record entry.
  case merge
  
  /// Occurs when an agent causes the system to: a) initiate capture of potential record content, and b) incorporate
  /// that content into the storage considered a permanent part of the health record.
  case originate
  
  /// Occurs when an agent causes the system to remove record entry content to reduce the association between a set of
  /// identifying data and the data subject in a way that may be reversible.
  case pseudonymize
  
  /// Occurs when an agent causes the system to recreate or restore full status to record entries previously deleted
  /// or deprecated.
  case reactivate
  
  /// Occurs when an agent causes the system to a) initiate capture of data content from elsewhere, and b) incorporate
  /// that content into the storage considered a permanent part of the health record.
  case receive
  
  /// Occurs when an agent causes the system to restore information to data that allows identification of information
  /// source and/or information subject.
  case reidentify
  
  /// Occurs when an agent causes the system to remove a tag or other cues for special access management had required
  /// to fulfill organizational policy under the legal doctrine of “duty to preserve”.
  case unhold
  
  /// Occurs when an agent causes the system to produce and deliver record entry content in a particular form and
  /// manner.
  case report
  
  /// Occurs when an agent causes the system to recreate record entries and their content from a previous created
  /// archive artefact.
  case restore
  
  /// Occurs when an agent causes the system to change the form, language or code system used to represent record
  /// entry content.
  case transform
  
  /// Occurs when an agent causes the system to send record entry content from one (EHR/PHR/other) system to another.
  case transmit
  
  /// Occurs when an agent causes the system to disconnect two or more record entries previously connected, rendering
  /// them separate (disconnected) again.
  case unlink
  
  /// Occurs when an agent causes the system to reverse a previous record entry merge operation, rendering them
  /// separate again.
  case unmerge
  
  /// Occurs when an agent causes the system to confirm compliance of data or data objects with regulations,
  /// requirements, specifications, or other imposed conditions based on organizational policy.
  case verify
}
