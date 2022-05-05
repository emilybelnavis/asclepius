//
//  ConceptMapGroup.swift
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
 A group of mappings that all have the same source and target systems
 */
open class ConceptMapGroup: BackboneElement {
  /// Source system where concept to be mapped are defined
  public var source: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Specific version of the code system
  public var sourceVersion: FHIRKitPrimitive<FHIRKitString>?
  
  /// Target system that the concepts are mapped to
  public var target: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Specific version of the code system
  public var targetVersion: FHIRKitPrimitive<FHIRKitString>?
  
  /// Mappings for a concept from the source set
  public var element: [ConceptMapGroupElement]
  
  /// What to do when there is no mapping for the source concept
  public var unmapped: ConceptMapGroupUnmapped?
}
