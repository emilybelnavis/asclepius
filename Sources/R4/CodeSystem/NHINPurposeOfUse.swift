//
//  NHINPurposeOfUse.swift
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
 This value set is suitable for use with the provenance resource. It is derived from, but not compatible with, the HL7
 v3 Purpose of use Code system.
 
 URL: http://healthit.gov/nhin/purposeofuse
 ValueSet: http://hl7.org/fhir/ValueSet/nhin-purposeofuse
 */
public enum NHINPurposeOfUse: String, FHIRKitPrimitiveType {
  /// Treatment
  case TREATMENT
  
  /// Payment
  case PAYMENT
  
  /// Healthcare Operations
  case OPERATIONS
  
  /// System Administration
  case SYSADMIN
  
  /// Fraud detection
  case FRAUD
  
  /// Use or disclosure of Psychotherapy Notes
  case PSYCHOTHERAPY
  
  /// Use or disclosure by the covered entity for its own training programs
  case TRAINING
  
  /// Use or disclosure by the covered entity to defend itself in a legal action
  case LEGAL
  
  /// Marketing
  case MARKETING
  
  /// Use and disclosure for facility directories
  case DIRECTORY
  
  /// Disclose to a family member, other relative, or a close personal friend of the individual
  case FAMILY
  
  /// Uses and disclosures with the individual present.
  case PRESENT
  
  /// Permission cannot practicably be provided because of the individual's incapacity or an emergency.
  case EMERGENCY
  
  /// Use and disclosures for disaster relief purposes.
  case DISASTER
  
  /// Uses and disclosures for public health activities.
  case PUBLICHEALTH
  
  /// Disclosures about victims of abuse, neglect or domestic violence.
  case ABUSE
  
  /// Uses and disclosures for health oversight activities.
  case OVERSIGHT
  
  /// Disclosures for judicial and administrative proceedings.
  case JUDICIAL
  
  /// Disclosures for law enforcement purposes.
  case LAW
  
  /// Uses and disclosures about decedents.
  case DECEASED
  
  /// Uses and disclosures for cadaveric organ,  eye or tissue donation purposes
  case DONATION
  
  /// Uses and disclosures for research purposes.
  case RESEARCH
  
  /// Uses and disclosures to avert a serious threat to health or safety.
  case THREAT
  
  /// Uses and disclosures for specialized government functions.
  case GOVERNMENT
  
  /// Disclosures for workers' compensation.
  case WORKERSCOMP
  
  /// Disclosures for insurance or disability coverage determination
  case COVERAGE
  
  /// Request of the Individual
  case REQUEST
}
