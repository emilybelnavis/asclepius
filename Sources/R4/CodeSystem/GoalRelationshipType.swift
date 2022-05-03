//
//  GoalRelationshipType.swift
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
 Types of relationships between two goals.
 
 URL: http://terminology.hl7.org/CodeSystem/goal-relationship-type
 ValueSet: http://hl7.org/fhir/ValueSet/goal-relationship-type
 */
public enum GoalRelationshipType: String, FHIRKitPrimitiveType {
  /// Indicates that the target goal is one which must be met before striving for the current goal.
  case predecessor
  
  /// Indicates that the target goal is a desired objective once the current goal is met.
  case successor
  
  /// Indicates that this goal has been replaced by the target goal.
  case replacement
  
  /// Indicates that the target goal is considered to be a "piece" of attaining this goal.
  case milestone
  
  /// Indicates that the relationship is not covered by one of the pre-defined codes.  (An extension may convey more
  /// information about the meaning of the relationship.).
  case other
}
