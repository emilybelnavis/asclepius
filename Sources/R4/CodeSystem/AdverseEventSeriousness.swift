//
//  AdverseEventSeriousness.swift
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
 Overall seriousness of this event for the patient.
 
 URL: http://terminology.hl7.org/CodeSystem/adverse-event-seriousness
 ValueSet: http://hl7.org/fhir/ValueSet/adverse-event-seriousness
 */
public enum AdverseEventSeriousness: String, FHIRKitPrimitiveType {
  /// Non-serious
  case nonSerious = "Non-serious"
  
  /// Serious
  case serious = "Serious"
  
  /// Results in death
  case seriousResultsInDeath = "SeriousResultsInDeath"
  
  /// Is life-threatening
  case seriousIsLifeThreatening = "SeriousIsLifeThreatening"
  
  /// Requires inpatient hospitalization or causes prolongation of existing hospitalization
  case seriousResultsInHospitalization = "SeriousResultsInHospitalization"
  
  /// Results in persistent or significanat disability/incapacity
  case seriousResultsInDisability = "SeriousResultsInDisability"
  
  /// Is a congenital anomaly/birth defect
  case seriousIsBirthDefect = "SeriousIsBirthDefect"
  
  /// Requires intervention to prevent permanent impairment or damage
  /// (ex: an important medical event that requires medical judgement.)
  case seriousRequiresPreventImpairment = "SeriousRequiresPreventImpairment"
}
