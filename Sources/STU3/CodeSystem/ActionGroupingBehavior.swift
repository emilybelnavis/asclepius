//
//  ActionGroupingBehavior.swift
//  AlexandriaHRM
//  Module: STU3
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

/**
 Defines organization behavior of a group.
 
 URL: http://hl7.org/fhir/action-grouping-behavior
 ValueSet: http://hl7.org/fhir/ValueSet/action-grouping-behavior
 */
public enum ActionGroupingBehavior: String, AlexandriaHRMPrimitiveType {
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
