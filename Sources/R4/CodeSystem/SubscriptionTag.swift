//
//  SubscriptionTag.swift
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

/**
 Tags to put on a resource after subscriptions have been sent.
 
 URL: http://terminology.hl7.org/CodeSystem/subscription-tag
 ValueSet: http://hl7.org/fhir/ValueSet/subscription-tag
 */
public enum SubscriptionTag: String, AsclepiusPrimitiveType {
  /// The message has been queued for processing on a destination systems.
  case queued
  
  /// The message has been delivered to its intended recipient.
  case delivered
}
