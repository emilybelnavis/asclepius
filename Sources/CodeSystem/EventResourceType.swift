//
//  EventResourceType.swift
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
 A list of all the event resource types defined in this version of the FHIR specification.
 
 URL: http://hl7.org/fhir/event-resource-types
 ValueSet: http://hl7.org/fhir/ValueSet/event-resource-types
 */
public enum EventResourceType: String, FHIRKitPrimitiveType {
  /// Item containing charge code(s) associated with the provision of healthcare provider products.
  case chargeItem = "ChargeItem"
  
  /// Remittance resource.
  case claimResponse = "ClaimResponse"

  /// A clinical assessment performed when planning treatments and management strategies for a patient.
  case clinicalImpression = "ClinicalImpression"
  
  /// A record of information transmitted from a sender to a receiver.
  case communication = "Communication"
  
  /// A set of resources composed into a single coherent clinical statement with clinical attestation.
  case composition = "Composition"
  
  /// Detailed information about conditions, problems or diagnoses.
  case condition = "Condition"
  
  /// A healthcare consumer's policy choices to permits or denies recipients or roles to perform actions for specific
  /// purposes and periods of time.
  case consent = "Consent"
  
  /// Insurance or medical plan or a payment agreement.
  case coverage = "Coverage"
  
  /// Record of use of a device.
  case deviceUseStatement = "DeviceUseStatement"
  
  /// A Diagnostic report - a combination of request information, atomic results, images, interpretation, as well as
  /// formatted reports.
  case diagnosticReport = "DiagnosticReport"
  
  /// A list that defines a set of documents.
  case documentManifest = "DocumentManifest"
  
  /// A reference to a document.
  case documentReference = "DocumentReference"
  
  /// An interaction during which services are provided to the patient.
  case encounter = "Encounter"
  
  /// EnrollmentResponse resource.
  case enrollmentResponse = "EnrollmentResponse"
  
  /// An association of a Patient with an Organization and  Healthcare Provider(s) for a period of time that the
  /// Organization assumes some level of responsibility.
  case episodeOfCare = "EpisodeOfCare"
  
  /// Explanation of Benefit resource.
  case explanationOfBenefit = "ExplanationOfBenefit"
  
  /// Information about patient's relatives, relevant for patient.
  case familyMemberHistory = "FamilyMemberHistory"
  
  /// The formal response to a guidance request.
  case guidanceResponse = "GuidanceResponse"
  
  /// A set of images produced in single study (one or more series of references images).
  case imagingStudy = "ImagingStudy"
  
  /// Immunization event information.
  case immunization = "Immunization"
  
  /// Results of a measure evaluation.
  case measureReport = "MeasureReport"
  
  /// A photo, video, or audio recording acquired or used in healthcare. The actual content may be inline or provided
  /// by direct reference.
  case media = "Media"
  
  /// Administration of medication to a patient.
  case medicationAdministration = "MedicationAdministration"

  /// Dispensing a medication to a named patient.
  case medicationDispense = "MedicationDispense"
  
  /// Record of medication being taken by a patient.
  case medicationStatement = "MedicationStatement"
  
  /// Measurements and simple assertions.
  case observation = "Observation"
  
  /// PaymentNotice request.
  case paymentNotice = "PaymentNotice"
  
  /// PaymentReconciliation resource.
  case paymentReconciliation = "PaymentReconciliation"
  
  /// An action that is being or was performed on a patient.
  case procedure = "Procedure"
  
  /// ProcessResponse resource.
  case processResponse = "ProcessResponse"
  
  /// A structured set of questions and their answers.
  case questionnaireResponse = "QuestionnaireResponse"
  
  /// Potential outcomes for a subject with likelihood.
  case riskAssessment = "RiskAssessment"
  
  /// Delivery of bulk Supplies.
  case supplyDelivery = "SupplyDelivery"
  
  /// A task to be performed.
  case task = "Task"
}
