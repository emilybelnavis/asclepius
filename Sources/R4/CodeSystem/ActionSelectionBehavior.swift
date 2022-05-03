//
//  ActionSelectionBehavior.swift
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
 Defines selection behavior of a group.
 
 URL: http://hl7.org/fhir/action-selection-behavior
 ValueSet: http://hl7.org/fhir/ValueSet/action-selection-behavior
 */
public enum ActionSelectionBehavior: String, FHIRKitPrimitiveType {
  /// Any number of the actions in the group may be chosen, from zero to all
  case any
  
  /// All the actions in the group must be selected as a single unit
  case all
  
  /// All the actions in the group are meant to be chosen as a single unit: either all must be selected by the
  /// end user, or none may be selected
  case allOrNone = "all-or-none"
  
  /// The end user must choose one and only one of the selectable actions in the group. The user shall not
  /// choose none of the actions in the group
  case exactlyOne = "exactly-one"
  
  /// The end user may choose zero or at most one of the actions in the group
  case atMostOne = "at-most-one"
  
  /// The end user must chose a minimum of one, and as many additional as desired
  case oneOrMore = "one-or-more"
}
