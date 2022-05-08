//
//  EffectEvidenceSynthesisCertaintyCertaintySubcomponent.swift
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
 A description of a component that contributes to the overall certainty
 */
// 
open class EffectEvidenceSynthesisCertaintyCertaintySubcomponent: BackboneElement { // swiftlint:disable:this type_name
  /// Type of subcomponent of certainty rating
  public var type: CodeableConcept?
  
  /// Subcomponent certainty rating
  public var rating: [CodeableConcept]?
  
  /// Used for footnotes/explanatory notes
  public var note: [Annotation]?
}
