//
//  ConceptMapGroupElement.swift
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

/// Mappings for an individual concept in the source to one or more concepts in the target
open class ConceptMapGroupElement: BackboneElement {
  /// Identifies element being mapped
  public var code: FHIRKitPrimitive<FHIRKitString>?
  
  /// Display for the code
  public var display: FHIRKitPrimitive<FHIRKitString>?
  
  /// Concept in target system for element
  public var target: [ConceptMapGroupElementTarget]?
}
