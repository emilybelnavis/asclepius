//
//  MeasurePopulationType.swift
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
 The type of population.
 
 URL: http://terminology.hl7.org/CodeSystem/measure-population
 ValueSet: http://hl7.org/fhir/ValueSet/measure-population
 */
public enum MeasurePopulationType: String, FHIRKitPrimitiveType {
  /// The initial population refers to all patients or events to be evaluated by a quality measure involving patients
  /// who share a common set of specified characterstics. All patients or events counted (for example, as numerator,
  /// as denominator) are drawn from the initial population.
  case initialPopulation = "initial-population"
  
  /// The upper portion of a fraction used to calculate a rate, proportion, or ratio. Also called the measure focus,
  /// it is the target process, condition, event, or outcome. Numerator criteria are the processes or outcomes
  /// expected for each patient, or event defined in the denominator. A numerator statement describes the clinical
  /// action that satisfies the conditions of the measure.
  case numerator
  
  /// Numerator exclusion criteria define patients or events to be removed from the numerator. Numerator exclusions
  /// are used in proportion and ratio measures to help narrow the numerator (for inverted measures).
  case numeratorExclusion = "numerator-exclusion"
  
  /// The lower portion of a fraction used to calculate a rate, proportion, or ratio. The denominator can be the same
  /// as the initial population, or a subset of the initial population to further constrain the population for the
  /// purpose of the measure.
  case denominator
  
  /// Denominator exclusion criteria define patients or events that should be removed from the denominator before
  /// determining if numerator criteria are met. Denominator exclusions are used in proportion and ratio measures to
  /// help narrow the denominator. For example, patients with bilateral lower extremity amputations would be listed as
  /// a denominator exclusion for a measure requiring foot exams.
  case denominatorExclusion = "denominator-exclusion"
  
  /// Denominator exceptions are conditions that should remove a patient or event from the denominator of a measure
  /// only if the numerator criteria are not met. Denominator exception allows for adjustment of the calculated score
  /// for those providers with higher risk populations. Denominator exception criteria are only used in proportion
  /// measures.
  case denominatorException = "denominator-exception"
  
  /// Measure population criteria define the patients or events for which the individual observation for the measure
  /// should be taken. Measure populations are used for continuous variable measures rather than numerator and
  /// denominator criteria.
  case measurePopulation = "measure-population"
  
  /// Measure population criteria define the patients or events that should be removed from the measure population
  /// before determining the outcome of one or more continuous variables defined for the measure observation. Measure
  /// population exclusion criteria are used within continuous variable measures to help narrow the measure
  /// population.
  case measurePopulationExclusion = "measure-population-exclusion"
  
  /// Defines the individual observation to be performed for each patient or event in the measure population. Measure
  /// observations for each case in the population are aggregated to determine the overall measure score for the
  /// population.
  case measureObservation = "measure-observation"
}
