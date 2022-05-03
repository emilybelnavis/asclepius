//
//  QuestionnaireItemType.swift
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
 Distinguishes groups from questions and display text and indicates data type for questions.
 
 URL: http://hl7.org/fhir/item-type
 ValueSet: http://hl7.org/fhir/ValueSet/item-type
 */
public enum QuestionnaireItemType: String, FHIRKitPrimitiveType {
  /// An item with no direct answer but should have at least one child item.
  case group
  
  /// Text for display that will not capture an answer or have child items.
  case display
  
  /// An item that defines a specific answer to be captured, and which may have child items. (the answer provided in
  /// the QuestionnaireResponse should be of the defined datatype).
  case question
  
  /// Question with a yes/no answer (valueBoolean).
  case boolean

  /// Question with is a real number answer (valueDecimal).
  case decimal
  
  /// Question with an integer answer (valueInteger).
  case integer
  
  /// Question with a date answer (valueDate).
  case date
  
  /// Question with a date and time answer (valueDateTime).
  case dateTime
  
  /// Question with a time (hour:minute:second) answer independent of date. (valueTime).
  case time
  
  /// Question with a short (few words to short sentence) free-text entry answer (valueString).
  case string
  
  /// Question with a long (potentially multi-paragraph) free-text entry answer (valueString).
  case text
  
  /// Question with a URL (website, FTP site, etc.) answer (valueUri).
  case url
  
  /// Question with a Coding drawn from a list of possible answers (specified in either the answerOption property, or
  /// via the valueset referenced in the answerValueSet property) as an answer (valueCoding).
  case choice
  
  /// Answer is a Coding drawn from a list of possible answers (as with the choice type) or a free-text entry in a
  /// string (valueCoding or valueString).
  case openChoice = "open-choice"
  
  /// Question with binary content such as an image, PDF, etc. as an answer (valueAttachment).
  case attachment
  
  /// Question with a reference to another resource (practitioner, organization, etc.) as an answer (valueReference).
  case reference
  
  /// Question with a combination of a numeric value and unit, potentially with a comparator (<, >, etc.) as an
  /// answer. (valueQuantity) There is an extension 'http://hl7.org/fhir/StructureDefinition/questionnaire-unit' that
  /// can be used to define what unit should be captured (or the unit that has a ucum conversion from the provided
  /// unit).
  case quantity
}
