//
//  ConsentProvisionData.swift
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

/// Data controlled by this rule - The resources controlled by this rule if specific resources are referenced
open class ConsentProvisionData: BackboneElement {
  /// How the resource reference is interpreted when testing consent restrictions
  public var meaning: FHIRKitPrimitive<ConsentDataMeaning>
  
  /// The actual data reference
  public var reference: Reference
}
