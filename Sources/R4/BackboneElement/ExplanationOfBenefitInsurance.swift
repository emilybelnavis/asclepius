//
//  ExplanationOfBenefitInsurance.swift
//  Asclepius
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

import AsclepiusCore

/// Patient Insurance Information; Financial instruments for reimbursement for the healthcare product(s)
/// and/or service(s) specified on the claim.
open class ExplanationOfBenefitInsurance: BackboneElement {
  /// Coverage to be used for adjudication
  public var focal: AsclepiusPrimitive<AsclepiusBool>
  
  /// Insurance information
  public var coverage: Reference?
  
  /// prior-authorization reference number
  public var preAuthRef: [AsclepiusPrimitive<AsclepiusString>]?
  
  // MARK: - Class Function
}
