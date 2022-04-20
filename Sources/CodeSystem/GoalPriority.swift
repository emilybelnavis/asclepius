//
//  GoalPriority.swift
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
 Indicates the level of importance associated with reaching or sustaining a goal.
 
 URL: http://terminology.hl7.org/CodeSystem/goal-priority
 ValueSet: http://hl7.org/fhir/ValueSet/goal-priority
 */
public enum GoalPriority: String, FHIRKitPrimitiveType {
  /// Indicates that the goal is of considerable importance and should be a primary focus of care delivery.
  case highPriority = "high-priority"
  
  /// Indicates that the goal has a reasonable degree of importance and that concrete action should be taken towards
  /// the goal.  Attainment is not as critical as high-priority goals.
  case mediumPriority = "medium-priority"
  
  /// The goal is desirable but is not sufficiently important to devote significant resources to.  Achievement of the
  /// goal may be sought when incidental to achieving other goals.
  case lowPriority = "low-priority"
}
