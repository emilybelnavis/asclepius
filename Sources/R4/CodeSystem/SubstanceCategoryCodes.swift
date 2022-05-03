//
//  SubstanceCategoryCodes.swift
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
 Substance category codes
 
 URL: http://terminology.hl7.org/CodeSystem/substance-category
 ValueSet: http://hl7.org/fhir/ValueSet/substance-category
 */
public enum SubstanceCategoryCodes: String, FHIRKitPrimitiveType {
  /// A substance that causes an allergic reaction.
  case allergen
  
  /// A substance that is produced by or extracted from a biological source.
  case biological
  
  /// A substance that comes directly from a human or an animal (e.g. blood, urine, feces, tears, etc.).
  case body
  
  /// Any organic or inorganic substance of a particular molecular identity, including -- (i) any combination of such
  /// substances occurring in whole or in part as a result of a chemical reaction or occurring in nature and (ii) any
  /// element or uncombined radical (http://www.epa.gov/opptintr/import-export/pubs/importguide.pdf).
  case chemical
  
  /// A food, dietary ingredient, or dietary supplement for human or animal.
  case food
  
  /// A substance intended for use in the diagnosis, cure, mitigation, treatment, or prevention of disease in man or
  /// other animals (Federal Food Drug and Cosmetic Act).
  case drug
  
  /// A finished product which is not normally ingested, absorbed or injected (e.g. steel, iron, wood, plastic and
  /// paper).
  case material
}
