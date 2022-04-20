//
//  EpisodeOfCareStatus.swift
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
 The status of the episode of care.
 
 URL: http://hl7.org/fhir/episode-of-care-status
 ValueSet: http://hl7.org/fhir/ValueSet/episode-of-care-status
 */
public enum EpisodeOfCareStatus: String, FHIRKitPrimitiveType {
  /// This episode of care is planned to start at the date specified in the period.start. During this status, an
  /// organization may perform assessments to determine if the patient is eligible to receive services, or be
  /// organizing to make resources available to provide care services.
  case planned
  
  /// This episode has been placed on a waitlist, pending the episode being made active (or cancelled).
  case waitlist
  
  /// This episode of care is current.
  case active
  
  /// This episode of care is on hold; the organization has limited responsibility for the patient (such as while on
  /// respite).
  case onhold
  
  /// This episode of care is finished and the organization is not expecting to be providing further care to the
  /// patient. Can also be known as "closed", "completed" or other similar terms.
  case finished
  
  /// The episode of care was cancelled, or withdrawn from service, often selected during the planned stage as the
  /// patient may have gone elsewhere, or the circumstances have changed and the organization is unable to provide the
  /// care. It indicates that services terminated outside the planned/expected workflow.
  case cancelled
  
  /// This instance should not have been part of this patient's medical record.
  case enteredInError = "entered-in-error"
}
