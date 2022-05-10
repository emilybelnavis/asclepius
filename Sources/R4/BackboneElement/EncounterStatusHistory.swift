//
//  EncounterStatusHistory.swift
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
/// List of past encounter statuses; The status history permits the encounter resource to contain the status
/// history without needing to read through the historical version of the resource, or even have the server
/// store them.
open class EncounterStatusHistory: BackboneElement {
  /// planned | arrived | triaged | in-progress | onleave | finished | cancelled +.
  public var status: AsclepiusPrimitive<EncounterStatus>
  
  /// The time that the episode was in the specified status.
  public var period: Period
}
