//
//  UsageContextType.swift
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
 A code that specifies a type of context being specified by a usage context.
 
 URL: http://terminology.hl7.org/CodeSystem/usage-context-type
 ValueSet: http://hl7.org/fhir/ValueSet/usage-context-type
 */
public enum UsageContextType: String, FHIRKitPrimitiveType {
  /// The gender of the patient. For this context type, appropriate values can be found in the
  /// http://hl7.org/fhir/ValueSet/administrative-gender value set.
  case gender
  
  /// The age of the patient. For this context type, the value could be a range that specifies the applicable ages or
  /// a code from an appropriate value set such as the MeSH value set
  /// http://terminology.hl7.org/ValueSet/v3-AgeGroupObservationValue.
  case age
  
  /// The clinical concept(s) addressed by the artifact. For example, disease, diagnostic test interpretation,
  /// medication ordering as in http://hl7.org/fhir/ValueSet/condition-code.
  case focus
  
  /// The clinical specialty of the context in which the patient is being treated - For example, PCP, Patient,
  /// Cardiologist, Behavioral Professional, Oral Health Professional, Prescriber, etc... taken from a specialty value
  /// set such as the NUCC Health Care provider taxonomy value set http://hl7.org/fhir/ValueSet/provider-taxonomy.
  case user
  
  /// The settings in which the artifact is intended for use. For example, admission, pre-op, etc. For example, the
  /// ActEncounterCode value set http://terminology.hl7.org/ValueSet/v3-ActEncounterCode.
  case workflow
  
  /// The context for the clinical task(s) represented by this artifact. For example, this could be any task context
  /// represented by the HL7 ActTaskCode value set http://terminology.hl7.org/ValueSet/v3-ActTaskCode. General
  /// categories include: order entry, patient documentation and patient information review.
  case task
  
  /// The venue in which an artifact could be used. For example, Outpatient, Inpatient, Home, Nursing home. The code
  /// value may originate from the HL7 ServiceDeliveryLocationRoleType value set
  /// (http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType).
  case venue
  
  /// The species to which an artifact applies. For example, SNOMED - 387961004 | Kingdom Animalia (organism).
  case species
  
  /// A program/project of work for which this artifact is applicable.
  case program
}
