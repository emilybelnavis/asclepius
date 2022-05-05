//
//  CompartmentDefinitionResource.swift
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

/// Information about how a resouce is related to the compartment
open class CompartmentDefinitionResource: BackboneElement {
  /// The name of a resource supported by the server
  public var code: FHIRKitPrimitive<ResourceType>
  
  /// Search parameter name or chained parameters
  public var param: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Additional documentation about the resource and compartment
  public var documentation: FHIRKitPrimitive<FHIRKitString>?
}
