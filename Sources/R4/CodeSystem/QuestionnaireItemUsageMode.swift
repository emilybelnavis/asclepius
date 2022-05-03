//
//  QuestionnaireItemUsageMode.swift
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
 Identifies the modes of usage of a questionnaire that should enable a particular questionnaire item.
 
 URL: http://terminology.hl7.org/CodeSystem/questionnaire-usage-mode
 ValueSet: http://hl7.org/fhir/ValueSet/questionnaire-usage-mode
 */
public enum QuestionnaireItemUsageMode: String, FHIRKitPrimitiveType {
  /// Render the item regardless of usage mode.
  case captureDisplay = "capture-display"
  
  /// Render the item only when capturing data.
  case capture
  
  /// Render the item only when displaying a completed form.
  case display
  
  /// Render the item only when displaying a completed form and the item has been answered (or has child items that
  /// have been answered).
  case displayNonEmpty = "display-non-empty"
  
  /// Render the item when capturing data or when displaying a completed form and the item has been answered (or has
  /// child items that have been answered).
  case captureDisplayNonEmpty = "capture-display-non-empty"
}
