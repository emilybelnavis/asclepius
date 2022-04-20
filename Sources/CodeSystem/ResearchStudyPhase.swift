//
//  ResearchStudyPhase.swift
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
 Codes for the stage in the progression of a therapy from initial experimental use in humans in clinical trials to post-
 market evaluation.
 
 URL: http://terminology.hl7.org/CodeSystem/research-study-phase
 ValueSet: http://hl7.org/fhir/ValueSet/research-study-phase
 */
public enum ResearchStudyPhase: String, FHIRKitPrimitiveType {
  /// Trials without phases (for example, studies of devices or behavioral interventions).
  case NA = "n-a"
  
  /// Designation for optional exploratory trials conducted in accordance with the United States Food and Drug
  /// Administration's (FDA) 2006 Guidance on Exploratory Investigational New Drug (IND) Studies. Formerly called
  /// Phase 0.
  case earlyPhase1 = "early-phase-1"
  
  /// Includes initial studies to determine the metabolism and pharmacologic actions of drugs in humans, the side
  /// effects associated with increasing doses, and to gain early evidence of effectiveness; may include healthy
  /// participants and/or patients.
  case phase1 = "phase-1"
  
  /// Trials that are a combination of phases 1 and 2.
  case phase1Phase2 = "phase-1-phase-2"
  
  /// Includes controlled clinical studies conducted to evaluate the effectiveness of the drug for a particular
  /// indication or indications in participants with the disease or condition under study and to determine the common
  /// short-term side effects and risks.
  case phase2 = "phase-2"
  
    /// Trials that are a combination of phases 2 and 3.
  case phase2Phase3 = "phase-2-phase-3"
  
    /// Includes trials conducted after preliminary evidence suggesting effectiveness of the drug has been obtained, and
    /// are intended to gather additional information to evaluate the overall benefit-risk relationship of the drug.
  case phase3 = "phase-3"
  
    /// Studies of FDA-approved drugs to delineate additional information including the drug's risks, benefits, and
    /// optimal use.
  case phase4 = "phase-4"
}
