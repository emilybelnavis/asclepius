//
//  ContractContentDefinition.swift
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
 Precursory content developed with a focus and intent of supporting the formation of a `Contract` instance,
 which may be associated and transformable into a `Contract`
 */
open class ContractContentDefinition: BackboneElement {
  /// Content structure and use
  public var type: CodableConcept
  
  /// Detauled content type definition
  public var subType: CodableConcept?
  
  /// Publisher entity
  public var publisher: Reference?
  
  /// Publication date
  public var publicationDate: FHIRKitPrimitive<FHIRKitDateTime>?
  
  /// None
  public var publicationStatus: FHIRKitPrimitive<ContractResourcePublicationStatusCodes>
  
  /// Publication ownership
  public var copyright: FHIRKitPrimitive<FHIRKitString>?
}
