//
//  ResearchStudyPrimaryPurposeType.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

/**
 Codes for the main intent of the study.
 
 URL: http://terminology.hl7.org/CodeSystem/research-study-prim-purp-type
 ValueSet: http://hl7.org/fhir/ValueSet/research-study-prim-purp-type
 */
public enum ResearchStudyPrimaryPurposeType: String, FHIRKitPrimitiveType {
  /// One or more interventions are being evaluated for treating a disease, syndrome, or condition.
  case treatment
  
  /// One or more interventions are being assessed for preventing the development of a specific disease or health
  /// condition.
  case prevention
  
  /// One or more interventions are being evaluated for identifying a disease or health condition.
  case diagnostic
  
  /// One or more interventions are evaluated for maximizing comfort, minimizing side effects, or mitigating against a
  /// decline in the participant's health or function.
  case supportiveCare = "supportive-care"
  
  /// One or more interventions are assessed or examined for identifying a condition, or risk factors for a condition,
  /// in people who are not yet known to have the condition or risk factor.
  case screening
  
  /// One or more interventions for evaluating the delivery, processes, management, organization, or financing of
  /// healthcare.
  case healthServicesResearch = "health-services-research"
  
  /// One or more interventions for examining the basic mechanism of action (for example, physiology or biomechanics
  /// of an intervention).
  case basicScience = "basic-science"
  
  /// An intervention of a device product is being evaluated to determine the feasibility of the product or to test a
  /// prototype device and not health outcomes. Such studies are conducted to confirm the design and operating
  /// specifications of a device before beginning a full clinical trial.
  case deviceFeasibility = "device-feasibility"
}
