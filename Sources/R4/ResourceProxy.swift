//
//  ResourceProxy.swift
//  FHIRKit
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

// swiftlint:disable file_length
public enum ResourceProxy: FHIRKitType {
  case account(Account)
  case activityDefinition(ActivityDefinition)
//  case adverseEvent(AdverseEvent)
  case adverseEvent(Resource)
//  case allergyIntolerance(AllergyIntolerance)
  case allergyIntolerance(Resource)
//  case appointment(Appointment)
  case appointment(Resource)
//  case appointmentResponse(AppointmentResponse)
  case appointmentResponse(Resource)
//  case auditEvent(AuditEvent)
  case auditEvent(Resource)
//  case basic(Basic)
  case basic(Resource)
//  case binary(Binary)
  case binary(Resource)
//  case biologicallyDerivedProduct(BiologicallyDerivedProduct)
  case biologicallyDerivedProduct(Resource)
//  case bodyStructure(BodyStructure)
  case bodyStructure(Resource)
//  case bundle(Bundle)
  case bundle(Resource)
//  case capabilityStatement(CapabilityStatement)
  case capabilityStatement(Resource)
//  case carePlan(CarePlan)
  case carePlan(Resource)
//  case careTeam(CareTeam)
  case careTeam(Resource)
//  case catalogEntry(CatalogEntry)
  case catalogEntry(Resource)
//  case chargeItem(ChargeItem)
  case chargeItem(Resource)
//  case chargeItemDefinition(ChargeItemDefinition)
  case chargeItemDefinition(Resource)
//  case claim(Claim)
  case claim(Resource)
//  case claimResponse(ClaimResponse)
  case claimResponse(Resource)
//  case clinicalImpression(ClinicalImpression)
  case clinicalImpression(Resource)
  case codeSystem(CodeSystem)
//  case communication(Communication)
  case communication(Resource)
//  case communicationRequest(CommunicationRequest)
  case communicationRequest(Resource)
//  case compartmentDefinition(CompartmentDefinition)
  case compartmentDefinition(Resource)
//  case composition(Composition)
  case composition(Resource)
//  case conceptMap(ConceptMap)
  case conceptMap(Resource)
//  case condition(Condition)
  case condition(Resource)
//  case consent(Consent)
  case consent(Resource)
//  case contract(Contract)
  case contract(Resource)
//  case coverage(Coverage)
  case coverage(Resource)
//  case coverageEligibilityRequest(CoverageEligibilityRequest)
  case coverageEligibilityRequest(Resource)
//  case coverageEligibilityResponse(CoverageEligibilityResponse)
  case coverageEligibilityResponse(Resource)
//  case detectedIssue(DetectedIssue)
  case detectedIssue(Resource)
//  case device(Device)
  case device(Resource)
//  case deviceDefinition(DeviceDefinition)
  case deviceDefinition(Resource)
//  case deviceMetric(DeviceMetric)
  case deviceMetric(Resource)
//  case deviceRequest(DeviceRequest)
  case deviceRequest(Resource)
//  case deviceUseStatement(DeviceUseStatement)
  case deviceUseStatement(Resource)
//  case diagnosticReport(DiagnosticReport)
  case diagnosticReport(Resource)
//  case documentManifest(DocumentManifest)
  case documentManifest(Resource)
//  case documentReference(DocumentReference)
  case documentReference(Resource)
  case domainResource(DomainResource)
//  case effectEvidenceSynthesis(EffectEvidenceSynthesis)
  case effectEvidenceSynthesis(Resource)
//  case encounter(Encounter)
  case encounter(Resource)
//  case endpoint(Endpoint)
  case endpoint(Resource)
//  case enrollmentRequest(EnrollmentRequest)
  case enrollmentRequest(Resource)
//  case enrollmentResponse(EnrollmentResponse)
  case enrollmentResponse(Resource)
//  case episodeOfCare(EpisodeOfCare)
  case episodeOfCare(Resource)
//  case eventDefinition(EventDefinition)
  case eventDefinition(Resource)
//  case evidence(Evidence)
  case evidence(Resource)
//  case evidenceVariable(EvidenceVariable)
  case evidenceVariable(Resource)
//  case explanationOfBenefit(ExplanationOfBenefit)
  case explanationOfBenefit(Resource)
//  case familyMemberHistory(FamilyMemberHistory)
  case familyMemberHistory(Resource)
//  case flag(Flag)
  case flag(Resource)
//  case goal(Goal)
  case goal(Resource)
//  case graphDefinition(GraphDefinition)
  case graphDefinition(Resource)
//  case group(Group)
  case group(Resource)
//  case guidanceResponse(GuidanceResponse)
  case guidanceResponse(Resource)
//  case healthcareService(HealthcareService)
  case healthcareService(Resource)
//  case imagingStudy(ImagingStudy)
  case imagingStudy(Resource)
//  case immunization(Immunization)
  case immunization(Resource)
//  case immunizationEvaluation(ImmunizationEvaluation)
  case immunizationEvaluation(Resource)
//  case immunizationRecommendation(ImmunizationRecommendation)
  case immunizationRecommendation(Resource)
//  case implementationGuide(ImplementationGuide)
  case implementationGuide(Resource)
//  case insurancePlan(InsurancePlan)
  case insurancePlan(Resource)
//  case invoice(Invoice)
  case invoice(Resource)
//  case library(Library)
  case library(Resource)
//  case linkage(Linkage)
  case linkage(Resource)
//  case list(List)
  case list(Resource)
//  case location(Location)
  case location(Resource)
//  case measure(Measure)
  case measure(Resource)
//  case measureReport(MeasureReport)
  case measureReport(Resource)
//  case media(Media)
  case media(Resource)
//  case medication(Medication)
  case medication(Resource)
//  case medicationAdministration(MedicationAdministration)
  case medicationAdministration(Resource)
//  case medicationDispense(MedicationDispense)
  case medicationDispense(Resource)
//  case medicationKnowledge(MedicationKnowledge)
  case medicationKnowledge(Resource)
//  case medicationRequest(MedicationRequest)
  case medicationRequest(Resource)
//  case medicationStatement(MedicationStatement)
  case medicationStatement(Resource)
//  case medicinalProduct(MedicinalProduct)
  case medicinalProduct(Resource)
//  case medicinalProductAuthorization(MedicinalProductAuthorization)
  case medicinalProductAuthorization(Resource)
//  case medicinalProductContraindication(MedicinalProductContraindication)
  case medicinalProductContraindication(Resource)
//  case medicinalProductIndication(MedicinalProductIndication)
  case medicinalProductIndication(Resource)
//  case medicinalProductIngredient(MedicinalProductIngredient)
  case medicinalProductIngredient(Resource)
//  case medicinalProductInteraction(MedicinalProductInteraction)
  case medicinalProductInteraction(Resource)
//  case medicinalProductManufactured(MedicinalProductManufactured)
  case medicinalProductManufactured(Resource)
//  case medicinalProductPackaged(MedicinalProductPackaged)
  case medicinalProductPackaged(Resource)
//  case medicinalProductPharmaceutical(MedicinalProductPharmaceutical)
  case medicinalProductPharmaceutical(Resource)
//  case medicinalProductUndesirableEffect(MedicinalProductUndesirableEffect)
  case medicinalProductUndesirableEffect(Resource)
//  case messageDefinition(MessageDefinition)
  case messageDefinition(Resource)
//  case messageHeader(MessageHeader)
  case messageHeader(Resource)
//  case molecularSequence(MolecularSequence)
  case molecularSequence(Resource)
//  case namingSystem(NamingSystem)
  case namingSystem(Resource)
//  case nutritionOrder(NutritionOrder)
  case nutritionOrder(Resource)
//  case observation(Observation)
  case observation(Resource)
//  case observationDefinition(ObservationDefinition)
  case observationDefinition(Resource)
//  case operationDefinition(OperationDefinition)
  case operationDefinition(Resource)
//  case operationOutcome(OperationOutcome)
  case operationOutcome(Resource)
//  case organization(Organization)
  case organization(Resource)
//  case organizationAffiliation(OrganizationAffiliation)
  case organizationAffiliation(Resource)
//  case parameters(Parameters)
  case parameters(Resource)
//  case patient(Patient)
  case patient(Resource)
//  case paymentNotice(PaymentNotice)
  case paymentNotice(Resource)
//  case paymentReconciliation(PaymentReconciliation)
  case paymentReconciliation(Resource)
//  case person(Person)
  case person(Resource)
//  case planDefinition(PlanDefinition)
  case planDefinition(Resource)
//  case practitioner(Practitioner)
  case practitioner(Resource)
//  case practitionerRole(PractitionerRole)
  case practitionerRole(Resource)
//  case procedure(Procedure)
  case procedure(Resource)
//  case provenance(Provenance)
  case provenance(Resource)
//  case questionnaire(Questionnaire)
  case questionnaire(Resource)
//  case questionnaireResponse(QuestionnaireResponse)
  case questionnaireResponse(Resource)
//  case relatedPerson(RelatedPerson)
  case relatedPerson(Resource)
//  case requestGroup(RequestGroup)
  case requestGroup(Resource)
//  case researchDefinition(ResearchDefinition)
  case researchDefinition(Resource)
//  case researchElementDefinition(ResearchElementDefinition)
  case researchElementDefinition(Resource)
//  case researchStudy(ResearchStudy)
  case researchStudy(Resource)
//  case researchSubject(ResearchSubject)
  case researchSubject(Resource)
  case resource(Resource)
//  case riskAssessment(RiskAssessment)
  case riskAssessment(Resource)
//  case riskEvidenceSynthesis(RiskEvidenceSynthesis)
  case riskEvidenceSynthesis(Resource)
//  case schedule(Schedule)
  case schedule(Resource)
//  case searchParameter(SearchParameter)
  case searchParameter(Resource)
//  case serviceRequest(ServiceRequest)
  case serviceRequest(Resource)
//  case slot(Slot)
  case slot(Resource)
//  case specimen(Specimen)
  case specimen(Resource)
//  case specimenDefinition(SpecimenDefinition)
  case specimenDefinition(Resource)
//  case structureDefinition(StructureDefinition)
  case structureDefinition(Resource)
//  case structureMap(StructureMap)
  case structureMap(Resource)
//  case subscription(Subscription)
  case subscription(Resource)
//  case substance(Substance)
  case substance(Resource)
//  case substanceNucleicAcid(SubstanceNucleicAcid)
  case substanceNucleicAcid(Resource)
//  case substancePolymer(SubstancePolymer)
  case substancePolymer(Resource)
//  case substanceProtein(SubstanceProtein)
  case substanceProtein(Resource)
//  case substanceReferenceInformation(SubstanceReferenceInformation)
  case substanceReferenceInformation(Resource)
//  case substanceSourceMaterial(SubstanceSourceMaterial)
  case substanceSourceMaterial(Resource)
//  case substanceSpecification(SubstanceSpecification)
  case substanceSpecification(Resource)
//  case supplyDelivery(SupplyDelivery)
  case supplyDelivery(Resource)
//  case supplyRequest(SupplyRequest)
  case supplyRequest(Resource)
//  case task(Task)
  case task(Resource)
//  case terminologyCapabilities(TerminologyCapabilities)
  case terminologyCapabilities(Resource)
//  case testReport(TestReport)
  case testReport(Resource)
//  case testScript(TestScript)
  case testScript(Resource)
//  case valueSet(ValueSet)
  case valueSet(Resource)
//  case verificationResult(VerificationResult)
  case verificationResult(Resource)
//  case visionPrescription(VisionPrescription)
  case visionPrescription(Resource)
  case unrecognized(Resource)
  
  // swiftlint:disable:cyclomatic_complexity
  public var resourceType: String {
    switch self {
    case .account:
      return "Account"
    case .activityDefinition:
      return "ActivityDefinition"
    case .adverseEvent:
      return "AdverseEvent"
    case .allergyIntolerance:
      return "AllergyIntolerance"
    case .appointment:
      return "Appointment"
    case .appointmentResponse:
      return "AppointmentResponse"
    case .auditEvent:
      return "AuditEvent"
    case .basic:
      return "Basic"
    case .binary:
      return "Binary"
    case .biologicallyDerivedProduct:
      return "BiologicallyDerivedProduct"
    case .bodyStructure:
      return "BodyStructure"
    case .bundle:
      return "Bundle"
    case .capabilityStatement:
      return "CapabilityStatement"
    case .carePlan:
      return "CarePlan"
    case .careTeam:
      return "CareTeam"
    case .catalogEntry:
      return "CatalogEntry"
    case .chargeItem:
      return "ChargeItem"
    case .chargeItemDefinition:
      return "ChargeItemDefinition"
    case .claim:
      return "Claim"
    case .claimResponse:
      return "ClaimResponse"
    case .clinicalImpression:
      return "ClinicalImpression"
    case .codeSystem:
      return "CodeSystem"
    case .communication:
      return "Communication"
    case .communicationRequest:
      return "CommunicationRequest"
    case .compartmentDefinition:
      return "CompartmentDefinition"
    case .composition:
      return "Composition"
    case .conceptMap:
      return "ConceptMap"
    case .condition:
      return "Condition"
    case .consent:
      return "Consent"
    case .contract:
      return "Contract"
    case .coverage:
      return "Coverage"
    case .coverageEligibilityRequest:
      return "CoverageEligibilityRequest"
    case .coverageEligibilityResponse:
      return "CoverageEligibilityResponse"
    case .detectedIssue:
      return "DetectedIssue"
    case .device:
      return "Device"
    case .deviceDefinition:
      return "DeviceDefinition"
    case .deviceMetric:
      return "DeviceMetric"
    case .deviceRequest:
      return "DeviceRequest"
    case .deviceUseStatement:
      return "DeviceUseStatement"
    case .diagnosticReport:
      return "DiagnosticReport"
    case .documentManifest:
      return "DocumentManifest"
    case .documentReference:
      return "DocumentReference"
    case .domainResource:
      return "DomainResource"
    case .effectEvidenceSynthesis:
      return "EffectEvidenceSynthesis"
    case .encounter:
      return "Encounter"
    case .endpoint:
      return "Endpoint"
    case .enrollmentRequest:
      return "EnrollmentRequest"
    case .enrollmentResponse:
      return "EnrollmentResponse"
    case .episodeOfCare:
      return "EpisodeOfCare"
    case .eventDefinition:
      return "EventDefinition"
    case .evidence:
      return "Evidence"
    case .evidenceVariable:
      return "EvidenceVariable"
    case .explanationOfBenefit:
      return "ExplanationOfBenefit"
    case .familyMemberHistory:
      return "FamilyMemberHistory"
    case .flag:
      return "Flag"
    case .goal:
      return "Goal"
    case .graphDefinition:
      return "GraphDefinition"
    case .group:
      return "Group"
    case .guidanceResponse:
      return "GuidanceResponse"
    case .healthcareService:
      return "HealthcareService"
    case .imagingStudy:
      return "ImagingStudy"
    case .immunization:
      return "Immunization"
    case .immunizationEvaluation:
      return "ImmunizationEvaluation"
    case .immunizationRecommendation:
      return "ImmunizationRecommendation"
    case .implementationGuide:
      return "ImplementationGuide"
    case .insurancePlan:
      return "InsurancePlan"
    case .invoice:
      return "Invoice"
    case .library:
      return "Library"
    case .linkage:
      return "Linkage"
    case .list:
      return "List"
    case .location:
      return "Location"
    case .measure:
      return "Measure"
    case .measureReport:
      return "MeasureReport"
    case .media:
      return "Media"
    case .medication:
      return "Medication"
    case .medicationAdministration:
      return "MedicationAdministration"
    case .medicationDispense:
      return "MedicationDispense"
    case .medicationKnowledge:
      return "MedicationKnowledge"
    case .medicationRequest:
      return "MedicationRequest"
    case .medicationStatement:
      return "MedicationStatement"
    case .medicinalProduct:
      return "MedicinalProduct"
    case .medicinalProductAuthorization:
      return "MedicinalProductAuthorization"
    case .medicinalProductContraindication:
      return "MedicinalProductContraindication"
    case .medicinalProductIndication:
      return "MedicinalProductIndication"
    case .medicinalProductIngredient:
      return "MedicinalProductIngredient"
    case .medicinalProductInteraction:
      return "MedicinalProductInteraction"
    case .medicinalProductManufactured:
      return "MedicinalProductManufactured"
    case .medicinalProductPackaged:
      return "MedicinalProductPackaged"
    case .medicinalProductPharmaceutical:
      return "MedicinalProductPharmaceutical"
    case .medicinalProductUndesirableEffect:
      return "MedicinalProductUndesirableEffect"
    case .messageDefinition:
      return "MessageDefinition"
    case .messageHeader:
      return "MessageHeader"
    case .molecularSequence:
      return "MolecularSequence"
    case .namingSystem:
      return "NamingSystem"
    case .nutritionOrder:
      return "NutritionOrder"
    case .observation:
      return "Observation"
    case .observationDefinition:
      return "ObservationDefinition"
    case .operationDefinition:
      return "OperationDefinition"
    case .operationOutcome:
      return "OperationOutcome"
    case .organization:
      return "Organization"
    case .organizationAffiliation:
      return "OrganizationAffiliation"
    case .parameters:
      return "Parameters"
    case .patient:
      return "Patient"
    case .paymentNotice:
      return "PaymentNotice"
    case .paymentReconciliation:
      return "PaymentReconciliation"
    case .person:
      return "Person"
    case .planDefinition:
      return "PlanDefinition"
    case .practitioner:
      return "Practitioner"
    case .practitionerRole:
      return "PractitionerRole"
    case .procedure:
      return "Procedure"
    case .provenance:
      return "Provenance"
    case .questionnaire:
      return "Questionnaire"
    case .questionnaireResponse:
      return "QuestionnaireResponse"
    case .relatedPerson:
      return "RelatedPerson"
    case .requestGroup:
      return "RequestGroup"
    case .researchDefinition:
      return "ResearchDefinition"
    case .researchElementDefinition:
      return "ResearchElementDefinition"
    case .researchStudy:
      return "ResearchStudy"
    case .researchSubject:
      return "ResearchSubject"
    case .resource:
      return "Resource"
    case .riskAssessment:
      return "RiskAssessment"
    case .riskEvidenceSynthesis:
      return "RiskEvidenceSynthesis"
    case .schedule:
      return "Schedule"
    case .searchParameter:
      return "SearchParameter"
    case .serviceRequest:
      return "ServiceRequest"
    case .slot:
      return "Slot"
    case .specimen:
      return "Specimen"
    case .specimenDefinition:
      return "SpecimenDefinition"
    case .structureDefinition:
      return "StructureDefinition"
    case .structureMap:
      return "StructureMap"
    case .subscription:
      return "Subscription"
    case .substance:
      return "Substance"
    case .substanceNucleicAcid:
      return "SubstanceNucleicAcid"
    case .substancePolymer:
      return "SubstancePolymer"
    case .substanceProtein:
      return "SubstanceProtein"
    case .substanceReferenceInformation:
      return "SubstanceReferenceInformation"
    case .substanceSourceMaterial:
      return "SubstanceSourceMaterial"
    case .substanceSpecification:
      return "SubstanceSpecification"
    case .supplyDelivery:
      return "SupplyDelivery"
    case .supplyRequest:
      return "SupplyRequest"
    case .task:
      return "Task"
    case .terminologyCapabilities:
      return "TerminologyCapabilities"
    case .testReport:
      return "TestReport"
    case .testScript:
      return "TestScript"
    case .valueSet:
      return "ValueSet"
    case .verificationResult:
      return "VerificationResult"
    case .visionPrescription:
      return "VisionPrescription"
    case .unrecognized:
      return "Resource"
    }
  }
  
  // MARK: -
  // swiftlint:disable force_cast cyclomatic_complexity
  public init(with resource: Resource) {
    switch type(of: resource).resourceType {
    case .account:
      self = .account(resource as! Account)
    case .activityDefinition:
      self = .activityDefinition(resource as! ActivityDefinition)
    case .adverseEvent:
        self = .adverseEvent(resource) // todo
    case .allergyIntolerance:
      self = .allergyIntolerance(resource) // todo
    case .appointment:
      self = .appointment(resource) // todo
    case .appointmentResponse:
      self = .appointmentResponse(resource) // todo
    case .auditEvent:
      self = .auditEvent(resource) // todo
    case .basic:
      self = .basic(resource) // todo
    case .binary:
      self = .binary(resource) // todo
    case .biologicallyDerivedProduct:
      self = .biologicallyDerivedProduct(resource) // todo
    case .bodyStructure:
      self = .bodyStructure(resource) // todo
    case .bundle:
      self = .bundle(resource) // todo
    case .capabilityStatement:
      self = .capabilityStatement(resource) // todo
    case .carePlan:
      self = .carePlan(resource) // todo
    case .careTeam:
      self = .careTeam(resource) // todo
    case .catalogEntry:
      self = .catalogEntry(resource) // todo
    case .chargeItem:
      self = .chargeItem(resource) // todo
    case .chargeItemDefinition:
      self = .chargeItemDefinition(resource) // todo
    case .claim:
      self = .claim(resource) // todo
    case .claimResponse:
      self = .claimResponse(resource) // todo
    case .clinicalImpression:
      self = .clinicalImpression(resource) // todo
    case .codeSystem:
        self = .codeSystem(resource as! CodeSystem)
    case .communication:
      self = .communication(resource) // todo
    case .communicationRequest:
      self = .communicationRequest(resource) // todo
    case .compartmentDefinition:
      self = .compartmentDefinition(resource) // todo
    case .composition:
      self = .composition(resource) // todo
    case .conceptMap:
      self = .conceptMap(resource) // todo
    case .condition:
      self = .condition(resource) // todo
    case .consent:
      self = .consent(resource) // todo
    case .contract:
      self = .contract(resource) // todo
    case .coverage:
      self = .coverage(resource) // todo
    case .coverageEligibilityRequest:
      self = .coverageEligibilityRequest(resource) // todo
    case .coverageEligibilityResponse:
      self = .coverageEligibilityResponse(resource) // todo
    case .detectedIssue:
        self = .detectedIssue(resource) // todo
    case .device:
      self = .device(resource) // todo
    case .deviceDefinition:
      self = .deviceDefinition(resource) // todo
    case .deviceMetric:
      self = .deviceMetric(resource) // todo
    case .deviceRequest:
      self = .deviceRequest(resource) // todo
    case .deviceUseStatement:
      self = .deviceUseStatement(resource) // todo
    case .diagnosticReport:
      self = .diagnosticReport(resource) // todo
    case .documentManifest:
      self = .documentManifest(resource) // todo
    case .documentReference:
      self = .documentReference(resource) // todo
    case .domainResource:
      self = .domainResource(resource as! DomainResource)
    case .effectEvidenceSynthesis:
      self = .effectEvidenceSynthesis(resource) // todo
    case .encounter:
      self = .encounter(resource) // todo
    case .endpoint:
      self = .endpoint(resource) // todo
    case .enrollmentRequest:
      self = .enrollmentRequest(resource) // todo
    case .enrollmentResponse:
      self = .enrollmentResponse(resource) // todo
    case .episodeOfCare:
      self = .episodeOfCare(resource) // todo
    case .eventDefinition:
      self = .eventDefinition(resource) // todo
    case .evidence:
      self = .evidence(resource) // todo
    case .evidenceVariable:
      self = .evidenceVariable(resource) // todo
    case .explanationOfBenefit:
      self = .explanationOfBenefit(resource) // todo
    case .familyMemberHistory:
      self = .familyMemberHistory(resource) // todo
    case .flag:
      self = .flag(resource) // todo
    case .goal:
      self = .goal(resource) // todo
    case .graphDefinition:
      self = .graphDefinition(resource) // todo
    case .group:
      self = .group(resource) // todo
    case .guidanceResponse:
      self = .guidanceResponse(resource) // todo
    case .healthcareService:
      self = .healthcareService(resource) // todo
    case .imagingStudy:
      self = .imagingStudy(resource) // todo
    case .immunization:
      self = .immunization(resource) // todo
    case .immunizationEvaluation:
      self = .immunizationEvaluation(resource) // todo
    case .immunizationRecommendation:
      self = .immunizationRecommendation(resource) // todo
    case .implementationGuide:
      self = .implementationGuide(resource) // todo
    case .insurancePlan:
      self = .insurancePlan(resource) // todo
    case .invoice:
      self = .invoice(resource) // todo
    case .library:
      self = .library(resource) // todo
    case .linkage:
      self = .linkage(resource) // todo
    case .list:
      self = .list(resource) // todo
    case .location:
      self = .location(resource) // todo
    case .measure:
      self = .measure(resource) // todo
    case .measureReport:
      self = .measureReport(resource) // todo
    case .media:
      self = .media(resource) // todo
    case .medication:
      self = .medication(resource) // todo
    case .medicationAdministration:
      self = .medicationAdministration(resource) // todo
    case .medicationDispense:
      self = .medicationDispense(resource) // todo
    case .medicationKnowledge:
      self = .medicationKnowledge(resource) // todo
    case .medicationRequest:
      self = .medicationRequest(resource) // todo
    case .medicationStatement:
      self = .medicationStatement(resource) // todo
    case .medicinalProduct:
      self = .medicinalProduct(resource) // todo
    case .medicinalProductAuthorization:
      self = .medicinalProductAuthorization(resource) // todo
    case .medicinalProductContraindication:
      self = .medicinalProductContraindication(resource) // todo
    case .medicinalProductIndication:
      self = .medicinalProductIndication(resource) // todo
    case .medicinalProductIngredient:
      self = .medicinalProductIngredient(resource) // todo
    case .medicinalProductInteraction:
      self = .medicinalProductInteraction(resource) // todo
    case .medicinalProductManufactured:
      self = .medicinalProductManufactured(resource) // todo
    case .medicinalProductPackaged:
      self = .medicinalProductPackaged(resource) // todo
    case .medicinalProductPharmaceutical:
      self = .medicinalProductPharmaceutical(resource) // todo
    case .medicinalProductUndesirableEffect:
      self = .medicinalProductUndesirableEffect(resource) // todo
    case .messageDefinition:
      self = .messageDefinition(resource) // todo
    case .messageHeader:
      self = .messageHeader(resource) // todo
    case .molecularSequence:
      self = .molecularSequence(resource) // todo
    case .namingSystem:
      self = .namingSystem(resource) // todo
    case .nutritionOrder:
      self = .nutritionOrder(resource) // todo
    case .observation:
      self = .observation(resource) // todo
    case .observationDefinition:
      self = .observationDefinition(resource) // todo
    case .operationDefinition:
      self = .operationDefinition(resource) // todo
    case .operationOutcome:
    self = .operationOutcome(resource) // todo
    case .organization:
      self = .organization(resource) // todo
    case .organizationAffiliation:
      self = .organizationAffiliation(resource) // todo
    case .parameters:
      self = .parameters(resource) // todo
    case .patient:
      self = .patient(resource) // todo
    case .paymentNotice:
      self = .paymentNotice(resource) // todo
    case .paymentReconciliation:
      self = .paymentReconciliation(resource) // todo
    case .person:
      self = .person(resource) // todo
    case .planDefinition:
      self = .planDefinition(resource) // todo
    case .practitioner:
      self = .practitioner(resource) // todo
    case .practitionerRole:
      self = .practitionerRole(resource) // todo
    case .procedure:
      self = .procedure(resource) // todo
    case .provenance:
      self = .provenance(resource) // todo
    case .questionnaire:
      self = .questionnaire(resource) // todo
    case .questionnaireResponse:
      self = .questionnaireResponse(resource) // todo
    case .relatedPerson:
      self = .relatedPerson(resource) // todo
    case .requestGroup:
      self = .requestGroup(resource) // todo
    case .researchDefinition:
      self = .researchDefinition(resource) // todo
    case .researchElementDefinition:
      self = .researchElementDefinition(resource) // todo
    case .researchStudy:
      self = .researchStudy(resource) // todo
    case .researchSubject:
      self = .researchSubject(resource) // todo
    case .resource:
      self = .resource(resource)
    case .riskAssessment:
      self = .riskAssessment(resource) // todo
    case .riskEvidenceSynthesis:
      self = .riskEvidenceSynthesis(resource) // todo
    case .schedule:
      self = .schedule(resource) // todo
    case .searchParameter:
      self = .searchParameter(resource) // todo
    case .serviceRequest:
      self = .serviceRequest(resource) // todo
    case .slot:
      self = .slot(resource) // todo
    case .specimen:
      self = .specimen(resource) // todo
    case .specimenDefinition:
      self = .specimenDefinition(resource) // todo
    case .structureDefinition:
      self = .structureDefinition(resource) // todo
    case .structureMap:
      self = .structureMap(resource) // todo
    case .subscription:
      self = .subscription(resource) // todo
    case .substance:
      self = .substance(resource) // todo
    case .substanceNucleicAcid:
      self = .substanceNucleicAcid(resource) // todo
    case .substancePolymer:
      self = .substancePolymer(resource) // todo
    case .substanceProtein:
      self = .substanceProtein(resource) // todo
    case .substanceReferenceInformation:
      self = .substanceReferenceInformation(resource) // todo
    case .substanceSourceMaterial:
      self = .substanceSourceMaterial(resource) // todo
    case .substanceSpecification:
      self = .substanceSpecification(resource) // todo
    case .supplyDelivery:
      self = .supplyDelivery(resource) // todo
    case .supplyRequest:
      self = .supplyRequest(resource) // todo
    case .task:
      self = .task(resource) // todo
    case .terminologyCapabilities:
      self = .terminologyCapabilities(resource) // todo
    case .testReport:
      self = .testReport(resource) // todo
    case .testScript:
      self = .testScript(resource) // todo
    case .valueSet:
      self = .valueSet(resource) // todo
    case .verificationResult:
      self = .verificationResult(resource) // todo
    case .visionPrescription:
      self = .visionPrescription(resource) // todo
    }
  }
  
  public func get() -> Resource {
    switch self {
    case .account(let resource):
      return resource
    case .activityDefinition(let resource):
      return resource
    case .adverseEvent(let resource):
      return resource
    case .allergyIntolerance(let resource):
      return resource
    case .appointment(let resource):
      return resource
    case .appointmentResponse(let resource):
      return resource
    case .auditEvent(let resource):
      return resource
    case .basic(let resource):
      return resource
    case .binary(let resource):
      return resource
    case .biologicallyDerivedProduct(let resource):
      return resource
    case .bodyStructure(let resource):
      return resource
    case .bundle(let resource):
      return resource
    case .capabilityStatement(let resource):
      return resource
    case .carePlan(let resource):
      return resource
    case .careTeam(let resource):
      return resource
    case .catalogEntry(let resource):
      return resource
    case .chargeItem(let resource):
      return resource
    case .chargeItemDefinition(let resource):
      return resource
    case .claim(let resource):
      return resource
    case .claimResponse(let resource):
      return resource
    case .clinicalImpression(let resource):
      return resource
    case .codeSystem(let resource):
      return resource
    case .communication(let resource):
      return resource
    case .communicationRequest(let resource):
      return resource
    case .compartmentDefinition(let resource):
      return resource
    case .composition(let resource):
      return resource
    case .conceptMap(let resource):
      return resource
    case .condition(let resource):
      return resource
    case .consent(let resource):
      return resource
    case .contract(let resource):
      return resource
    case .coverage(let resource):
      return resource
    case .coverageEligibilityRequest(let resource):
      return resource
    case .coverageEligibilityResponse(let resource):
      return resource
    case .detectedIssue(let resource):
      return resource
    case .device(let resource):
      return resource
    case .deviceDefinition(let resource):
      return resource
    case .deviceMetric(let resource):
      return resource
    case .deviceRequest(let resource):
      return resource
    case .deviceUseStatement(let resource):
      return resource
    case .diagnosticReport(let resource):
      return resource
    case .documentManifest(let resource):
      return resource
    case .documentReference(let resource):
      return resource
    case .domainResource(let resource):
      return resource
    case .effectEvidenceSynthesis(let resource):
      return resource
    case .encounter(let resource):
      return resource
    case .endpoint(let resource):
      return resource
    case .enrollmentRequest(let resource):
      return resource
    case .enrollmentResponse(let resource):
      return resource
    case .episodeOfCare(let resource):
      return resource
    case .eventDefinition(let resource):
      return resource
    case .evidence(let resource):
      return resource
    case .evidenceVariable(let resource):
      return resource
    case .explanationOfBenefit(let resource):
      return resource
    case .familyMemberHistory(let resource):
      return resource
    case .flag(let resource):
      return resource
    case .goal(let resource):
      return resource
    case .graphDefinition(let resource):
      return resource
    case .group(let resource):
      return resource
    case .guidanceResponse(let resource):
      return resource
    case .healthcareService(let resource):
      return resource
    case .imagingStudy(let resource):
      return resource
    case .immunization(let resource):
      return resource
    case .immunizationEvaluation(let resource):
      return resource
    case .immunizationRecommendation(let resource):
      return resource
    case .implementationGuide(let resource):
      return resource
    case .insurancePlan(let resource):
      return resource
    case .invoice(let resource):
      return resource
    case .library(let resource):
      return resource
    case .linkage(let resource):
      return resource
    case .list(let resource):
      return resource
    case .location(let resource):
      return resource
    case .measure(let resource):
      return resource
    case .measureReport(let resource):
      return resource
    case .media(let resource):
      return resource
    case .medication(let resource):
      return resource
    case .medicationAdministration(let resource):
      return resource
    case .medicationDispense(let resource):
      return resource
    case .medicationKnowledge(let resource):
      return resource
    case .medicationRequest(let resource):
      return resource
    case .medicationStatement(let resource):
      return resource
    case .medicinalProduct(let resource):
      return resource
    case .medicinalProductAuthorization(let resource):
      return resource
    case .medicinalProductContraindication(let resource):
      return resource
    case .medicinalProductIndication(let resource):
      return resource
    case .medicinalProductIngredient(let resource):
      return resource
    case .medicinalProductInteraction(let resource):
      return resource
    case .medicinalProductManufactured(let resource):
      return resource
    case .medicinalProductPackaged(let resource):
      return resource
    case .medicinalProductPharmaceutical(let resource):
      return resource
    case .medicinalProductUndesirableEffect(let resource):
      return resource
    case .messageDefinition(let resource):
      return resource
    case .messageHeader(let resource):
      return resource
    case .molecularSequence(let resource):
      return resource
    case .namingSystem(let resource):
      return resource
    case .nutritionOrder(let resource):
      return resource
    case .observation(let resource):
      return resource
    case .observationDefinition(let resource):
      return resource
    case .operationDefinition(let resource):
      return resource
    case .operationOutcome(let resource):
      return resource
    case .organization(let resource):
      return resource
    case .organizationAffiliation(let resource):
      return resource
    case .parameters(let resource):
      return resource
    case .patient(let resource):
      return resource
    case .paymentNotice(let resource):
      return resource
    case .paymentReconciliation(let resource):
      return resource
    case .person(let resource):
      return resource
    case .planDefinition(let resource):
      return resource
    case .practitioner(let resource):
      return resource
    case .practitionerRole(let resource):
      return resource
    case .procedure(let resource):
      return resource
    case .provenance(let resource):
      return resource
    case .questionnaire(let resource):
      return resource
    case .questionnaireResponse(let resource):
      return resource
    case .relatedPerson(let resource):
      return resource
    case .requestGroup(let resource):
      return resource
    case .researchDefinition(let resource):
      return resource
    case .researchElementDefinition(let resource):
      return resource
    case .researchStudy(let resource):
      return resource
    case .researchSubject(let resource):
      return resource
    case .resource(let resource):
      return resource
    case .riskAssessment(let resource):
      return resource
    case .riskEvidenceSynthesis(let resource):
      return resource
    case .schedule(let resource):
      return resource
    case .searchParameter(let resource):
      return resource
    case .serviceRequest(let resource):
      return resource
    case .slot(let resource):
      return resource
    case .specimen(let resource):
      return resource
    case .specimenDefinition(let resource):
      return resource
    case .structureDefinition(let resource):
      return resource
    case .structureMap(let resource):
      return resource
    case .subscription(let resource):
      return resource
    case .substance(let resource):
      return resource
    case .substanceNucleicAcid(let resource):
      return resource
    case .substancePolymer(let resource):
      return resource
    case .substanceProtein(let resource):
      return resource
    case .substanceReferenceInformation(let resource):
      return resource
    case .substanceSourceMaterial(let resource):
      return resource
    case .substanceSpecification(let resource):
      return resource
    case .supplyDelivery(let resource):
      return resource
    case .supplyRequest(let resource):
      return resource
    case .task(let resource):
      return resource
    case .terminologyCapabilities(let resource):
      return resource
    case .testReport(let resource):
      return resource
    case .testScript(let resource):
      return resource
    case .valueSet(let resource):
      return resource
    case .verificationResult(let resource):
      return resource
    case .visionPrescription(let resource):
      return resource
    case .unrecognized(let resource):
      return resource
    }
  }
  
  public func get<_Type: Resource>(if type: _Type.Type) -> _Type? {
    guard let resource = get() as? _Type else {
      return nil
    }
    return resource
  }
  
    // MARK: - Codable
  
  private enum CodingKeys: String, CodingKey {
    case resourceType
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    switch try container.decode(String.self, forKey: .resourceType) {
    case "Account":
      self = .account(try Account(from: decoder))
    case "ActivityDefinition":
      self = .activityDefinition(try ActivityDefinition(from: decoder))
//    case "AdverseEvent":
//      self = .adverseEvent(try AdverseEvent(from: decoder))
//    case "AllergyIntolerance":
//      self = .allergyIntolerance(try AllergyIntolerance(from: decoder))
//    case "Appointment":
//      self = .appointment(try Appointment(from: decoder))
//    case "AppointmentResponse":
//      self = .appointmentResponse(try AppointmentResponse(from: decoder))
//    case "AuditEvent":
//      self = .auditEvent(try AuditEvent(from: decoder))
//    case "Basic":
//      self = .basic(try Basic(from: decoder))
//    case "Binary":
//      self = .binary(try Binary(from: decoder))
//    case "BiologicallyDerivedProduct":
//      self = .biologicallyDerivedProduct(try BiologicallyDerivedProduct(from: decoder))
//    case "BodyStructure":
//      self = .bodyStructure(try BodyStructure(from: decoder))
//    case "Bundle":
//      self = .bundle(try Bundle(from: decoder))
//    case "CapabilityStatement":
//      self = .capabilityStatement(try CapabilityStatement(from: decoder))
//    case "CarePlan":
//      self = .carePlan(try CarePlan(from: decoder))
//    case "CareTeam":
//      self = .careTeam(try CareTeam(from: decoder))
//    case "CatalogEntry":
//      self = .catalogEntry(try CatalogEntry(from: decoder))
//    case "ChargeItem":
//      self = .chargeItem(try ChargeItem(from: decoder))
//    case "ChargeItemDefinition":
//      self = .chargeItemDefinition(try ChargeItemDefinition(from: decoder))
//    case "Claim":
//      self = .claim(try Claim(from: decoder))
//    case "ClaimResponse":
//      self = .claimResponse(try ClaimResponse(from: decoder))
//    case "ClinicalImpression":
//      self = .clinicalImpression(try ClinicalImpression(from: decoder))
    case "CodeSystem":
      self = .codeSystem(try CodeSystem(from: decoder))
//    case "Communication":
//      self = .communication(try Communication(from: decoder))
//    case "CommunicationRequest":
//      self = .communicationRequest(try CommunicationRequest(from: decoder))
//    case "CompartmentDefinition":
//      self = .compartmentDefinition(try CompartmentDefinition(from: decoder))
//    case "Composition":
//      self = .composition(try Composition(from: decoder))
//    case "ConceptMap":
//      self = .conceptMap(try ConceptMap(from: decoder))
//    case "Condition":
//      self = .condition(try Condition(from: decoder))
//    case "Consent":
//      self = .consent(try Consent(from: decoder))
//    case "Contract":
//      self = .contract(try Contract(from: decoder))
//    case "Coverage":
//      self = .coverage(try Coverage(from: decoder))
//    case "CoverageEligibilityRequest":
//      self = .coverageEligibilityRequest(try CoverageEligibilityRequest(from: decoder))
//    case "CoverageEligibilityResponse":
//      self = .coverageEligibilityResponse(try CoverageEligibilityResponse(from: decoder))
//    case "DetectedIssue":
//      self = .detectedIssue(try DetectedIssue(from: decoder))
//    case "Device":
//      self = .device(try Device(from: decoder))
//    case "DeviceDefinition":
//      self = .deviceDefinition(try DeviceDefinition(from: decoder))
//    case "DeviceMetric":
//      self = .deviceMetric(try DeviceMetric(from: decoder))
//    case "DeviceRequest":
//      self = .deviceRequest(try DeviceRequest(from: decoder))
//    case "DeviceUseStatement":
//      self = .deviceUseStatement(try DeviceUseStatement(from: decoder))
//    case "DiagnosticReport":
//      self = .diagnosticReport(try DiagnosticReport(from: decoder))
//    case "DocumentManifest":
//      self = .documentManifest(try DocumentManifest(from: decoder))
//    case "DocumentReference":
//      self = .documentReference(try DocumentReference(from: decoder))
    case "DomainResource":
      self = .domainResource(try DomainResource(from: decoder))
//    case "EffectEvidenceSynthesis":
//      self = .effectEvidenceSynthesis(try EffectEvidenceSynthesis(from: decoder))
//    case "Encounter":
//      self = .encounter(try Encounter(from: decoder))
//    case "Endpoint":
//      self = .endpoint(try Endpoint(from: decoder))
//    case "EnrollmentRequest":
//      self = .enrollmentRequest(try EnrollmentRequest(from: decoder))
//    case "EnrollmentResponse":
//      self = .enrollmentResponse(try EnrollmentResponse(from: decoder))
//    case "EpisodeOfCare":
//      self = .episodeOfCare(try EpisodeOfCare(from: decoder))
//    case "EventDefinition":
//      self = .eventDefinition(try EventDefinition(from: decoder))
//    case "Evidence":
//      self = .evidence(try Evidence(from: decoder))
//    case "EvidenceVariable":
//      self = .evidenceVariable(try EvidenceVariable(from: decoder))
//    case "ExampleScenario":
//      self = .exampleScenario(try ExampleScenario(from: decoder))
//    case "ExplanationOfBenefit":
//      self = .explanationOfBenefit(try ExplanationOfBenefit(from: decoder))
//    case "FamilyMemberHistory":
//      self = .familyMemberHistory(try FamilyMemberHistory(from: decoder))
//    case "Flag":
//      self = .flag(try Flag(from: decoder))
//    case "Goal":
//      self = .goal(try Goal(from: decoder))
//    case "GraphDefinition":
//      self = .graphDefinition(try GraphDefinition(from: decoder))
//    case "Group":
//      self = .group(try Group(from: decoder))
//    case "GuidanceResponse":
//      self = .guidanceResponse(try GuidanceResponse(from: decoder))
//    case "HealthcareService":
//      self = .healthcareService(try HealthcareService(from: decoder))
//    case "ImagingStudy":
//      self = .imagingStudy(try ImagingStudy(from: decoder))
//    case "Immunization":
//      self = .immunization(try Immunization(from: decoder))
//    case "ImmunizationEvaluation":
//      self = .immunizationEvaluation(try ImmunizationEvaluation(from: decoder))
//    case "ImmunizationRecommendation":
//      self = .immunizationRecommendation(try ImmunizationRecommendation(from: decoder))
//    case "ImplementationGuide":
//      self = .implementationGuide(try ImplementationGuide(from: decoder))
//    case "InsurancePlan":
//      self = .insurancePlan(try InsurancePlan(from: decoder))
//    case "Invoice":
//      self = .invoice(try Invoice(from: decoder))
//    case "Library":
//      self = .library(try Library(from: decoder))
//    case "Linkage":
//      self = .linkage(try Linkage(from: decoder))
//    case "List":
//      self = .list(try List(from: decoder))
//    case "Location":
//      self = .location(try Location(from: decoder))
//    case "Measure":
//      self = .measure(try Measure(from: decoder))
//    case "MeasureReport":
//      self = .measureReport(try MeasureReport(from: decoder))
//    case "Media":
//      self = .media(try Media(from: decoder))
//    case "Medication":
//      self = .medication(try Medication(from: decoder))
//    case "MedicationAdministration":
//      self = .medicationAdministration(try MedicationAdministration(from: decoder))
//    case "MedicationDispense":
//      self = .medicationDispense(try MedicationDispense(from: decoder))
//    case "MedicationKnowledge":
//      self = .medicationKnowledge(try MedicationKnowledge(from: decoder))
//    case "MedicationRequest":
//      self = .medicationRequest(try MedicationRequest(from: decoder))
//    case "MedicationStatement":
//      self = .medicationStatement(try MedicationStatement(from: decoder))
//    case "MedicinalProduct":
//      self = .medicinalProduct(try MedicinalProduct(from: decoder))
//    case "MedicinalProductAuthorization":
//      self = .medicinalProductAuthorization(try MedicinalProductAuthorization(from: decoder))
//    case "MedicinalProductContraindication":
//      self = .medicinalProductContraindication(try MedicinalProductContraindication(from: decoder))
//    case "MedicinalProductIndication":
//      self = .medicinalProductIndication(try MedicinalProductIndication(from: decoder))
//    case "MedicinalProductIngredient":
//      self = .medicinalProductIngredient(try MedicinalProductIngredient(from: decoder))
//    case "MedicinalProductInteraction":
//      self = .medicinalProductInteraction(try MedicinalProductInteraction(from: decoder))
//    case "MedicinalProductManufactured":
//      self = .medicinalProductManufactured(try MedicinalProductManufactured(from: decoder))
//    case "MedicinalProductPackaged":
//      self = .medicinalProductPackaged(try MedicinalProductPackaged(from: decoder))
//    case "MedicinalProductPharmaceutical":
//      self = .medicinalProductPharmaceutical(try MedicinalProductPharmaceutical(from: decoder))
//    case "MedicinalProductUndesirableEffect":
//      self = .medicinalProductUndesirableEffect(try MedicinalProductUndesirableEffect(from: decoder))
//    case "MessageDefinition":
//      self = .messageDefinition(try MessageDefinition(from: decoder))
//    case "MessageHeader":
//      self = .messageHeader(try MessageHeader(from: decoder))
//    case "MolecularSequence":
//      self = .molecularSequence(try MolecularSequence(from: decoder))
//    case "NamingSystem":
//      self = .namingSystem(try NamingSystem(from: decoder))
//    case "NutritionOrder":
//      self = .nutritionOrder(try NutritionOrder(from: decoder))
//    case "Observation":
//      self = .observation(try Observation(from: decoder))
//    case "ObservationDefinition":
//      self = .observationDefinition(try ObservationDefinition(from: decoder))
//    case "OperationDefinition":
//      self = .operationDefinition(try OperationDefinition(from: decoder))
//    case "OperationOutcome":
//      self = .operationOutcome(try OperationOutcome(from: decoder))
//    case "Organization":
//      self = .organization(try Organization(from: decoder))
//    case "OrganizationAffiliation":
//      self = .organizationAffiliation(try OrganizationAffiliation(from: decoder))
//    case "Parameters":
//      self = .parameters(try Parameters(from: decoder))
//    case "Patient":
//      self = .patient(try Patient(from: decoder))
//    case "PaymentNotice":
//      self = .paymentNotice(try PaymentNotice(from: decoder))
//    case "PaymentReconciliation":
//      self = .paymentReconciliation(try PaymentReconciliation(from: decoder))
//    case "Person":
//      self = .person(try Person(from: decoder))
//    case "PlanDefinition":
//      self = .planDefinition(try PlanDefinition(from: decoder))
//    case "Practitioner":
//      self = .practitioner(try Practitioner(from: decoder))
//    case "PractitionerRole":
//      self = .practitionerRole(try PractitionerRole(from: decoder))
//    case "Procedure":
//      self = .procedure(try Procedure(from: decoder))
//    case "Provenance":
//      self = .provenance(try Provenance(from: decoder))
//    case "Questionnaire":
//      self = .questionnaire(try Questionnaire(from: decoder))
//    case "QuestionnaireResponse":
//      self = .questionnaireResponse(try QuestionnaireResponse(from: decoder))
//    case "RelatedPerson":
//      self = .relatedPerson(try RelatedPerson(from: decoder))
//    case "RequestGroup":
//      self = .requestGroup(try RequestGroup(from: decoder))
//    case "ResearchDefinition":
//      self = .researchDefinition(try ResearchDefinition(from: decoder))
//    case "ResearchElementDefinition":
//      self = .researchElementDefinition(try ResearchElementDefinition(from: decoder))
//    case "ResearchStudy":
//      self = .researchStudy(try ResearchStudy(from: decoder))
//    case "ResearchSubject":
//      self = .researchSubject(try ResearchSubject(from: decoder))
    case "Resource":
      self = .resource(try Resource(from: decoder))
//    case "RiskAssessment":
//      self = .riskAssessment(try RiskAssessment(from: decoder))
//    case "RiskEvidenceSynthesis":
//      self = .riskEvidenceSynthesis(try RiskEvidenceSynthesis(from: decoder))
//    case "Schedule":
//      self = .schedule(try Schedule(from: decoder))
//    case "SearchParameter":
//      self = .searchParameter(try SearchParameter(from: decoder))
//    case "ServiceRequest":
//      self = .serviceRequest(try ServiceRequest(from: decoder))
//    case "Slot":
//      self = .slot(try Slot(from: decoder))
//    case "Specimen":
//      self = .specimen(try Specimen(from: decoder))
//    case "SpecimenDefinition":
//      self = .specimenDefinition(try SpecimenDefinition(from: decoder))
//    case "StructureDefinition":
//      self = .structureDefinition(try StructureDefinition(from: decoder))
//    case "StructureMap":
//      self = .structureMap(try StructureMap(from: decoder))
//    case "Subscription":
//      self = .subscription(try Subscription(from: decoder))
//    case "Substance":
//      self = .substance(try Substance(from: decoder))
//    case "SubstanceNucleicAcid":
//      self = .substanceNucleicAcid(try SubstanceNucleicAcid(from: decoder))
//    case "SubstancePolymer":
//      self = .substancePolymer(try SubstancePolymer(from: decoder))
//    case "SubstanceProtein":
//      self = .substanceProtein(try SubstanceProtein(from: decoder))
//    case "SubstanceReferenceInformation":
//      self = .substanceReferenceInformation(try SubstanceReferenceInformation(from: decoder))
//    case "SubstanceSourceMaterial":
//      self = .substanceSourceMaterial(try SubstanceSourceMaterial(from: decoder))
//    case "SubstanceSpecification":
//      self = .substanceSpecification(try SubstanceSpecification(from: decoder))
//    case "SupplyDelivery":
//      self = .supplyDelivery(try SupplyDelivery(from: decoder))
//    case "SupplyRequest":
//      self = .supplyRequest(try SupplyRequest(from: decoder))
//    case "Task":
//      self = .task(try Task(from: decoder))
//    case "TerminologyCapabilities":
//      self = .terminologyCapabilities(try TerminologyCapabilities(from: decoder))
//    case "TestReport":
//      self = .testReport(try TestReport(from: decoder))
//    case "TestScript":
//      self = .testScript(try TestScript(from: decoder))
//    case "ValueSet":
//      self = .valueSet(try ValueSet(from: decoder))
//    case "VerificationResult":
//      self = .verificationResult(try VerificationResult(from: decoder))
//    case "VisionPrescription":
//      self = .visionPrescription(try VisionPrescription(from: decoder))
    default:
      self = .unrecognized(try Resource(from: decoder))
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    try get().encode(to: encoder)
  }
}
