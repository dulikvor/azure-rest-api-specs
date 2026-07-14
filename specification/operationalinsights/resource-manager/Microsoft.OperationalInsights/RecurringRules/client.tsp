import "@azure-tools/typespec-client-generator-core";
import "./main.tsp";

using Azure.ClientGenerator.Core;
using Azure.Core;
using Microsoft.OperationalInsights;

// -----------------------------------------------------------------------------
// C# client customizations for the per-service RecurringRules package
// (data exports + summary rules).
//
// Mirrors the DataExport/SummaryLogs-relevant csharp customizations from the
// previous combined OperationalInsights/client.tsp so consumers migrating from
// the old package keep the same `OperationalInsights*` type names and member
// shapes. Also renames RuleDefinition (AZC0031: names ending in 'Definition').
// -----------------------------------------------------------------------------

@@clientName(DataExport, "OperationalInsightsDataExport", "csharp");
@@clientName(Type, "OperationalInsightsDataExportDestinationType", "csharp");
@@clientName(SummaryLogs, "OperationalInsightsSummaryLogs", "csharp");
@@clientName(
  SummaryLogsRetryBin,
  "OperationalInsightsSummaryLogsRetryBin",
  "csharp"
);
@@clientName(RuleDefinition, "OperationalInsightsSummaryRule", "csharp");
@@clientName(
  TimeSelectorEnum,
  "OperationalInsightsSummaryTimeSelector",
  "csharp"
);

// Summary-rule enums. In the previous combined package these were incorrectly
// C#-named with a NetworkSecurityPerimeter prefix even though they belong to
// SummaryLogs (summary rules) and have no relation to NSP. Give them accurate
// summary-rule names here.
@@clientName(
  ProvisioningStateEnum,
  "OperationalInsightsSummaryRuleProvisioningState",
  "csharp"
);
@@clientName(RuleTypeEnum, "OperationalInsightsSummaryRuleType", "csharp");
@@clientName(
  StatusCodeEnum,
  "OperationalInsightsSummaryRuleStatusCode",
  "csharp"
);

@@clientName(DataExportProperties.dataExportId, "DataExportId", "csharp");
@@alternateType(DataExportProperties.dataExportId, uuid, "csharp");
@@clientName(DataExportProperties.enable, "IsEnabled", "csharp");
@@clientName(DataExportProperties.createdDate, "CreatedOn", "csharp");
@@alternateType(DataExportProperties.createdDate, utcDateTime, "csharp");
@@clientName(DataExportProperties.lastModifiedDate, "LastModifiedOn", "csharp");
@@alternateType(
  DataExportProperties.lastModifiedDate,
  utcDateTime,
  "csharp"
);
@@clientName(Destination.type, "DestinationType", "csharp");
@@alternateType(Destination.resourceId, armResourceIdentifier, "csharp");
