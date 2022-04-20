//
//  GoalAchievementStatus.swift
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
 Describes the progression, or lack thereof, towards the goal against the target.
 
 URL: http://terminology.hl7.org/CodeSystem/goal-achievement
 ValueSet: http://hl7.org/fhir/ValueSet/goal-achievement
 */
public enum GoalAchievementStatus: String, FHIRKitPrimitiveType {
  /// The goal is being sought but has not yet been reached. (Also applies if the goal was reached in the past but
  /// there has been regression and the goal is again being sought).
  case inProgress = "in-progress"
  
  /// The goal is being sought, and is progressing.
  case improving
  
  /// The goal is being sought, but is regressing.
  case worsening
  
  /// The goal is being sought, but the trend is flat.
  case noChange = "no-change"
  
  /// The goal has been met.
  case achieved
  
  /// The goal has been met, but ongoing activity is needed to sustain the goal objective.
  case sustaining
  
  /// The goal has not been met and there might or might not have been progress towards target.
  case notAchieved = "not-achieved"
  
  /// The goal has not been met and little to no progress towards target.
  case noProgress = "no-progress"
  
  /// The goal is not possible to be met.
  case notAttainable = "not-attainable"
}
