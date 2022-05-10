//
//  EncounterLocation.swift
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

/// List of locations where the patient has been during this encounter
open class EncounterLocation: BackboneElement {
  /// Location that the encounter takes place
  public var location: Reference
  
  /// The status of the particpants' presence at the specified location during the period specified. If the
  /// period participant is no longer at the location, then the period will have an end date/time.
  public var status: AsclepiusPrimitive<EncounterLocationStatus>?
  
  /// The physical type of location (usually the level in the location hierarchy - bed/room/ward/etc...)
  public var physicalType: CodeableConcept?
  
  /// Time period during which the patient was present at the location
  public var period: Period?
}
