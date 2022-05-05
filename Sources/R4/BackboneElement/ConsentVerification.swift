//
//  ConsentVerification.swift
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
 Whether a treatment instruction was verified with the patient, their family, or another authorized person
 */
open class ConsentVerification: BackboneElement {
  /// Has been verified
  public var verified: FHIRKitPrimitive<FHIRKitBool>
  
  /// Person who verified
  public var verifiedWith: Reference?
  
  /// When consent verified
  public var verificationDate: FHIRKitPrimitive<FHIRKitDateTime>?
}
