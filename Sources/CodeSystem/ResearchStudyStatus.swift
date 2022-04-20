//
//  ResearchStudyStatus.swift
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
 Codes that convey the current status of the research study.
 
 URL: http://hl7.org/fhir/research-study-status
 ValueSet: http://hl7.org/fhir/ValueSet/research-study-status
 */
public enum ResearchStudyStatus: String, FHIRKitPrimitiveType {
  /// Study is opened for accrual.
  case active
  
  /// Study is completed prematurely and will not resume; patients are no longer examined nor treated.
  case administrativelyCompleted = "administratively-completed"
  
  /// Protocol is approved by the review board.
  case approved
  
  /// Study is closed for accrual; patients can be examined and treated.
  case closedToAccrual = "closed-to-accrual"
  
  /// Study is closed to accrual and intervention, i.e. the study is closed to enrollment, all study subjects have
  /// completed treatment or intervention but are still being followed according to the primary objective of the
  /// study.
  case closedToAccrualAndIntervention = "closed-to-accrual-and-intervention"
  
  /// Study is closed to accrual and intervention, i.e. the study is closed to enrollment, all study subjects have
  /// completed treatment
  /// or intervention but are still being followed according to the primary objective of the study.
  case completed
  
  /// Protocol was disapproved by the review board.
  case disapproved
  
  /// Protocol is submitted to the review board for approval.
  case inReview = "in-review"
  
  /// Study is temporarily closed for accrual; can be potentially resumed in the future; patients can be examined and
  /// treated.
  case temporarilyClosedToAccrual = "temporarily-closed-to-accrual"
  
  /// Study is temporarily closed for accrual and intervention and potentially can be resumed in the future.
  case temporarilyClosedToAccrualAndIntervention = "temporarily-closed-to-accrual-and-intervention"
  
  /// Protocol was withdrawn by the lead organization.
  case withdrawn
}
