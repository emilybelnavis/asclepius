//
//  ResearchSubjectStatus.swift
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
 Indicates the progression of a study subject through a study.
 
 URL: http://hl7.org/fhir/research-subject-status
 ValueSet: http://hl7.org/fhir/ValueSet/research-subject-status
 */
public enum ResearchSubjectStatus: String, FHIRKitPrimitiveType {
  /// An identified person that can be considered for inclusion in a study.
  case candidate
  
  /// A person that has met the eligibility criteria for inclusion in a study.
  case eligible
  
  /// A person is no longer receiving study intervention and/or being evaluated with tests and procedures according to
  /// the protocol, but they are being monitored on a protocol-prescribed schedule.
  case followUp = "follow-up"
  
  /// A person who did not meet one or more criteria required for participation in a study is considered to have
  /// failed screening or is ineligible for the study.
  case ineligible
  
  /// A person for whom registration was not completed.
  case notRegistered = "not-registered"
  
  /// A person that has ended their participation on a study either because their treatment/observation is complete or
  /// through not responding, withdrawal, non-compliance and/or adverse event.
  case offStudy = "off-study"
  
  /// A person that is enrolled or registered on a study.
  case onStudy = "on-study"
  
  /// The person is receiving the treatment or participating in an activity (e.g. yoga, diet, etc.) that the study is
  /// evaluating.
  case onStudyIntervention = "on-study-intervention"
  
  /// The subject is being evaluated via tests and assessments according to the study calendar, but is not receiving
  /// any intervention. Note that this state is study-dependent and might not exist in all studies.  A synonym for
  /// this is "short-term follow-up".
  case onStudyObservation = "on-study-observation"
  
  /// A person is pre-registered for a study.
  case pendingOnStudy = "pending-on-study"
  
  /// A person that is potentially eligible for participation in the study.
  case potentialCandidate = "potential-candidate"
  
  /// A person who is being evaluated for eligibility for a study.
  case screening
  
  /// The person has withdrawn their participation in the study before registration.
  case withdrawn
}
