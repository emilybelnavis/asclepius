//
//  EpisodeOfCareStatusHistory.swift
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

/// Past list of status codes (the current status may be included to cover the start date of the status)
/// The history of status that the `EpisodeOfCare` has been through (without requiring processing the
/// history of the resource).
open class EpisodeOfCareStatusHistory: BackboneElement {
  /// planned | waitlist | active | onhold | finished | cancelled
  public var status: AsclepiusPrimitive<EpisodeOfCareStatus>
  
  /// Duration the `EpisodeOfCare` was in the specified status
  public var period: Period
}
