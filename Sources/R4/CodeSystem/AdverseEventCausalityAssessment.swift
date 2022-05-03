//
//  AdverseEventCausalityAssessment.swift
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
 Codes for the assessment of whether the entity caused the event.
 
 URL: http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess
 ValueSet: http://hl7.org/fhir/ValueSet/adverse-event-causality-assess
 */
public enum AdverseEventCausalityAssessment: String, FHIRKitPrimitiveType {

  /// i) Event or laboratory test abnormality, with plausible time relationship to drug intake; ii) Cannot be
  /// explained by disease or other drugs; iii) Response to withdrawal plausible (pharmacologically, pathologically);
  /// iv) Event definitive pharmacologically or phenomenologically (i.e. an objective and specific medical disorder or
  /// a recognized pharmacological phenomenon); or v) Re-challenge satisfactory, if necessary.
  case certain = "Certain"

  /// i) Event or laboratory test abnormality, with reasonable time relationship to drug intake; ii) Unlikely to be
  /// attributed to disease or other drugs; iii) Response to withdrawal clinically reasonable; or iv) Re-challenge not
  /// required.
  case probablyLikely = "Probably-Likely"

  /// i) Event or laboratory test abnormality, with reasonable time relationship to drug intake; ii) Could also be
  /// explained by disease or other drugs; or iii) Information on drug withdrawal may be lacking or unclear.
  case possible = "Possible"
  
  /// i) Event or laboratory test abnormality, with a time to drug intake that makes a relationship improbable (but
  /// not impossible); or ii) Disease or other drugs provide plausible explanations.
  case unlikely = "Unlikely"
  
  /// i) Event or laboratory test abnormality; ii) More data for proper assessment needed; or iii) Additional data
  /// under examination.
  case conditionalClassified = "Conditional-Classified"
  
  /// i) Report suggesting an adverse reaction; ii) Cannot be judged because information is insufficient or
  /// contradictory; or iii) Data cannot be supplemented or verified.
  case unassessableUnclassifiable = "Unassessable-Unclassifiable"
}
