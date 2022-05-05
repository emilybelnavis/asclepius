//
//  CommunicationPayload.swift
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
 Message payload - Text, attachment(s), or resource(s) that were communicated to the recipient
 */
open class CommunicationPayload: BackboneElement {
  public enum ContentX: Hashable {
    case attachment(Attachment)
    case reference(Reference)
    case string(FHIRKitPrimitive<FHIRKitString>)
  }
  
  public var contentX: ContentX
}

