//
//  ActionGroupingBehavior.swift
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
 Defines organization behavior of a group.
 
 URL: http://hl7.org/fhir/action-grouping-behavior
 ValueSet: http://hl7.org/fhir/ValueSet/action-grouping-behavior
 */
public enum ActionGroupingBehavior: String, FHIRKitPrimitiveType {
  /// Any group marked with this behaviour should be displayed as a visual group to the end-user.
  case visualGroup = "visual-group"
  
  /// A group with this behaviour logically groups its sub-elements, and may be shown as a visual group
  /// to the end user, but it is not required to do so.
  case logicalGroup = "logical-group"
  
  /**
   A group of related alternative actions is a sentence group if the target referenced by the action is the same
   in all the actions and each action simply constitutes a different variation on how to specify the details for
   the target. For example, two actions that could be in a SentenceGroup are "asprin, 500mg, 2 times per day"
   and "asprin, 300mg, 3 times per day". In both cases, asprin is the target referenced by the action, and the
   two actions represent different options for how asprin might be ordered for the patient. Note that a
   SentenceGroup would almost always have an associated selection behaviour of "AtMostOne", unless it's a
   required action, in which case, it would be "ExactlyOne".
   */
  case sentenceGroup = "sentence-group"
}
