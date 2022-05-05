//
//  ContractFriendly.swift
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
 Contract friendly language - The "patient friendly language" version of the `Contract` in whole or in parts.
 "Patient friendly language" means that the representation of the `Contract` and `Contract Provisions`
 in a manner that is readily accessible and understandable by a layperson in accordance with best practices for
 communication styles that ensure that those agreeing to or signing the `Contract` understand the roles,
 actions, obligations, responsibilities, and implication(s) of the agreement.
 */
open class ContractFriendly: BackboneElement {
  public enum ContentX: Hashable {
    case attachment(Attachment)
    case reference(Reference)
  }
  
  /// Easily comprehended representation of this Contract
  public var contentX: ContentX
}
