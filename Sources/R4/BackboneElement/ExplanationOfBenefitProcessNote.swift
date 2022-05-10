//
//  ExplanationOfBenefitProcessNote.swift
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

/// A note that describes/explains adjudication results in a human readable form
open class ExplanationOfBenefitProcessNote: BackboneElement {
  /// Note instance identifier
  public var number: AsclepiusPrimitive<AsclepiusPositiveInteger>?
  
  /// Business purpose of the note text
  public var type: AsclepiusPrimitive<NoteType>?
  
  /// Note text
  public var text: AsclepiusPrimitive<AsclepiusString>?
  
  /// Language of the text
  public var language: CodeableConcept?
  
  // MARK: - Class Functions
}
