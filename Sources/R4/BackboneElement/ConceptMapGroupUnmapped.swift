//
//  ConceptMapGroupUnmapped.swift
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
 What to do when there is no mapping for the source concept. "Unmapped" does not include codes that are
 unmached, and the unmapped element is ignored in a code is specified to have equivalence = unmatched
 */
open class ConceptMapGroupUnmapped: BackboneElement {
  /**
   Defines which action to take if there is no match for the source concept in the target system designated
   for the group. One of three actions are possible: Use the unmapped code (this is useful when doing a
   mapping between version and only a few codes have changed), use a fixed code (a default code), or
   alternatively, a reference to a different concept map can be provided (by canonical URL)
   */
  public var mode: FHIRKitPrimitive<ConceptMapGroupUnmappedMode>
  
  /// Fixed code when mode = fixed
  public var code: FHIRKitPrimitive<FHIRKitString>?
  
  /// Display for the code
  public var display: FHIRKitPrimitive<FHIRKitString>?
  
  
  /// Canonical reference to an additional ConceptMap to use for mapping if the source concept is unmapped
  public var url: FHIRKitPrimitive<Canonical>?
}
