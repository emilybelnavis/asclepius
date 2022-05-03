//
//  DischargeDisposition.swift
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
 This value set defines a set of codes that can be used to where the patient left the hospital.
 
 URL: http://terminology.hl7.org/CodeSystem/discharge-disposition
 ValueSet: http://hl7.org/fhir/ValueSet/encounter-discharge-disposition
 */
public enum DischargeDisposition: String, FHIRKitPrimitiveType {
  /// The patient was dicharged and has indicated that they are going to return home afterwards.
  case home
  
  /// The patient was discharged and has indicated that they are going to return home afterwards, but not the
  /// patient's home - e.g. a family member's home.
  case altHome = "alt-home"
  
  /// The patient was transferred to another healthcare facility.
  case otherHcf = "other-hcf"
  
  /// The patient has been discharged into palliative care.
  case hosp
  
  /// The patient has been discharged into long-term care where is likely to be monitored through an ongoing episode-
  /// of-care.
  case long
  
  /// The patient self discharged against medical advice.
  case aadvice
  
  /// The patient has deceased during this encounter.
  case exp
  
  /// The patient has been transferred to a psychiatric facility.
  case psy
  
  /// The patient was discharged and is to receive post acute care rehabilitation services.
  case rehab
  
  /// The patient has been discharged to a skilled nursing facility for the patient to receive additional care.
  case snf
  
  /// The discharge disposition has not otherwise defined.
  case oth
}
