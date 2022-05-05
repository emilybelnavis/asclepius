//
//  CodeSystemProperty.swift
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
 Additional information supplied about each concept. A property defines an additional slot through which
 additional information can be provided about a concept
 */
open class CodeSystemProperty: BackboneElement {
  /// Identifies the property on the concepts and when referred to in operations
  public var code: FHIRKitPrimitive<FHIRKitString>
  
  /// Formal identifier for the property
  public var uri: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Why the property is defined, and/or what it conveys
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  /// The type of property value. Properties of the type "code" defined by the code system
  /// (e.g. a reference to another defined concept)
  public var type: FHIRKitPrimitive<PropertyType>
}
