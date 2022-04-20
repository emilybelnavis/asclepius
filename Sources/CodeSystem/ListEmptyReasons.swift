//
//  ListEmptyReasons.swift
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
 General reasons for a list to be empty. Reasons are either related to a summary list (i.e. problem or medication list)
 or to a workflow related list (i.e. consultation list).
 
 URL: http://terminology.hl7.org/CodeSystem/list-empty-reason
 ValueSet: http://hl7.org/fhir/ValueSet/list-empty-reason
 */
public enum ListEmptyReasons: String, FHIRKitPrimitiveType {
  /// Clinical judgment that there are no known items for this list after reasonable investigation. Note that this a
  /// positive statement by a clinical user, and not a default position asserted by a computer system in the lack of
  /// other information. Example uses:  * For allergies: the patient or patient's agent/guardian has asserted that
  /// he/she is not aware of any allergies (NKA - nil known allergies)  * For medications: the patient or patient's
  /// agent/guardian has asserted that the patient is known to be taking no medications  * For diagnoses, problems and
  /// procedures: the patient or patient's agent/guardian has asserted that there is no known event to record.
  case nilknown
  
  /// The investigation to find out whether there are items for this list has not occurred.
  case notasked
  
  /// The content of the list was not provided due to privacy or confidentiality concerns. Note that it should not be
  /// assumed that this means that the particular information in question was withheld due to its contents - it can
  /// also be a policy decision.
  case withheld
  
  /// Information to populate this list cannot be obtained; e.g. unconscious patient.
  case unavailable
  
  /// The work to populate this list has not yet begun.
  case notstarted
  
  /// This list has now closed or has ceased to be relevant or useful.
  case closed
}
