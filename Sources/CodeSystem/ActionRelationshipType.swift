//
//  ActionRelationshipType.swift
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
 Defines the types of relationships between actions.
 
 URL: http://hl7.org/fhir/action-relationship-type
 ValueSet: http://hl7.org/fhir/ValueSet/action-relationship-type
 */
public enum ActionRelationshipType: String, FHIRKitPrimitiveType {
  /// the action must be performed before the start of the related action
  case beforeStart = "before-start"
  
  /// The action must be performed before the related action
  case before
  
  /// The action must be performed before the end of the related action
  case beforeEnd = "before-end"
  
  /// The action must be perfomed concurrently with the start with of the related action
  case concurrentWithStart = "concurrent-with-start"
  
  /// The action must be performed concurrently with the related action
  case concurrent
  
  /// The action must be performed concurrently with the end of the related action
  case concurrentWithEnd = "concurrent-with-end"
  
  /// The action must be performed after the the start of the related action
  case afterStart = "after-start"
  
  /// The action must be performed after the related action
  case after
  
  /// The action must be performed after the end of the related action
  case afterEnd = "after-end"
}
