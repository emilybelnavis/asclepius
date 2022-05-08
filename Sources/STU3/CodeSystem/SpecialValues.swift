//
//  SpecialValues.swift
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
 A set of generally useful codes defined so they can be included in value sets.
 
 URL: http://terminology.hl7.org/CodeSystem/special-values
 ValueSet: http://hl7.org/fhir/ValueSet/special-values
 */
public enum SpecialValues: String, AlexandriaHRMPrimitiveType {
  /// Boolean true.
  case `true`
  
  /// Boolean false.
  case `false`
  
  /// The content is greater than zero, but too small to be quantified.
  case trace
  
  /// The specific quantity is not known, but is known to be non-zero and is not specified because it makes up the
  /// bulk of the material.
  case sufficient
  
  /// The value is no longer available.
  case withdrawn
  
  /// The are no known applicable values in this context.
  case nilKnown = "nil-known"
}
