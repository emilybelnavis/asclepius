//
//  EffectEvidenceSynthesisResultsByExposure.swift
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
 What was the result per exposure?; A description of the results for each exposure considered in the effect
 estimate
 */
open class EffectEvidenceSynthesisResultsByExposure: BackboneElement {
  /// Description of results by exposure
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>
  
  /// Whether these results are for the exposure state or alternative exposure state
  public var exposureState: FHIRKitPrimitive<ExposureState>?
  
  /// Variant exposure states
  public var variantState: CodableConcept?
  
  /// Risk evidence synthesis
  public var riskEvidenceSynthesis: Reference
}
