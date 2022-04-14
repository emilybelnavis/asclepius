//
//  ActionPrecheckBehaviour.swift
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
 Defines selection frequency behavior for an action or group.
 
 URL: http://hl7.org/fhir/action-precheck-behavior
 ValueSet: http://hl7.org/fhir/ValueSet/action-precheck-behavior
 */
public enum ActionPrecheckBehavior: String, FHIRKitPrimitiveType {
  /**
   An action with this behaviour is one of the most frequent action that is, or should be, included by an
   end-user, for the particular context in which the action occurs. The system displaying the action to the
   end-user should consider "pre-checking" such an action as a convenience for the user
   */
  case yes
  
  /**
   An action with this behaviour is one of the less frequent actions included by the end-user, for the particular
   context in which the action occurs. The system displaying the actions to the end user would typically not
   "pre-check" such an action
   */
  case no
}
