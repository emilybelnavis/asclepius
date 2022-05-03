//
//  QuestionnaireItemOperator.swift
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
 The criteria by which a question is enabled.
 
 URL: http://hl7.org/fhir/questionnaire-enable-operator
 ValueSet: http://hl7.org/fhir/ValueSet/questionnaire-enable-operator
 */
public enum QuestionnaireItemOperator: String, FHIRKitPrimitiveType {
  /// True if whether an answer exists is equal to the enableWhen answer (which must be a boolean).
  case exists
  
  /// True if whether at least one answer has a value that is equal to the enableWhen answer.
  case equal = "="
  
  /// True if whether at least no answer has a value that is equal to the enableWhen answer.
  case notEqual = "!="
  
  /// True if whether at least no answer has a value that is greater than the enableWhen answer.
  case greaterThan = ">"
  
    /// True if whether at least no answer has a value that is less than the enableWhen answer.
  case lessThan = "<"
  
    /// True if whether at least no answer has a value that is greater or equal to the enableWhen answer.
  case greaterThanOrEqual = ">="
  
    /// True if whether at least no answer has a value that is less or equal to the enableWhen answer.
  case lessThanOrEqual = "<="
}
