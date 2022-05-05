//
//  ConceptMapGroupElementTarget.swift
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

/// A concept from the target value set that this concept maps to
open class ConceptMapGroupElementTarget: BackboneElement {
  /// Code that identifies the target element
  public var code: FHIRKitPrimitive<FHIRKitString>?
  
  /// Display for the code
  public var display: FHIRKitPrimtive<FHIRKitString>?
  
  /// The equivalence between the source and target concepts (counting for the dependencies and products).
  /// The equivalence is read from target to source (e.g. the target is "wider" than the "source".)
  public var equivalence: FHIRKitPrimitive<ConceptMapEquivalence>
  
  /// Description of status/issues in mapping
  public var comment: FHIRKitPrimitive<FHIRKitString>?
  
  /// Other elements required for this mapping (from context)
  public var dependsOn: [ConceptMapGroupElementTargetDependsOn]?
  
  /// Other concepts that this mapping produces
  public var product: [ConceptMapGroupElementTargetDependsOn]?
}
