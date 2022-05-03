//
//  ConsentCategoryCodes.swift
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
 This value set includes sample Consent Directive Type codes, including several consent directive related LOINC codes;
 HL7 VALUE SET: ActConsentType(2.16.840.1.113883.1.11.19897); examples of US realm consent directive legal descriptions
 and references to online and/or downloadable forms such as the SSA-827 Authorization to Disclose Information to the
 Social Security Administration; and other anticipated consent directives related to participation in a clinical trial,
 medical procedures, reproductive procedures; health care directive (Living Will); advance directive, do not resuscitate
 (DNR); Physician Orders for Life-Sustaining Treatment (POLST)
 
 URL: http://terminology.hl7.org/CodeSystem/consentcategorycodes
 */
public enum ConsentCategoryCodes: String, FHIRKitPrimitiveType {
  /// Any instuctions, writetn or given verbally by a patient to a health care provider in anticipation of
  /// potential need for medical treatment. [2005 Honor My Wishes]
  case acd
  
  /// A legal document, signed by both the patient and their provider, stating a desire not to have CPR
  /// initiated in case of a cardiac event. Note: This form was replaced in 2003 with the Physician Orders
  /// for Life-Sustaining Treatment [POLST]
  case dnr
  
  /// Opt-in to disclosure of health information for emergency only consent directive. Comment: This general consent
  /// directive specifically limits disclosure of health information for purpose of emergency treatment. Additional
  /// parameters may further limit the disclosure to specific users, roles, duration, types of information, and impose
  /// uses obligations. [ActConsentDirective (2.16.840.1.113883.1.11.20425)]
  case emrgonly
  
  /// Patient's document telling patient's health care provider what the patient wants or does not want if the patient
  /// is diagnosed as being terminally ill and in a persistent vegetative state or in a permanently unconscious
  /// condition.[2005 Honor My Wishes]
  case hcd
  
  /// Acknowledgement of custodian notice of privacy practices. Usage Notes: This type of consent directive
  /// acknowledges a custodian's notice of privacy practices including its permitted collection, access, use and
  /// disclosure of health information to users and for purposes of use specified. [ActConsentDirective
  /// (2.16.840.1.113883.1.11.20425)]
  case npp
  
  /// The Physician Order for Life-Sustaining Treatment form records a person's health care wishes for end of life
  /// emergency treatment and translates them into an order by the physician. It must be reviewed and signed by both
  /// the patient and the physician, Advanced Registered Nurse Practitioner or Physician Assistant. [2005 Honor My
  /// Wishes] Comment: Opt-in Consent Directive with restrictions.
  case polst
  
  /// Consent to have healthcare information in an electronic health record accessed for research purposes. [VALUE
  /// SET: ActConsentType (2.16.840.1.113883.1.11.19897)]
  case research
  
  /// Consent to have de-identified healthcare information in an electronic health record that is accessed for
  /// research purposes, but without consent to re-identify the information under any circumstance. [VALUE SET:
  /// ActConsentType (2.16.840.1.113883.1.11.19897)
  case rsdid
  
  /// Consent to have de-identified healthcare information in an electronic health record that is accessed for
  /// research purposes re-identified under specific circumstances outlined in the consent. [VALUE SET: ActConsentType
  /// (2.16.840.1.113883.1.11.19897)]
  case rsreid
}
