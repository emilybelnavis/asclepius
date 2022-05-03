//
//  QuestionnaireItemUIControlCodes.swift
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
 Starter set of user interface control/display mechanisms that might be used when rendering an item in a questionnaire.
 
 URL: http://hl7.org/fhir/questionnaire-item-control
 ValueSet: http://hl7.org/fhir/ValueSet/questionnaire-item-control
 */
public enum QuestionnaireItemUIControlCodes: String, FHIRKitPrimitiveType {
  /// UI controls relevant to organizing groups of questions
  case group
  
  /// Questions within the group should be listed sequentially
  case list
  
  /// Questions within the group are rows in the table with possible answers as columns.  Used for 'choice' questions.
  case table
  
  /// Questions within the group are columns in the table with possible answers as rows.  Used for 'choice' questions.
  case htable
  
  /// Questions within the group are columns in the table with each group repetition as a row.  Used for single-answer
  /// questions.
  case gtable
  
  /// This table has one row - for the question.  Permitted answers are columns.  Used for choice questions.
  case atable
  
  /// The group is to be continuously visible at the top of the questionnaire
  case header

  /// The group is to be continuously visible at the bottom of the questionnaire
  case footer
  
  /// UI controls relevant to rendering questionnaire text items
  case text
  
  /// Text is displayed as a paragraph in a sequential position between sibling items (default behavior)
  case inline
  
  /// Text is displayed immediately below or within the answer-entry area of the containing question item (typically
  /// as a guide for what to enter)
  case prompt
  
  /// Text is displayed adjacent (horizontally or vertically) to the answer space for the parent question, typically
  /// to indicate a unit of measure
  case unit
  
  /// Text is displayed to the left of the set of answer choices or a scaling control for the parent question item to
  /// indicate the meaning of the 'lower' bound.  E.g. 'Strongly disagree'
  case lower
  
  /// Text is displayed to the right of the set of answer choices or a scaling control for the parent question item to
  /// indicate the meaning of the 'upper' bound.  E.g. 'Strongly agree'
  case upper
  
  /// Text is temporarily visible over top of an item if the mouse is positioned over top of the text for the
  /// containing item
  case flyover
  
  /// Text is displayed in a dialog box or similar control if invoked by pushing a button or some other UI-appropriate
  /// action to request 'help' for a question, group or the questionnaire as a whole (depending what the text is
  /// nested within)
  case help
  
  /// UI controls relevant to capturing question data
  case question
  
  /// A control which provides a list of potential matches based on text entered into a control.  Used for large
  /// choice sets where text-matching is an appropriate discovery mechanism.
  case autocomplete
  
  /// A control where an item (or multiple items) can be selected from a list that is only displayed when the user is
  /// editing the field.
  case dropDown = "drop-down"
  
  /// A control where choices are listed with a box beside them.  The box can be toggled to select or de-select a
  /// given choice.  Multiple selections may be possible.
  case checkBox = "check-box"
  
  /// A control where editing an item spawns a separate dialog box or screen permitting a user to navigate, filter or
  /// otherwise discover an appropriate match.  Useful for large choice sets where text matching is not an appropriate
  /// discovery mechanism.  Such screens must generally be tuned for the specific choice list structure.
  case lookup
  
  /// A control where choices are listed with a button beside them.  The button can be toggled to select or de-select
  /// a given choice.  Selecting one item deselects all others.
  case radioButton = "radio-button"
  
  /// A control where an axis is displayed between the high and low values and the control can be visually manipulated
  /// to select a value anywhere on the axis.
  case slider
  
  /// A control where a list of numeric or other ordered values can be scrolled through via arrows.
  case spinner
  
  /// A control where a user can type in their answer freely.
  case textBox = "text-box"
}
