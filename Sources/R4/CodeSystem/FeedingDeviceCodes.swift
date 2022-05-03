//
//  FeedingDeviceCodes.swift
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
 Materials used or needed to feed the patient.
 
 URL: http://hl7.org/fhir/feeding-device
 */
public enum FeedingDeviceCodes: String, FHIRKitPrimitiveType {
  /// Standard nipple definition:
  case standardNipple = "standard-nipple"
  
  /// Preemie nipple definition:
  case preemieNipple = "preemie-nipple"
  
  /// Orthodontic nipple definition:
  case orthoNipple = "ortho-nipple"
  
  /// Slow flow nipple definition:
  case slofloNipple = "sloflo-nipple"
  
  /// Middle flow nipple definition:
  case midfloNipple = "midflo-nipple"
  
  /// Enlarged, cross-cut nipple definition:
  case bigcutNipple = "bigcut-nipple"
  
  /// Haberman bottle definition:
  case habermanBottle = "haberman-bottle"
  
  /// Sippy cup with valve definition:
  case sippyValve = "sippy-valve"
  
  /// Sippy cup without valve definition:
  case sippyNoValve = "sippy-no-valve"
  
  /// Provale Cup definition:
  case provaleCup = "provale-cup"
  
  /// Glass with lid/sippy cup definition:
  case glassLid = "glass-lid"

  /// Double handhold on glass/cup definition:
  case handholdCup = "handhold-cup"
  
  /// Rubber matting under tray definition:
  case rubberMat = "rubber-mat"
  
  /// Straw definition:
  case straw
  
  /// Nose cup definition:
  case noseCup = "nose-cup"
  
  /// Scoop plate definition:
  case scoopPlate = "scoop-plate"
  
  /// Hand wrap utensil holder definition:
  case utensilHolder = "utensil-holder"

  /// Foam handle utensils definition:
  case foamHandle = "foam-handle"
  
  /// Angled utensils definition:
  case angledUtensil = "angled-utensil"
  
  /// Spout cup definition:
  case spoutCup = "spout-cup"
  
  /// Automated feeding devices definition:
  case autofeedingDevice = "autofeeding-device"
  
  /// Rocker knife definition:
  case rockerKnife = "rocker-knife"
}
