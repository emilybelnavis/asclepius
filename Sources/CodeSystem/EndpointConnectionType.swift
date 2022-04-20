//
//  EndpointConnectionType.swift
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
 This is an example value set defined by the FHIR project, that could be used to represent possible connection type
 profile values.
 
 URL: http://terminology.hl7.org/CodeSystem/endpoint-connection-type
 ValueSet: http://hl7.org/fhir/ValueSet/endpoint-connection-type
 */
public enum EndpointConnectionType: String, FHIRKitPrimitiveType {
  /// IHE Cross Community Patient Discovery Profile (XCPD) - http://wiki.ihe.net/index.php/Cross-
  /// Community_Patient_Discovery
  case iheXcpd = "ihe-xcpd"

  /// IHE Cross Community Access Profile (XCA) - http://wiki.ihe.net/index.php/Cross-Community_Access
  case iheXca = "ihe-xca"
  
  /// IHE Cross-Enterprise Document Reliable Exchange (XDR) -
  /// http://wiki.ihe.net/index.php/Cross-enterprise_Document_Reliable_Interchange
  case iheXdr = "ihe-xdr"
  
  /// IHE Cross-Enterprise Document Sharing (XDS) -
  /// http://wiki.ihe.net/index.php/Cross-Enterprise_Document_Sharing
  case iheXds = "ihe-xds"
  
  /// IHE Invoke Image Display (IID) - http://wiki.ihe.net/index.php/Invoke_Image_Display
  case iheIid = "ihe-iid"
  
  /// DICOMweb RESTful Image Retrieve -
  /// http://dicom.nema.org/medical/dicom/current/output/chtml/part18/sect_6.5.html
  case dicomWadoRs = "dicom-wado-rs"
  
  /// DICOMweb RESTful Image query -
  /// http://dicom.nema.org/medical/dicom/current/output/chtml/part18/sect_6.7.html
  case dicomQidoRs = "dicom-qido-rs"
  
  /// DICOMweb RESTful image sending and storage -
  /// http://dicom.nema.org/medical/dicom/current/output/chtml/part18/sect_6.6.html
  case dicomStowRs = "dicom-stow-rs"
  
  /// DICOMweb Image Retrieve -
  /// http://dicom.nema.org/dicom/2013/output/chtml/part18/sect_6.3.html
  case dicomWadoUri = "dicom-wado-uri"
  
  /// Interact with the server interface using FHIR's RESTful interface. For details on its version/capabilities you
  /// should connect the value in Endpoint.address and retrieve the FHIR CapabilityStatement.
  case hl7FhirRest = "hl7-fhir-rest"
  
  /// Use the servers FHIR Messaging interface. Details can be found on the messaging.html page in the FHIR
  /// Specification. The FHIR server's base address is specified in the Endpoint.address property.
  case hl7FhirMsg = "hl7-fhir-msg"

  /// HL7v2 messages over an LLP TCP connection
  case hl7v2Mllp = "hl7v2-mllp"
  
  /// Email delivery using a digital certificate to encrypt the content using the public key, receiver must have the
  /// private key to decrypt the content
  case secureEmail = "secure-email"
  
  /// Direct Project information - http://wiki.directproject.org/
  case directProject = "direct-project"
}
