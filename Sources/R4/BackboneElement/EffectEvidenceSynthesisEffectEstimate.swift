//
//  EffectEvidenceSynthesisEffectEstimate.swift
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
 The estimated effect of the exposure variant
 */
open class EffectEvidenceSynthesisEffectEstimate: BackboneElement {
  /// Description of effect estimate
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// Type of effect estimate
  public var type: CodableConcept?
  
  /// Variant exposure states
  public var variantState: CodableConcept?
  
  /// Point estimate
  public var value: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// What unit is the outcome described in
  public var unitOfMeasure: CodableConcept?
  
  /// How precise the esitmate is 
  public var precisionEsitmate: [EffectEvidenceSynthesisEffectEstimatePrecisionEstimate]?
}
