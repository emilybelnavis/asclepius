//
//  RequestResourceType.swift
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
 A list of all the request resource types defined in this version of the FHIR specification.
 
 URL: http://hl7.org/fhir/request-resource-types
 ValueSet: http://hl7.org/fhir/ValueSet/request-resource-types
 */
public enum RequestResourceType: String, FHIRKitPrimitiveType {
  /// A booking of a healthcare event among patient(s), practitioner(s), related person(s) and/or device(s) for a
  /// specific date/time. This may result in one or more Encounter(s).
  case appointment = "Appointment"
  
  /// A reply to an appointment request for a patient and/or practitioner(s), such as a confirmation or rejection.
  case appointmentResponse = "AppointmentResponse"
  
  /// Healthcare plan for patient or group.
  case carePlan = "CarePlan"
  
  /// Claim, Pre-determination or Pre-authorization.
  case claim = "Claim"
  
  /// A request for information to be sent to a receiver.
  case communicationRequest = "CommunicationRequest"
  
  /// Legal Agreement.
  case contract = "Contract"
  
  /// Medical device request.
  case deviceRequest = "DeviceRequest"
  
  /// Enrollment request.
  case enrollmentRequest = "EnrollmentRequest"
  
  /// Guidance or advice relating to an immunization.
  case immunizationRecommendation = "ImmunizationRecommendation"
  
  /// Ordering of medication for patient or group.
  case medicationRequest = "MedicationRequest"
  
  /// Diet, formula or nutritional supplement request.
  case nutritionOrder = "NutritionOrder"
  
  /// A record of a request for service such as diagnostic investigations, treatments, or operations to be performed.
  case serviceRequest = "ServiceRequest"
  
  /// Request for a medication, substance or device.
  case supplyRequest = "SupplyRequest"
  
  /// A task to be performed.
  case task = "Task"
  
  /// Prescription for vision correction products for a patient.
  case visionPrescription = "VisionPrescription"
}
