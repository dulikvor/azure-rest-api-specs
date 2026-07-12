import "@azure-tools/typespec-client-generator-core";

using Azure.ClientGenerator.Core;
using Microsoft.OperationalInsights;

@@clientName(DataExports.createOrUpdate::parameters.resource, "parameters");
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserves x-ms-client-flatten on DataExport.properties from the 2025-07-01 API so the relocated SDK surface stays byte-identical; legacy flatten is retained only for back-compat, not added net-new."
@@Legacy.flattenProperty(DataExport.properties);
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserves x-ms-client-flatten on DataExportProperties.destination from the 2025-07-01 API so the relocated SDK surface stays byte-identical; legacy flatten is retained only for back-compat, not added net-new."
@@Legacy.flattenProperty(DataExportProperties.destination);
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserves x-ms-client-flatten on Destination.metaData from the 2025-07-01 API so the relocated SDK surface stays byte-identical; legacy flatten is retained only for back-compat, not added net-new."
@@Legacy.flattenProperty(Destination.metaData);

@@clientLocation(SummaryLogsOperationGroup.get, "SummaryLogs");
@@clientLocation(SummaryLogsOperationGroup.createOrUpdate, "SummaryLogs");
@@clientName(
  SummaryLogsOperationGroup.createOrUpdate::parameters.resource,
  "parameters"
);
@@clientLocation(SummaryLogsOperationGroup.delete, "SummaryLogs");
@@clientLocation(SummaryLogsOperationGroup.listByWorkspace, "SummaryLogs");
@@clientLocation(SummaryLogsOperationGroup.start, "SummaryLogs");
@@clientLocation(SummaryLogsOperationGroup.stop, "SummaryLogs");
@@clientLocation(SummaryLogsOperationGroup.retryBin, "SummaryLogs");
@@clientName(SummaryLogsOperationGroup.retryBin::parameters.body, "parameters");
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserves x-ms-client-flatten on SummaryLogs.properties from the 2025-07-01 API so the relocated SDK surface stays byte-identical; legacy flatten is retained only for back-compat, not added net-new."
@@Legacy.flattenProperty(SummaryLogs.properties);
