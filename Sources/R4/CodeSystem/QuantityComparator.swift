//
//  QuantityComparator.swift
//  FHIRKit
//  Module: R4
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
 How the Quantity should be understood and represented.
 
 URL: http://hl7.org/fhir/quantity-comparator
 ValueSet: http://hl7.org/fhir/ValueSet/quantity-comparator
 */
public enum QuantityComparator: String, FHIRKitPrimitiveType {
  /// The actual value is less than the given value.
  case lessThan = "<"
  
  /// The actual value is less than or equal to the given value.
  case lessThanOrEqual = "<="
  
  /// The actual value is greater than or equal to the given value.
  case greaterThanOrEqual = ">="
  
  /// The actual value is greater than the given value.
  case greaterThan = ">"
}
