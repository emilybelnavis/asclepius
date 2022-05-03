//
//  MedicationRequestCourseOfTherapyCodes.swift
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
 MedicationRequest Course of Therapy Codes
 
 URL: http://terminology.hl7.org/CodeSystem/medicationrequest-course-of-therapy
 ValueSet: http://hl7.org/fhir/ValueSet/medicationrequest-course-of-therapy
 */
public enum MedicationRequestCourseOfTherapyCodes: String, FHIRKitPrimitiveType {
  /// A medication which is expected to be continued beyond the present order and which the patient should be assumed
  /// to be taking unless explicitly stopped.
  case continuous
  
  /// A medication which the patient is only expected to consume for the duration of the current order and which is
  /// not expected to be renewed.
  case acute
  
  /// A medication which is expected to be used on a part time basis at certain times of the year
  case seasonal
}
