//
//  ActionRequiredBehavior.swift
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
 Defines expectations around whether an action or action group is required.
 
 URL: http://hl7.org/fhir/action-required-behavior
 ValueSet: http://hl7.org/fhir/ValueSet/action-required-behavior
 */
public enum ActionRequiredBehavior: String, FHIRKitPrimitiveType {
  /// An action with this behaviour must be included in the actions processed by the end-user; the end-user
  /// shall not choose to include this action.
  case must
  
  /// An action with this behaviour may be included in the set of actions processed by the end-user
  case could
  
  /// An action with this behaviour must be included in the set of actions processed by the end-user, unless
  /// the end user provides documentation as to why the action was not included.
  case mustUnlessDocumented = "must-unless-documented"
}
