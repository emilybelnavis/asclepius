//
//  AdmitSource.swift
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

public enum AdmitSource: String, FHIRKitPrimitiveType {
  /// The patient has been transferred from another hospital for this encounter
  case hospTrans = "hosp-trans"
  
  /// The patient has been transferred from the emergency department within the hospital. This is typically
  /// used in the transition to an inpatient encounter
  case emd
  
  /// The patient has been transferred from an outpatient department within the hospital
  case outp
  
  /// The patient is a newborn and the encounter will track the baby related activities (as opposed to the
  /// Mother's encounter - that may be associated using the newborn encounters partof property)
  case born
  
  /// The patient has been admitted due to a referral from a General Practitioner
  case gp
  
  /// The patient has been admitted due to a referral from a Specialist
  case mp
  
  /// The patient has been transferred from a nursing home
  case nursing
  
  /// The patient has been transferred from psychiatric facility
  case psych
  
  /// The patient has been transferred from a rehabilitation facility or clinic
  case rehab
  
  /// The patient has been admitted from a source otherwise not specified here
  case other
}
