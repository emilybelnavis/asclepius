//
//  CertaintySubcomponentType.swift
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
 The subcomponent classification of quality of evidence rating systems.
 
 URL: http://terminology.hl7.org/CodeSystem/certainty-subcomponent-type
 ValueSet: http://hl7.org/fhir/ValueSet/certainty-subcomponent-type
 */
public enum CertaintySubcomponentType: String, FHIRKitPrimitiveType {
  /// Methodological concerns reducing internal validity
  case riskOfBias = "RiskOfBias"
  
  /// Concerns that findings are not similar to support certainty
  case inconsistency = "Inconsistency"
  
  /// Concerns reducing external validity
  case indirectness = "Indirectness"
  
  /// High quality evidence
  case imprecision = "Imprecision"
  
  ///Likelyhood that what is published misprepresents what is available to publish
  case publicationBias = "PublicationBias"
  
  /// Higher certainty due to dose response relationship
  case doseResponseGradient = "DoseResponseGradient"
  
  /// Higher certainty due to risk of bias in opposite direction
  case plausibleConfounding = "PlausibleConfounding"
  
  /// Higher certainty due to large effect size
  case largeEffect = "LargeEffect"
}
