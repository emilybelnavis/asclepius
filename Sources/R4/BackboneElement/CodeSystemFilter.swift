//
//  CodeSystemFilter.swift
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

import FHIRKitCore

/**
 A filter that can be used in a value set compose statement when selecting concepts using a filter
 */
open class CodeSystemFilter: BackboneElement {
  /// Code that identifies the filter
  public var code: FHIRKitPrimitive<FHIRKitString>
  
  /// How or why the filter is used
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// List of operators that can be used with the filter
  public var filterOperator: [FHIRKitPrimitive<FilterOperator>]
  
  /// What to use for the value
  public var value: FHIRKitPrimitive<FHIRKitString>
}
