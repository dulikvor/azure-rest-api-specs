import "@azure-tools/typespec-client-generator-core";
import "./main.tsp";

using Azure.ClientGenerator.Core;
using Azure.ClientGenerator.Core.Legacy;
using Azure.Core;
using Microsoft.OperationalInsights;

// -----------------------------------------------------------------------------
// C# client customizations for the per-service Workspaces package.
//
// These mirror the csharp `@@clientName` / `@@alternateType` customizations that
// previously lived in the combined OperationalInsights/client.tsp, scoped to the
// types and operations that belong to the Workspaces service slice. Preserving
// them keeps the public C# surface identical to the pre-split package, so the
// only consumer-facing break is the package rename itself.
// -----------------------------------------------------------------------------

// C# type names for migration parity with the previous AutoRest SDK.
@@clientName(DataSource, "OperationalInsightsDataSource", "csharp");
@@clientName(LinkedService, "OperationalInsightsLinkedService", "csharp");
@@clientName(
  LinkedStorageAccountsResource,
  "OperationalInsightsLinkedStorageAccounts",
  "csharp"
);
@@clientName(SavedSearch, "OperationalInsightsSavedSearch", "csharp");
@@clientName(Workspace, "OperationalInsightsWorkspace", "csharp");
@@clientName(StorageAccount, "OperationalInsightsStorageAccount", "csharp");
@@alternateType(StorageAccount.id, armResourceIdentifier, "csharp");

@@clientName(OperationStatus, "OperationalInsightsOperationStatus", "csharp");
@@clientName(OperationStatus.error, "ErrorResponse", "csharp");

@@alternateType(DataSource.etag, eTag, "csharp");
@@alternateType(SavedSearch.etag, eTag, "csharp");
@@alternateType(Workspace.etag, eTag, "csharp");
@@alternateType(StorageInsight.eTag, eTag, "csharp");
@@alternateType(
  Workspace.identity,
  Azure.ResourceManager.CommonTypes.ManagedServiceIdentity,
  "csharp"
);
@@alternateType(
  WorkspacePatch.identity,
  Azure.ResourceManager.CommonTypes.ManagedServiceIdentity,
  "csharp"
);

@@clientName(DataSourceKind, "OperationalInsightsDataSourceKind", "csharp");
@@clientName(
  DataIngestionStatus,
  "OperationalInsightsDataIngestionStatus",
  "csharp"
);
@@clientName(
  LinkedServiceEntityStatus,
  "OperationalInsightsLinkedServiceEntityStatus",
  "csharp"
);
@@clientName(MetricName, "OperationalInsightsMetricName", "csharp");
@@clientName(
  PrivateLinkScopedResource,
  "OperationalInsightsPrivateLinkScopedResourceInfo",
  "csharp"
);
@@clientName(
  PublicNetworkAccessType,
  "OperationalInsightsPublicNetworkAccessType",
  "csharp"
);
@@clientName(SkuNameEnum, "OperationalInsightsSkuName", "csharp");
@@clientName(Tag, "OperationalInsightsTag", "csharp");
@@clientName(WorkspaceCapping, "OperationalInsightsWorkspaceCapping", "csharp");
@@clientName(
  WorkspaceEntityStatus,
  "OperationalInsightsWorkspaceEntityStatus",
  "csharp"
);
@@clientName(
  WorkspaceFailoverProperties,
  "OperationalInsightsWorkspaceFailoverProperties",
  "csharp"
);
@@clientName(
  WorkspaceFailoverState,
  "OperationalInsightsWorkspaceFailoverState",
  "csharp"
);
@@clientName(
  WorkspaceFeatures,
  "OperationalInsightsWorkspaceFeatures",
  "csharp"
);
@@clientName(
  WorkspaceReplicationProperties,
  "OperationalInsightsWorkspaceReplicationProperties",
  "csharp"
);
@@clientName(
  WorkspaceReplicationProperties.enabled,
  "IsReplicationEnabled",
  "csharp"
);
@@clientName(
  WorkspaceReplicationState,
  "OperationalInsightsWorkspaceReplicationState",
  "csharp"
);
@@clientName(WorkspaceSku, "OperationalInsightsWorkspaceSku", "csharp");
@@clientName(
  WorkspaceSkuNameEnum,
  "OperationalInsightsWorkspaceSkuName",
  "csharp"
);
@@clientName(
  CapacityReservationLevel,
  "OperationalInsightsWorkspaceCapacityReservationLevel",
  "csharp"
);

@@clientName(
  AvailableServiceTier,
  "OperationalInsightsAvailableServiceTier",
  "csharp"
);
@@clientName(AvailableServiceTier.enabled, "IsEnabled", "csharp");
@@clientName(AvailableServiceTier.lastSkuUpdate, "LastSkuUpdatedOn", "csharp");
@@alternateType(AvailableServiceTier.lastSkuUpdate, utcDateTime, "csharp");
@@clientName(IntelligencePack, "OperationalInsightsIntelligencePack", "csharp");
@@clientName(IntelligencePack.enabled, "IsEnabled", "csharp");
@@clientName(ManagementGroup, "OperationalInsightsManagementGroup", "csharp");
@@clientName(ManagementGroupProperties.created, "CreatedOn", "csharp");
@@clientName(
  ManagementGroupProperties.dataReceived,
  "DataReceivedOn",
  "csharp"
);
@@clientName(
  SearchGetSchemaResponse,
  "OperationalInsightsSearchSchemaResult",
  "csharp"
);
@@clientName(
  SearchSchemaValue,
  "OperationalInsightsSearchSchemaValue",
  "csharp"
);
@@clientName(SearchSchemaValue.type, "SearchSchemaValueType", "csharp");
@@clientName(UsageMetric, "OperationalInsightsUsageMetric", "csharp");
@@clientName(SharedKeys, "OperationalInsightsWorkspaceSharedKeys", "csharp");
@@clientName(
  WorkspacePurgeBody,
  "OperationalInsightsWorkspacePurgeContent",
  "csharp"
);
@@clientName(
  WorkspacePurgeBodyFilters,
  "OperationalInsightsWorkspacePurgeFilter",
  "csharp"
);
@@clientName(
  WorkspacePurgeResponse,
  "OperationalInsightsWorkspacePurgeResult",
  "csharp"
);
@@clientName(WorkspacePurgeResponse.operationId, "OperationStringId", "csharp");
@@clientName(
  WorkspacePurgeStatusResponse,
  "OperationalInsightsWorkspacePurgeStatusResult",
  "csharp"
);
@@clientName(PurgeState, "OperationalInsightsWorkspacePurgeState", "csharp");
@@clientName(DataSourceType, "OperationalInsightsDataSourceType", "csharp");

@@clientName(WorkspaceSku.lastSkuUpdate, "LastSkuUpdatedOn", "csharp");
@@clientName(
  WorkspaceFeatures.disableLocalAuth,
  "IsLocalAuthDisabled",
  "csharp"
);
@@clientName(
  WorkspaceFeatures.enableDataExport,
  "IsDataExportEnabled",
  "csharp"
);
@@clientName(
  WorkspaceFeatures.enableLogAccessUsingOnlyResourcePermissions,
  "IsLogAccessUsingOnlyResourcePermissionsEnabled",
  "csharp"
);
@@clientName(
  WorkspaceFeatures.unifiedSentinelBillingOnly,
  "IsUnifiedSentinelBillingOnly",
  "csharp"
);
@@clientName(WorkspaceCapping.dailyQuotaGb, "DailyQuotaInGB", "csharp");
@@alternateType(WorkspaceProperties.customerId, uuid, "csharp");
@@alternateType(
  WorkspaceProperties.defaultDataCollectionRuleResourceId,
  armResourceIdentifier,
  "csharp"
);
@@alternateType(
  LinkedServiceProperties.resourceId,
  armResourceIdentifier,
  "csharp"
);
@@alternateType(
  LinkedServiceProperties.writeAccessResourceId,
  armResourceIdentifier,
  "csharp"
);
@@clientName(
  LinkedStorageAccountsProperties.dataSourceType,
  "DataSourceType",
  "csharp"
);
@@alternateType(
  LinkedStorageAccountsProperties.storageAccountIds,
  armResourceIdentifier[],
  "csharp"
);
@@clientName(
  DataSourcesListByWorkspaceParameters.$skiptoken,
  "skipToken",
  "csharp"
);
@@alternateType(
  WorkspaceSku.capacityReservationLevel,
  CapacityReservationLevel,
  "csharp"
);
@@clientName(StorageInsightState.ERROR, "Error", "csharp");

// Operation client names (disambiguate members that would otherwise collide).
@@clientName(Workspaces.listByWorkspace, "GetAvailableServiceTiers", "csharp");
@@clientName(
  Workspaces.intelligencePacksList,
  "GetIntelligencePacks",
  "csharp"
);
@@clientName(Workspaces.managementGroupsList, "GetManagementGroups", "csharp");
@@clientName(Workspaces.schemaGet, "GetSchemas", "csharp");
@@clientName(Workspaces.usagesList, "GetUsages", "csharp");
@@clientName(Workspaces.gatewaysDelete, "DeleteGateway", "csharp");
@@alternateType(GatewayNameParameter.gatewayId, uuid, "csharp");
@@clientName(Workspaces.disable, "DisableIntelligencePack", "csharp");
@@clientName(Workspaces.enable, "EnableIntelligencePack", "csharp");
@@clientName(Workspaces.regenerate, "RegenerateSharedKey", "csharp");
@@clientName(WorkspacesOperationGroup.failover, "FailoverWorkspace", "csharp");
@@alternateType(
  WorkspacesOperationGroup.failover::parameters.location,
  Azure.Core.azureLocation,
  "csharp"
);

#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserve previous .NET pageable shape for the single-page saved search list operation"
@@markAsPageable(SavedSearches.listByWorkspace, "csharp");

#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserve previous .NET pageable shape for workspace schema values"
@@markAsPageable(Workspaces.schemaGet, "csharp");

#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserve previous .NET base type for workspace patch data"
@@Azure.ClientGenerator.Core.Legacy.hierarchyBuilding(
  WorkspacePatch,
  Azure.ResourceManager.Foundations.Resource,
  "csharp"
);

namespace Microsoft.OperationalInsights {
  #suppress "@azure-tools/typespec-azure-core/no-enum" "Preserve previous .NET numeric enum shape used by @@alternateType for SDK compatibility"
  enum CapacityReservationLevel {
    OneHundred: 100,
    TwoHundred: 200,
    ThreeHundred: 300,
    FourHundred: 400,
    FiveHundred: 500,
    TenHundred: 1000,
    TwoThousand: 2000,
    FiveThousand: 5000,
    TenThousand: 10000,
    TwentyFiveThousand: 25000,
    FiftyThousand: 50000,
  }
}
