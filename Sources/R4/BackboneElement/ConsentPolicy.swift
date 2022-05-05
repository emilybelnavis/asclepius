//
//  ConsentPolicy.swift
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
 Policies covered by this consent - The references to the policies that are included in this consent scope. Policies
 may be organizational, but are often defined jurisdicionally or by law
 */
open class ConsentPolicy: BackboneElement {
  /// Enforcement source for policy
  public var authority: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Specific policy covered by this consent
  public var uri: FHIRKitPrimitive<FHIRKitURI>?
}
