import "@azure-tools/typespec-client-generator-core";
import "./main.tsp";

using Azure.ClientGenerator.Core;
using Azure.Core;
using Microsoft.OperationalInsights;

// -----------------------------------------------------------------------------
// C# client customizations for the per-service QueryPacks package.
//
// Mirrors the QueryPacks-relevant csharp customizations from the previous
// combined OperationalInsights/client.tsp so consumers migrating from the old
// package keep the same type/member names. Also disambiguates the QueryPackQuery
// resource `id`/`properties` members that would otherwise collide with the ARM
// ResourceData base class.
// -----------------------------------------------------------------------------

@@clientName(LogAnalyticsQueryPackQuery, "LogAnalyticsQuery", "csharp");
@@clientName(
  LogAnalyticsQueryPackQuery.properties,
  "QueryProperties",
  "csharp"
);
@@clientName(
  LogAnalyticsQueryPackQueryProperties.id,
  "ApplicationId",
  "csharp"
);
@@alternateType(LogAnalyticsQueryPackQueryProperties.id, uuid, "csharp");
@@clientName(
  LogAnalyticsQueryPackQueryProperties.timeCreated,
  "CreatedOn",
  "csharp"
);
@@clientName(
  LogAnalyticsQueryPackQueryProperties.timeModified,
  "ModifiedOn",
  "csharp"
);
@@clientName(
  LogAnalyticsQueryPackQueryPropertiesRelated,
  "LogAnalyticsQueryRelatedMetadata",
  "csharp"
);
@@clientName(
  LogAnalyticsQueryPackQuerySearchProperties,
  "LogAnalyticsQuerySearchProperties",
  "csharp"
);
@@clientName(
  LogAnalyticsQueryPackQuerySearchPropertiesRelated,
  "LogAnalyticsQuerySearchRelatedMetadata",
  "csharp"
);

@@alternateType(LogAnalyticsQueryPackProperties.queryPackId, uuid, "csharp");
@@clientName(
  LogAnalyticsQueryPackProperties.timeCreated,
  "CreatedOn",
  "csharp"
);
@@clientName(
  LogAnalyticsQueryPackProperties.timeModified,
  "ModifiedOn",
  "csharp"
);

@@clientName(LogAnalyticsQueryPacks.search, "SearchQueries", "csharp");
@@clientName(
  QueryPacksOperationGroup.createOrUpdateWithoutName,
  "CreateOrUpdateWithoutNameQueryPack",
  "csharp"
);
