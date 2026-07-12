import "@typespec/rest";
import "@typespec/http";
import "@azure-tools/typespec-azure-resource-manager";
import "@azure-tools/typespec-azure-core";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.ResourceManager;
using Azure.Core;
using Azure.ResourceManager.Foundations;

namespace Microsoft.OperationalInsights;

/**
 * The name of the Service Tier.
 */
union SkuNameEnum {
  string,

  /**
   * Free
   */
  Free: "Free",

  /**
   * Standard
   */
  Standard: "Standard",

  /**
   * Premium
   */
  Premium: "Premium",

  /**
   * PerNode
   */
  PerNode: "PerNode",

  /**
   * PerGB2018
   */
  PerGB2018: "PerGB2018",

  /**
   * Standalone
   */
  Standalone: "Standalone",

  /**
   * CapacityReservation
   */
  CapacityReservation: "CapacityReservation",
}
/**
 * The kind of the DataSource.
 */
union DataSourceKind {
  string,

  /**
   * WindowsEvent
   */
  WindowsEvent: "WindowsEvent",

  /**
   * WindowsPerformanceCounter
   */
  WindowsPerformanceCounter: "WindowsPerformanceCounter",

  /**
   * IISLogs
   */
  IISLogs: "IISLogs",

  /**
   * LinuxSyslog
   */
  LinuxSyslog: "LinuxSyslog",

  /**
   * LinuxSyslogCollection
   */
  LinuxSyslogCollection: "LinuxSyslogCollection",

  /**
   * LinuxPerformanceObject
   */
  LinuxPerformanceObject: "LinuxPerformanceObject",

  /**
   * LinuxPerformanceCollection
   */
  LinuxPerformanceCollection: "LinuxPerformanceCollection",

  /**
   * CustomLog
   */
  CustomLog: "CustomLog",

  /**
   * CustomLogCollection
   */
  CustomLogCollection: "CustomLogCollection",

  /**
   * AzureAuditLog
   */
  AzureAuditLog: "AzureAuditLog",

  /**
   * AzureActivityLog
   */
  AzureActivityLog: "AzureActivityLog",

  /**
   * GenericDataSource
   */
  GenericDataSource: "GenericDataSource",

  /**
   * ChangeTrackingCustomPath
   */
  ChangeTrackingCustomPath: "ChangeTrackingCustomPath",

  /**
   * ChangeTrackingPath
   */
  ChangeTrackingPath: "ChangeTrackingPath",

  /**
   * ChangeTrackingServices
   */
  ChangeTrackingServices: "ChangeTrackingServices",

  /**
   * ChangeTrackingDataTypeConfiguration
   */
  ChangeTrackingDataTypeConfiguration: "ChangeTrackingDataTypeConfiguration",

  /**
   * ChangeTrackingDefaultRegistry
   */
  ChangeTrackingDefaultRegistry: "ChangeTrackingDefaultRegistry",

  /**
   * ChangeTrackingRegistry
   */
  ChangeTrackingRegistry: "ChangeTrackingRegistry",

  /**
   * ChangeTrackingLinuxPath
   */
  ChangeTrackingLinuxPath: "ChangeTrackingLinuxPath",

  /**
   * LinuxChangeTrackingPath
   */
  LinuxChangeTrackingPath: "LinuxChangeTrackingPath",

  /**
   * ChangeTrackingContentLocation
   */
  ChangeTrackingContentLocation: "ChangeTrackingContentLocation",

  /**
   * WindowsTelemetry
   */
  WindowsTelemetry: "WindowsTelemetry",

  /**
   * Office365
   */
  Office365: "Office365",

  /**
   * SecurityWindowsBaselineConfiguration
   */
  SecurityWindowsBaselineConfiguration: "SecurityWindowsBaselineConfiguration",

  /**
   * SecurityCenterSecurityWindowsBaselineConfiguration
   */
  SecurityCenterSecurityWindowsBaselineConfiguration: "SecurityCenterSecurityWindowsBaselineConfiguration",

  /**
   * SecurityEventCollectionConfiguration
   */
  SecurityEventCollectionConfiguration: "SecurityEventCollectionConfiguration",

  /**
   * SecurityInsightsSecurityEventCollectionConfiguration
   */
  SecurityInsightsSecurityEventCollectionConfiguration: "SecurityInsightsSecurityEventCollectionConfiguration",

  /**
   * ImportComputerGroup
   */
  ImportComputerGroup: "ImportComputerGroup",

  /**
   * NetworkMonitoring
   */
  NetworkMonitoring: "NetworkMonitoring",

  /**
   * Itsm
   */
  Itsm: "Itsm",

  /**
   * DnsAnalytics
   */
  DnsAnalytics: "DnsAnalytics",

  /**
   * ApplicationInsights
   */
  ApplicationInsights: "ApplicationInsights",

  /**
   * SqlDataClassification
   */
  SqlDataClassification: "SqlDataClassification",
}

/**
 * The provisioning state of the linked service.
 */
#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
union LinkedServiceEntityStatus {
  string,

  /**
   * Succeeded
   */
  Succeeded: "Succeeded",

  /**
   * Deleting
   */
  Deleting: "Deleting",

  /**
   * ProvisioningAccount
   */
  ProvisioningAccount: "ProvisioningAccount",

  /**
   * Updating
   */
  Updating: "Updating",
}

/**
 * The sort order of the search.
 */
union SearchSortEnum {
  string,

  /**
   * asc
   */
  asc: "asc",

  /**
   * desc
   */
  desc: "desc",
}

/**
 * The state of the storage insight connection to the workspace
 */
union StorageInsightState {
  string,

  /**
   * OK
   */
  OK: "OK",

  /**
   * ERROR
   */
  ERROR: "ERROR",
}
/**
 * Status of the operation represented by the requested Id.
 */
union PurgeState {
  string,

  /**
   * pending
   */
  pending: "pending",

  /**
   * completed
   */
  completed: "completed",
}

/**
 * The provisioning state of the workspace.
 */
union WorkspaceEntityStatus {
  string,

  /**
   * Creating
   */
  Creating: "Creating",

  /**
   * Succeeded
   */
  Succeeded: "Succeeded",

  /**
   * Failed
   */
  Failed: "Failed",

  /**
   * Canceled
   */
  Canceled: "Canceled",

  /**
   * Deleting
   */
  Deleting: "Deleting",

  /**
   * ProvisioningAccount
   */
  ProvisioningAccount: "ProvisioningAccount",

  /**
   * Updating
   */
  Updating: "Updating",
}

/**
 * The name of the SKU.
 */
union WorkspaceSkuNameEnum {
  string,

  /**
   * Free
   */
  Free: "Free",

  /**
   * Standard
   */
  Standard: "Standard",

  /**
   * Premium
   */
  Premium: "Premium",

  /**
   * PerNode
   */
  PerNode: "PerNode",

  /**
   * PerGB2018
   */
  PerGB2018: "PerGB2018",

  /**
   * Standalone
   */
  Standalone: "Standalone",

  /**
   * CapacityReservation
   */
  CapacityReservation: "CapacityReservation",

  /**
   * LACluster
   */
  LACluster: "LACluster",
}

/**
 * The status of data ingestion for this workspace.
 */
union DataIngestionStatus {
  string,

  /**
   * Ingestion enabled following daily cap quota reset, or subscription enablement.
   */
  RespectQuota: "RespectQuota",

  /**
   * Ingestion started following service setting change.
   */
  ForceOn: "ForceOn",

  /**
   * Ingestion stopped following service setting change.
   */
  ForceOff: "ForceOff",

  /**
   * Reached daily cap quota, ingestion stopped.
   */
  OverQuota: "OverQuota",

  /**
   * Ingestion stopped following suspended subscription.
   */
  SubscriptionSuspended: "SubscriptionSuspended",

  /**
   * 80% of daily cap quota reached.
   */
  ApproachingQuota: "ApproachingQuota",
}

/**
 * The network access type for operating on the Log Analytics Workspace. By default it is Enabled
 */
union PublicNetworkAccessType {
  string,

  /**
   * Enables connectivity to Log Analytics through public DNS.
   */
  Enabled: "Enabled",

  /**
   * Disables public connectivity to Log Analytics through public DNS.
   */
  Disabled: "Disabled",

  /**
   * Resource is only accessible from private networks and access approved by network security perimeter associated to this resource.
   */
  SecuredByPerimeter: "SecuredByPerimeter",
}

/**
 * The provisioning state of the replication.
 */
union WorkspaceReplicationState {
  string,

  /**
   * Succeeded
   */
  Succeeded: "Succeeded",

  /**
   * EnableRequested
   */
  EnableRequested: "EnableRequested",

  /**
   * Enabling
   */
  Enabling: "Enabling",

  /**
   * DisableRequested
   */
  DisableRequested: "DisableRequested",

  /**
   * Disabling
   */
  Disabling: "Disabling",

  /**
   * RollbackRequested
   */
  RollbackRequested: "RollbackRequested",

  /**
   * RollingBack
   */
  RollingBack: "RollingBack",

  /**
   * Failed
   */
  Failed: "Failed",

  /**
   * Canceled
   */
  Canceled: "Canceled",
}

/**
 * The failover state of the replication.
 */
union WorkspaceFailoverState {
  string,

  /**
   * Inactive
   */
  Inactive: "Inactive",

  /**
   * Activating
   */
  Activating: "Activating",

  /**
   * Active
   */
  Active: "Active",

  /**
   * Deactivating
   */
  Deactivating: "Deactivating",

  /**
   * Failed
   */
  Failed: "Failed",
}
/**
 * Linked storage accounts type.
 */
#suppress "@azure-tools/typespec-azure-core/no-enum" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
enum DataSourceType {
  /**
   * CustomLogs
   */
  CustomLogs,

  /**
   * AzureWatson
   */
  AzureWatson,

  /**
   * Query
   */
  Query,

  /**
   * Ingestion
   */
  Ingestion,

  /**
   * Alerts
   */
  Alerts,
}

/**
 * Type of managed service identity.
 */
#suppress "@azure-tools/typespec-azure-core/no-enum" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
enum IdentityType {
  /**
   * SystemAssigned
   */
  SystemAssigned,

  /**
   * UserAssigned
   */
  UserAssigned,

  /**
   * None
   */
  None,
}

/**
 * Service Tier details.
 */
model AvailableServiceTier {
  /**
   * The name of the Service Tier.
   */
  @visibility(Lifecycle.Read)
  serviceTier?: SkuNameEnum;

  /**
   * True if the Service Tier is enabled for the workspace.
   */
  @visibility(Lifecycle.Read)
  enabled?: boolean;

  /**
   * The minimum retention for the Service Tier, in days.
   */
  @visibility(Lifecycle.Read)
  minimumRetention?: int64;

  /**
   * The maximum retention for the Service Tier, in days.
   */
  @visibility(Lifecycle.Read)
  maximumRetention?: int64;

  /**
   * The default retention for the Service Tier, in days.
   */
  @visibility(Lifecycle.Read)
  defaultRetention?: int64;

  /**
   * The capacity reservation level in GB per day. Returned for the Capacity Reservation Service Tier.
   */
  @visibility(Lifecycle.Read)
  capacityReservationLevel?: int64;

  /**
   * Time when the sku was last updated for the workspace. Returned for the Capacity Reservation Service Tier.
   */
  @visibility(Lifecycle.Read)
  lastSkuUpdate?: string;
}
/**
 * Intelligence Pack containing a string name and boolean indicating if it's enabled.
 */
model IntelligencePack {
  /**
   * The name of the intelligence pack.
   */
  name?: string;

  /**
   * The enabled boolean for the intelligence pack.
   */
  enabled?: boolean;

  /**
   * The display name of the intelligence pack.
   */
  displayName?: string;
}

/**
 * Linked service properties.
 */
model LinkedServiceProperties {
  /**
   * The resource id of the resource that will be linked to the workspace. This should be used for linking resources which require read access
   */
  resourceId?: string;

  /**
   * The resource id of the resource that will be linked to the workspace. This should be used for linking resources which require write access
   */
  writeAccessResourceId?: string;

  /**
   * The provisioning state of the linked service.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  provisioningState?: LinkedServiceEntityStatus;
}

/**
 * The list linked service operation response.
 */
model LinkedServiceListResult {
  /**
   * The list of linked service instances
   */
  @pageItems
  value?: LinkedService[];

  /**
   * The URL to get the next set of results.
   */
  @nextLink
  nextLink?: string;
}

/**
 * Linked storage accounts properties.
 */
#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
model LinkedStorageAccountsProperties {
  /**
   * Linked storage accounts type.
   */
  @visibility(Lifecycle.Read)
  dataSourceType?: DataSourceType;

  /**
   * Linked storage accounts resources ids.
   */
  storageAccountIds?: string[];
}

/**
 * The list linked storage accounts service operation response.
 */
model LinkedStorageAccountsListResult {
  /**
   * A list of linked storage accounts instances.
   */
  @pageItems
  value?: LinkedStorageAccountsResource[];

  /**
   * The URL to get the next set of results.
   */
  @nextLink
  nextLink?: string;
}

/**
 * The list workspace management groups operation response.
 */
model WorkspaceListManagementGroupsResult {
  /**
   * Gets or sets a list of management groups attached to the workspace.
   */
  @pageItems
  @identifiers(#["/properties/id"])
  value?: ManagementGroup[];

  /**
   * The URL to get the next set of results.
   */
  @nextLink
  nextLink?: string;
}

/**
 * A management group that is connected to a workspace
 */
model ManagementGroup {
  /**
   * The properties of the management group.
   */
  properties?: ManagementGroupProperties;
}

/**
 * Management group properties.
 */
model ManagementGroupProperties {
  /**
   * The number of servers connected to the management group.
   */
  serverCount?: int32;

  /**
   * Gets or sets a value indicating whether the management group is a gateway.
   */
  isGateway?: boolean;

  /**
   * The name of the management group.
   */
  name?: string;

  /**
   * The unique ID of the management group.
   */
  id?: string;

  /**
   * The datetime that the management group was created.
   */
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  created?: utcDateTime;

  /**
   * The last datetime that the management group received data.
   */
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  dataReceived?: utcDateTime;

  /**
   * The version of System Center that is managing the management group.
   */
  version?: string;

  /**
   * The SKU of System Center that is managing the management group.
   */
  sku?: string;
}

model OperationListResult is Azure.Core.Page<Operation>;

/**
 * Supported operation of OperationalInsights resource provider.
 */
model Operation {
  /**
   * Operation name: {provider}/{resource}/{operation}
   */
  name?: string;

  /**
   * Display metadata associated with the operation.
   */
  display?: OperationDisplay;
}

/**
 * Display metadata associated with the operation.
 */
model OperationDisplay {
  /**
   * Service provider: Microsoft OperationsManagement.
   */
  provider?: string;

  /**
   * Resource on which the operation is performed etc.
   */
  resource?: string;

  /**
   * Type of operation: get, read, delete, etc.
   */
  operation?: string;

  /**
   * Description of operation
   */
  description?: string;
}

/**
 * The status of operation.
 */
model OperationStatus {
  /**
   * The operation Id.
   */
  id?: string;

  /**
   * The operation name.
   */
  name?: string;

  /**
   * The start time of the operation.
   */
  startTime?: string;

  /**
   * The end time of the operation.
   */
  endTime?: string;

  /**
   * The status of the operation.
   */
  status?: string;

  /**
   * The error detail of the operation if any.
   */
  error?: Azure.ResourceManager.CommonTypes.ErrorResponse;
}
/**
 * Value object for saved search results.
 */
#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
model SavedSearchProperties {
  /**
   * The category of the saved search. This helps the user to find a saved search faster.
   */
  category: string;

  /**
   * Saved search display name.
   */
  displayName: string;

  /**
   * The query expression for the saved search.
   */
  query: string;

  /**
   * The function alias if query serves as a function.
   */
  functionAlias?: string;

  /**
   * The optional function parameters if query serves as a function. Value should be in the following format: 'param-name1:type1 = default_value1, param-name2:type2 = default_value2'. For more examples and proper syntax please refer to https://docs.microsoft.com/en-us/azure/kusto/query/functions/user-defined-functions.
   */
  functionParameters?: string;

  /**
   * The version number of the query language. The current version is 2 and is the default.
   */
  version?: int64;

  /**
   * The tags attached to the saved search.
   */
  @identifiers(#["name"])
  tags?: Tag[];
}

/**
 * A tag of a saved search.
 */
model Tag {
  /**
   * The tag name.
   */
  name: string;

  /**
   * The tag value.
   */
  value: string;
}

/**
 * The saved search list operation response.
 */
model SavedSearchesListResult {
  /**
   * The array of result values.
   */
  value?: SavedSearch[];
}

/**
 * The get schema operation response.
 */
model SearchGetSchemaResponse {
  /**
   * The metadata from search results.
   */
  metadata?: SearchMetadata;

  /**
   * The array of result values.
   */
  @identifiers(#["name"])
  value?: SearchSchemaValue[];
}

/**
 * Metadata for search results.
 */
model SearchMetadata {
  /**
   * The request id of the search.
   */
  requestId?: string;

  /**
   * The search result type.
   */
  resultType?: string;

  /**
   * The total number of search results.
   */
  total?: int64;

  /**
   * The number of top search results.
   */
  top?: int64;

  /**
   * The id of the search results request.
   */
  id?: string;

  /**
   * The core summaries.
   */
  @identifiers(#[])
  coreSummaries?: CoreSummary[];

  /**
   * The status of the search results.
   */
  status?: string;

  /**
   * The start time for the search.
   */
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  startTime?: utcDateTime;

  /**
   * The time of last update.
   */
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  lastUpdated?: utcDateTime;

  /**
   * The ETag of the search results.
   */
  eTag?: string;

  /**
   * How the results are sorted.
   */
  @identifiers(#["name"])
  sort?: SearchSort[];

  /**
   * The request time.
   */
  requestTime?: int64;

  /**
   * The aggregated value field.
   */
  aggregatedValueField?: string;

  /**
   * The aggregated grouping fields.
   */
  aggregatedGroupingFields?: string;

  /**
   * The sum of all aggregates returned in the result set.
   */
  sum?: int64;

  /**
   * The max of all aggregates returned in the result set.
   */
  max?: int64;

  /**
   * The schema.
   */
  schema?: SearchMetadataSchema;
}

/**
 * The core summary of a search.
 */
model CoreSummary {
  /**
   * The status of a core summary.
   */
  status?: string;

  /**
   * The number of documents of a core summary.
   */
  numberOfDocuments: int64;
}

/**
 * The sort parameters for search.
 */
model SearchSort {
  /**
   * The name of the field the search query is sorted on.
   */
  name?: string;

  /**
   * The sort order of the search.
   */
  order?: SearchSortEnum;
}

/**
 * Schema metadata for search.
 */
model SearchMetadataSchema {
  /**
   * The name of the metadata schema.
   */
  name?: string;

  /**
   * The version of the metadata schema.
   */
  version?: int32;
}

/**
 * Value object for schema results.
 */
model SearchSchemaValue {
  /**
   * The name of the schema.
   */
  name?: string;

  /**
   * The display name of the schema.
   */
  displayName?: string;

  /**
   * The type.
   */
  type?: string;

  /**
   * The boolean that indicates the field is searchable as free text.
   */
  indexed: boolean;

  /**
   * The boolean that indicates whether or not the field is stored.
   */
  stored: boolean;

  /**
   * The boolean that indicates whether or not the field is a facet.
   */
  facet: boolean;

  /**
   * The array of workflows containing the field.
   */
  ownerType?: string[];
}

/**
 * The shared keys for a workspace.
 */
model SharedKeys {
  /**
   * The primary shared key of a workspace.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/secret-prop" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  primarySharedKey?: string;

  /**
   * The secondary shared key of a workspace.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/secret-prop" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  secondarySharedKey?: string;
}

/**
 * Storage insight properties.
 */
#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
model StorageInsightProperties {
  /**
   * The names of the blob containers that the workspace should read
   */
  containers?: string[];

  /**
   * The names of the Azure tables that the workspace should read
   */
  tables?: string[];

  /**
   * The storage account connection details
   */
  storageAccount: StorageAccount;

  /**
   * The status of the storage insight
   */
  @visibility(Lifecycle.Read)
  status?: StorageInsightStatus;
}

/**
 * Describes a storage account connection.
 */
model StorageAccount {
  /**
   * The Azure Resource Manager ID of the storage account resource.
   */
  id: string;

  /**
   * The storage account key.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/secret-prop" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  key: string;
}

/**
 * The status of the storage insight.
 */
model StorageInsightStatus {
  /**
   * The state of the storage insight connection to the workspace
   */
  state: StorageInsightState;

  /**
   * Description of the state of the storage insight.
   */
  description?: string;
}

/**
 * The list storage insights operation response.
 */
model StorageInsightListResult {
  /**
   * A list of storage insight items.
   */
  @pageItems
  value?: StorageInsight[];

  /**
   * The link (url) to the next page of results.
   */
  #suppress "@azure-tools/typespec-azure-core/casing-style" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  @nextLink
  `@odata.nextLink`?: string;
}
/**
 * The list workspace usages operation response.
 */
model WorkspaceListUsagesResult {
  /**
   * Gets or sets a list of usage metrics for a workspace.
   */
  @pageItems
  @identifiers(#["name"])
  value?: UsageMetric[];

  /**
   * The URL to get the next set of results.
   */
  @nextLink
  nextLink?: string;
}

/**
 * A metric describing the usage of a resource.
 */
model UsageMetric {
  /**
   * The name of the metric.
   */
  name?: MetricName;

  /**
   * The units used for the metric.
   */
  unit?: string;

  /**
   * The current value of the metric.
   */
  currentValue?: float64;

  /**
   * The quota limit for the metric.
   */
  limit?: float64;

  /**
   * The time that the metric's value will reset.
   */
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  nextResetTime?: utcDateTime;

  /**
   * The quota period that determines the length of time between value resets.
   */
  quotaPeriod?: string;
}

/**
 * The name of a metric.
 */
model MetricName {
  /**
   * The system name of the metric.
   */
  value?: string;

  /**
   * The localized name of the metric.
   */
  localizedValue?: string;
}

/**
 * Describes the body of a purge request for an App Insights Workspace
 */
model WorkspacePurgeBody {
  /**
   * Table from which to purge data.
   */
  table: string;

  /**
   * The set of columns and filters (queries) to run over them to purge the resulting data.
   */
  @identifiers(#[])
  filters: WorkspacePurgeBodyFilters[];
}

/**
 * User-defined filters to return data which will be purged from the table.
 */
model WorkspacePurgeBodyFilters {
  /**
   * The column of the table over which the given query should run
   */
  column?: string;

  /**
   * A query operator to evaluate over the provided column and value(s). Supported operators are ==, =~, in, in~, >, >=, <, <=, between, and have the same behavior as they would in a KQL query.
   */
  operator?: string;

  /**
   * the value for the operator to function over. This can be a number (e.g., > 100), a string (timestamp >= '2017-09-01') or array of values.
   */
  #suppress "@azure-tools/typespec-azure-core/no-unknown" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  value?: unknown;

  /**
   * When filtering over custom dimensions, this key will be used as the name of the custom dimension.
   */
  key?: string;
}

/**
 * Response containing operationId for a specific purge action.
 */
model WorkspacePurgeResponse {
  /**
   * Id to use when querying for status for a particular purge operation.
   */
  operationId: string;
}

/**
 * Response containing status for a specific purge operation.
 */
model WorkspacePurgeStatusResponse {
  /**
   * Status of the operation represented by the requested Id.
   */
  status: PurgeState;
}

/**
 * The list workspaces operation response.
 */
model WorkspaceListResult {
  /**
   * A list of workspaces.
   */
  @pageItems
  value?: Workspace[];

  /**
   * The URL to get the next set of results.
   */
  @nextLink
  nextLink?: string;
}

/**
 * Workspace properties.
 */
model WorkspaceProperties {
  /**
   * The provisioning state of the workspace.
   */
  @visibility(Lifecycle.Read)
  provisioningState?: WorkspaceEntityStatus;

  /**
   * This is a read-only property. Represents the ID associated with the workspace.
   */
  @visibility(Lifecycle.Read)
  customerId?: string;

  /**
   * The SKU of the workspace.
   */
  sku?: WorkspaceSku;

  /**
   * The workspace data retention in days. Allowed values are per pricing plan. See pricing tiers documentation for details.
   */
  #suppress "@azure-tools/typespec-azure-core/no-nullable" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  retentionInDays?: int32 | null;

  /**
   * The daily volume cap for ingestion.
   */
  workspaceCapping?: WorkspaceCapping;

  /**
   * Workspace creation date.
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  createdDate?: utcDateTime;

  /**
   * Workspace modification date.
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  modifiedDate?: utcDateTime;

  /**
   * The network access type for accessing Log Analytics ingestion.
   */
  publicNetworkAccessForIngestion?: PublicNetworkAccessType = PublicNetworkAccessType.Enabled;

  /**
   * The network access type for accessing Log Analytics query.
   */
  publicNetworkAccessForQuery?: PublicNetworkAccessType = PublicNetworkAccessType.Enabled;

  /**
   * Indicates whether customer managed storage is mandatory for query management.
   */
  forceCmkForQuery?: boolean;

  /**
   * List of linked private link scope resources.
   */
  @visibility(Lifecycle.Read)
  @identifiers(#["resourceId"])
  privateLinkScopedResources?: PrivateLinkScopedResource[];

  /**
   * Workspace features.
   */
  features?: WorkspaceFeatures;

  /**
   * The resource ID of the default Data Collection Rule to use for this workspace. Expected format is - /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Insights/dataCollectionRules/{dcrName}.
   */
  defaultDataCollectionRuleResourceId?: string;

  /**
   * workspace replication properties.
   */
  replication?: WorkspaceReplicationProperties;

  /**
   * workspace failover properties.
   */
  failover?: WorkspaceFailoverProperties;
}

/**
 * The SKU (tier) of a workspace.
 */
model WorkspaceSku {
  /**
   * The name of the SKU.
   */
  name: WorkspaceSkuNameEnum;

  /**
   * The capacity reservation level in GB for this workspace, when CapacityReservation sku is selected.
   */
  #suppress "@azure-tools/typespec-azure-core/no-nullable" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  capacityReservationLevel?: int32 | null;

  /**
   * The last time when the sku was updated.
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  lastSkuUpdate?: utcDateTime;
}

/**
 * The daily volume cap for ingestion.
 */
model WorkspaceCapping {
  /**
   * The workspace daily quota for ingestion.
   */
  dailyQuotaGb?: float64;

  /**
   * The time when the quota will be rest.
   */
  @visibility(Lifecycle.Read)
  quotaNextResetTime?: string;

  /**
   * The status of data ingestion for this workspace.
   */
  @visibility(Lifecycle.Read)
  dataIngestionStatus?: DataIngestionStatus;
}

/**
 * The private link scope resource reference.
 */
model PrivateLinkScopedResource {
  /**
   * The full resource Id of the private link scope resource.
   */
  resourceId?: string;

  /**
   * The private link scope unique Identifier.
   */
  scopeId?: string;
}

/**
 * Workspace features.
 */
model WorkspaceFeatures {
  ...Record<unknown>;

  /**
   * Flag that indicate if data should be exported.
   */
  #suppress "@azure-tools/typespec-azure-core/no-nullable" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  enableDataExport?: boolean | null;

  /**
   * Flag that describes if we want to remove the data after 30 days.
   */
  #suppress "@azure-tools/typespec-azure-core/no-nullable" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  immediatePurgeDataOn30Days?: boolean | null;

  /**
   * Flag that indicate which permission to use - resource or workspace or both.
   */
  #suppress "@azure-tools/typespec-azure-core/no-nullable" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  enableLogAccessUsingOnlyResourcePermissions?: boolean | null;

  /**
   * Dedicated LA cluster resourceId that is linked to the workspaces.
   */
  #suppress "@azure-tools/typespec-azure-core/no-nullable" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  clusterResourceId?: string | null;

  /**
   * Disable Non-AAD based Auth.
   */
  #suppress "@azure-tools/typespec-azure-core/no-nullable" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  disableLocalAuth?: boolean | null;

  /**
   * An indication if the specify workspace is limited to sentinel's unified billing model only.
   */
  #suppress "@azure-tools/typespec-azure-core/no-nullable" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  @visibility(Lifecycle.Read)
  unifiedSentinelBillingOnly?: boolean | null;

  /**
   * List of associations for the workspace. Indicates if the workspace is associated with any of the following experiences: MDC, Sentinel, SentinelGraph, etc.
   */
  @visibility(Lifecycle.Read)
  associations?: string[];
}

/**
 * Workspace replication properties.
 */
model WorkspaceReplicationProperties {
  /**
   * The location of the replication.
   */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  location?: string;

  /**
   * Specifies whether the replication is enabled or not. When true, workspace configuration and data is replicated to the specified location. If replication is been enabled, location must be provided.
   */
  enabled?: boolean;

  /**
   * The provisioning state of the replication.
   */
  @visibility(Lifecycle.Read)
  provisioningState?: WorkspaceReplicationState;

  /**
   * The last time when the replication was enabled.
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  createdDate?: utcDateTime;

  /**
   * The last time when the replication was updated.
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  lastModifiedDate?: utcDateTime;
}

/**
 * The failover state of the replication.
 */
model WorkspaceFailoverProperties {
  /**
   * The failover state of the replication.
   */
  @visibility(Lifecycle.Read)
  state?: WorkspaceFailoverState;

  /**
   * The last time when the failover state was updated.
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  lastModifiedDate?: utcDateTime;
}

/**
 * Identity for the resource.
 */
model Identity {
  /**
   * The principal ID of resource identity.
   */
  @visibility(Lifecycle.Read)
  principalId?: string;

  /**
   * The tenant ID of resource.
   */
  @visibility(Lifecycle.Read)
  tenantId?: string;

  /**
   * Type of managed service identity.
   */
  type: IdentityType;

  /**
   * The list of user identities associated with the resource. The user identity dictionary key references will be ARM resource ids in the form: '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/{identityName}'.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-no-record" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  userAssignedIdentities?: Record<UserIdentityProperties>;
}

/**
 * User assigned identity properties.
 */
model UserIdentityProperties {
  /**
   * The principal id of user assigned identity.
   */
  @visibility(Lifecycle.Read)
  principalId?: string;

  /**
   * The client id of user assigned identity.
   */
  @visibility(Lifecycle.Read)
  clientId?: string;
}

// Need to use CommonTypes.AzureEntityResource after https://github.com/Azure/typespec-azure/issues/4355 gets fixed.
/** The resource model definition for an Azure Resource Manager resource with an etag. */
#suppress "@azure-tools/typespec-azure-core/composition-over-inheritance" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
@summary("Entity Resource")
model AzureEntityResource extends CommonTypes.Resource {
  /** Resource Etag. */
  @visibility(Lifecycle.Read)
  etag?: string;
}

/**
 * The top level Workspace resource container.
 */
#suppress "@azure-tools/typespec-azure-core/composition-over-inheritance" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
model WorkspacePatch extends AzureEntityResource {
  /**
   * Workspace properties.
   */
  properties?: WorkspaceProperties;

  /**
   * The identity of the resource.
   */
  identity?: Identity;

  /**
   * Resource tags. Optional.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-no-record" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  @visibility(Lifecycle.Read, Lifecycle.Create, Lifecycle.Update)
  tags?: Record<string>;
}
@@identifiers(OperationListResult.value, #["name"]);
