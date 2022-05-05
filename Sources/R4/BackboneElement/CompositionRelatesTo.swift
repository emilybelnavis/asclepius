//
//  CompositionRelatesTo.swift
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

/// Relationships that this composition has with other compositions or documents that already exist
open class CompositionRelatesTo: BackboneElement {
  public enum TargetX: Hashable {
    case identifier(Identifier)
    case reference(Reference)
  }
  
  /// The type of relationship that this composition has with another composition or document
  public var code: FHIRKitPrimitive<DocumentRelationshipType>
  
  /// Target of the relationship
  public var targetX: TargetX
 }
