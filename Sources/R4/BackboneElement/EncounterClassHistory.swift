//
//  EncounterClassHistory.swift
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

/// List of past encounter classes; The class history permits the tracking of the encounters transitions without
/// needing to go through the resource history. This would be used for a case where an admission starts off
/// as an emergency encounter, then transitions into an inpatient scenario. Doing this and not restarting a new
/// encounter ensures that any lab/diagnostic results can more easily follow the patient and not required
/// re-processing and get lost or cancelled during a kind of discharge from emergency to inpatient
open class EncounterClassHistory: BackboneElement {
  /// Inpatient | Outpatient | Ambulatory | Emergency +
  public var encounterClass: Coding
  
  /// The time that the episode was in the specified class
  public var period: Period
  
  override public init(encounterClass: Coding, period: Period) {
    self.encounterClass = encounterClass
    self.period = period
    super.init()
  }
}
