import "@azure-tools/typespec-client-generator-core";

using Azure.ClientGenerator.Core;
using Microsoft.OperationalInsights;

@@clientLocation(LogAnalyticsQueryPackQueries.get, "Queries");
@@clientLocation(LogAnalyticsQueryPackQueries.put, "Queries");
@@clientName(
  LogAnalyticsQueryPackQueries.put::parameters.resource,
  "QueryPayload"
);
@@clientLocation(LogAnalyticsQueryPackQueries.update, "Queries");
@@clientName(
  LogAnalyticsQueryPackQueries.update::parameters.properties,
  "QueryPayload"
);
@@clientLocation(LogAnalyticsQueryPackQueries.delete, "Queries");
@@clientLocation(LogAnalyticsQueryPackQueries.list, "Queries");
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserves x-ms-client-flatten on LogAnalyticsQueryPackQuery.properties from the 2025-07-01 API so the relocated SDK surface stays byte-identical; legacy flatten is retained only for back-compat, not added net-new."
@@Legacy.flattenProperty(LogAnalyticsQueryPackQuery.properties);

@@clientLocation(LogAnalyticsQueryPacks.get, "QueryPacks");
@@clientLocation(LogAnalyticsQueryPacks.createOrUpdate, "QueryPacks");
@@clientName(
  LogAnalyticsQueryPacks.createOrUpdate::parameters.resource,
  "LogAnalyticsQueryPackPayload"
);
@@clientLocation(LogAnalyticsQueryPacks.updateTags, "QueryPacks");
@@clientName(
  LogAnalyticsQueryPacks.updateTags::parameters.properties,
  "QueryPackTags"
);
@@clientLocation(LogAnalyticsQueryPacks.delete, "QueryPacks");
@@clientLocation(LogAnalyticsQueryPacks.listByResourceGroup, "QueryPacks");
@@clientLocation(LogAnalyticsQueryPacks.list, "QueryPacks");
@@clientLocation(LogAnalyticsQueryPacks.search, "Queries");
@@clientName(
  LogAnalyticsQueryPacks.search::parameters.body,
  "QuerySearchProperties"
);
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserves x-ms-client-flatten on LogAnalyticsQueryPack.properties from the 2025-07-01 API so the relocated SDK surface stays byte-identical; legacy flatten is retained only for back-compat, not added net-new."
@@Legacy.flattenProperty(LogAnalyticsQueryPack.properties);

@@clientName(
  QueryPacksOperationGroup.createOrUpdateWithoutName::parameters.body,
  "LogAnalyticsQueryPackPayload"
);
@@clientLocation(
  QueryPacksOperationGroup.createOrUpdateWithoutName,
  "QueryPacks"
);
