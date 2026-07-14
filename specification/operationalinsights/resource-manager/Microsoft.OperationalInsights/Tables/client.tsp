import "@azure-tools/typespec-client-generator-core";
import "./main.tsp";

using Azure.ClientGenerator.Core;
using Azure.Core;
using Microsoft.OperationalInsights;

// -----------------------------------------------------------------------------
// C# client customizations for the per-service Tables package.
//
// Mirrors the Tables-relevant csharp customizations from the previous combined
// OperationalInsights/client.tsp so consumers migrating from the old package keep
// the same `OperationalInsights*` type names and member shapes.
// -----------------------------------------------------------------------------

@@clientName(Table, "OperationalInsightsTable", "csharp");
@@clientName(Schema, "OperationalInsightsSchema", "csharp");
@@clientName(TablePlanEnum, "OperationalInsightsTablePlan", "csharp");
@@clientName(SearchResults, "OperationalInsightsTableSearchResults", "csharp");
@@clientName(RestoredLogs, "OperationalInsightsTableRestoredLogs", "csharp");
@@clientName(
  ResultStatistics,
  "OperationalInsightsTableResultStatistics",
  "csharp"
);
@@clientName(ResultStatistics.scannedGb, "ScannedGB", "csharp");
@@clientName(Column, "OperationalInsightsColumn", "csharp");
@@clientName(Column.type, "ColumnType", "csharp");
@@clientName(ColumnTypeEnum, "OperationalInsightsColumnType", "csharp");
@@clientName(
  ColumnDataTypeHintEnum,
  "OperationalInsightsColumnDataTypeHint",
  "csharp"
);
@@clientName(ColumnDataTypeHintEnum.ip, "IP", "csharp");
@@clientName(SourceEnum, "OperationalInsightsTableCreator", "csharp");
@@clientName(TableTypeEnum, "OperationalInsightsTableType", "csharp");
@@clientName(TableSubTypeEnum, "OperationalInsightsTableSubType", "csharp");

@@clientName(
  TableProperties.retentionInDaysAsDefault,
  "IsRetentionInDaysAsDefault",
  "csharp"
);
@@clientName(
  TableProperties.totalRetentionInDaysAsDefault,
  "IsTotalRetentionInDaysAsDefault",
  "csharp"
);
