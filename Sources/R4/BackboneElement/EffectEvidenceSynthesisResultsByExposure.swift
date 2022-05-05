//
//  EffectEvidenceSynthesisResultsByExposure.swift
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
 What was the result per exposure?; A description of the results for each exposure considered in the effect
 estimate
 */
open class EffectEvidenceSynthesisResultsByExposure: BackboneElement {
  /// Description of results by exposure
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>
  
  /// Whether these results are for the exposure state or alternative exposure state
  public var exposureState: FHIRKitPrimitive<ExposureState>?
  
  /// Variant exposure states
  public var variantState: CodableConcept?
  
  /// Risk evidence synthesis
  public var riskEvidenceSynthesis: Reference
}
