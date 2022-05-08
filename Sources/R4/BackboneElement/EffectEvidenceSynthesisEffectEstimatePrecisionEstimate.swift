//
//  EffectEvidenceSynthesisEffectEstimatePrecisionEstimate.swift
//  AlexandriaHRM
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

import AlexandriaHRMCore
/**
 A description of how precise the estimate for the effect is
 */
open class EffectEvidenceSynthesisEffectEstimatePrecisionEstimate: BackboneElement { // swiftlint:disable:this type_name
  /// Type of precision estimate
  public var type: CodeableConcept?
  
  /// Level of confidence interval
  public var level: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
  
  /// Lower bound
  public var from: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
  
  /// Upper bound
  public var to: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
}
