//
//  QuestionnaireResponseStatus.swift
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
 Lifecycle status of the questionnaire response.
 
 URL: http://hl7.org/fhir/questionnaire-answers-status
 ValueSet: http://hl7.org/fhir/ValueSet/questionnaire-answers-status
 */
public enum QuestionnaireResponseStatus: String, FHIRKitPrimitiveType {
  /// This QuestionnaireResponse has been partially filled out with answers but changes or additions are still
  /// expected to be made to it.
  case inProgress = "in-progress"
  
  /// This QuestionnaireResponse has been filled out with answers and the current content is regarded as definitive.
  case completed
  
  /// This QuestionnaireResponse has been filled out with answers, then marked as complete, yet changes or additions
  /// have been made to it afterwards.
  case amended
  
  /// This QuestionnaireResponse was entered in error and voided.
  case enteredInError = "entered-in-error"
  
  /// This QuestionnaireResponse has been partially filled out with answers but has been abandoned. It is unknown
  /// whether changes or additions are expected to be made to it.
  case stopped
}
