//
//  RelatedArtifactType.swift
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
 The type of relationship to the related artifact.
 
 URL: http://hl7.org/fhir/related-artifact-type
 ValueSet: http://hl7.org/fhir/ValueSet/related-artifact-type
 */
public enum RelatedArtifactType: String, FHIRKitPrimitiveType {
  /// Additional documentation for the knowledge resource. This would include additional instructions on usage as well
  /// as additional information on clinical context or appropriateness.
  case documentation
  
  /// A summary of the justification for the knowledge resource including supporting evidence, relevant guidelines, or
  /// other clinically important information. This information is intended to provide a way to make the justification
  /// for the knowledge resource available to the consumer of interventions or results produced by the knowledge
  /// resource.
  case justification
  
  /// Bibliographic citation for papers, references, or other relevant material for the knowledge resource. This is
  /// intended to allow for citation of related material, but that was not necessarily specifically prepared in
  /// connection with this knowledge resource.
  case citation
  
  /// The previous version of the knowledge resource.
  case predecessor
  
  /// The next version of the knowledge resource.
  case successor
  
  /// The knowledge resource is derived from the related artifact. This is intended to capture the relationship in
  /// which a particular knowledge resource is based on the content of another artifact, but is modified to capture
  /// either a different set of overall requirements, or a more specific set of requirements such as those involved in
  /// a particular institution or clinical setting.
  case derivedFrom = "derived-from"
  
  /// The knowledge resource depends on the given related artifact.
  case dependsOn = "depends-on"
  
  /// The knowledge resource is composed of the given related artifact.
  case composedOf = "composed-of"
}
