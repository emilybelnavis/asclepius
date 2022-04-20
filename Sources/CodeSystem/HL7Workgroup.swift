//
//  HL7Workgroup.swift
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
 An HL7 administrative unit that owns artifacts in the FHIR specification.
 
 URL: http://terminology.hl7.org/CodeSystem/hl7-work-group
 ValueSet: http://hl7.org/fhir/ValueSet/hl7-work-group
 */
public enum HL7Workgroup: String, FHIRKitPrimitiveType {
  /// Community Based Collaborative Care (http://www.hl7.org/Special/committees/cbcc/index.cfm).
  case cbcc
  
  /// Clinical Decision Support (http://www.hl7.org/Special/committees/dss/index.cfm).
  case cds
  
  /// Clinical Quality Information (http://www.hl7.org/Special/committees/cqi/index.cfm).
  case cqi
  
  /// Clinical Genomics (http://www.hl7.org/Special/committees/clingenomics/index.cfm).
  case cg
  
  /// Health Care Devices (http://www.hl7.org/Special/committees/healthcaredevices/index.cfm).
  case dev
  
  /// Electronic Health Records (http://www.hl7.org/special/committees/ehr/index.cfm).
  case ehr
  
  /// FHIR Infrastructure (http://www.hl7.org/Special/committees/fiwg/index.cfm).
  case fhir
  
  /// Financial Management (http://www.hl7.org/Special/committees/fm/index.cfm).
  case fm
  
  /// Health Standards Integration (http://www.hl7.org/Special/committees/hsi/index.cfm).
  case hsi
  
  /// Imaging Integration (http://www.hl7.org/Special/committees/imagemgt/index.cfm).
  case ii
  
  /// Infrastructure And Messaging (http://www.hl7.org/special/committees/inm/index.cfm).
  case inm
  
    /// Implementable Technology Specifications (http://www.hl7.org/special/committees/xml/index.cfm).
  case its
  
  /// Modeling and Methodology (http://www.hl7.org/Special/committees/mnm/index.cfm).
  case mnm
  
  /// Orders and Observations (http://www.hl7.org/Special/committees/orders/index.cfm).
  case oo
  
  /// Patient Administration (http://www.hl7.org/Special/committees/pafm/index.cfm).
  case pa
  
  /// Patient Care (http://www.hl7.org/Special/committees/patientcare/index.cfm).
  case pc
  
  /// Public Health and Emergency Response (http://www.hl7.org/Special/committees/pher/index.cfm).
  case pher
  
  /// Pharmacy (http://www.hl7.org/Special/committees/medication/index.cfm).
  case phx
  
  /// Biomedical Research and Regulation (http://www.hl7.org/Special/committees/rcrim/index.cfm).
  case brr
  
  /// Structured Documents (http://www.hl7.org/Special/committees/structure/index.cfm).
  case sd
  
  /// Security (http://www.hl7.org/Special/committees/secure/index.cfm).
  case sec
  
  /// US Realm Taskforce (http://www.hl7.org/Special/committees/usrealm/index.cfm).
  case us
  
  /// Vocabulary (http://www.hl7.org/Special/committees/Vocab/index.cfm).
  case vocab
  
  /// Application Implementation and Design (http://www.hl7.org/Special/committees/java/index.cfm).
  case aid
}
