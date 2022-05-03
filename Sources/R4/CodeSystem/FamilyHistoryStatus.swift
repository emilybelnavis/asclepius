//
//  FamilyHistoryStatus.swift
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
 A code that identifies the status of the family history record.
 
 URL: http://hl7.org/fhir/history-status
 ValueSet: http://hl7.org/fhir/ValueSet/history-status
 */
public enum FamilyHistoryStatus: String, FHIRKitPrimitiveType {
  /// Some health information is known and captured, but not complete - see notes for details.
  case partial
  
  /// All available related health information is captured as of the date (and possibly time) when the family member
  /// history was taken.
  case completed
  
  /// This instance should not have been part of this patient's medical record.
  case enteredInError = "entered-in-error"
  
  /// Health information for this family member is unavailable/unknown.
  case healthUnknown = "health-unknown"
}
