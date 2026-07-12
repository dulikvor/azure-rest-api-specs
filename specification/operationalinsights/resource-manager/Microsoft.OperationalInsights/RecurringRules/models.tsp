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

#suppress "@azure-tools/typespec-azure-core/documentation-required" "Relocation-only split; the 404 response shape for DataExport delete is carried forward verbatim from the 2025-07-01 API and must be preserved byte-for-byte."
@doc("ignore")
model ArmNotFoundResponse {
  ...Response<404>;
}
/**
 * The type of the destination resource
 */
union Type {
  string,

  /**
   * StorageAccount
   */
  StorageAccount: "StorageAccount",

  /**
   * EventHub
   */
  EventHub: "EventHub",
}
/**
 * Table's current provisioning state. If set to 'updating', indicates a resource lock due to ongoing operation, forbidding any update to the table until the ongoing operation is concluded.
 */
#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "Relocation-only split; ProvisioningStateEnum (with its non-standard value set) is carried forward verbatim from the 2025-07-01 API and must be preserved byte-for-byte. Deferred to a future intentional API version."
union ProvisioningStateEnum {
  string,

  /**
   * Table schema is still being built and updated, table is currently locked for any changes till the procedure is done.
   */
  Updating: "Updating",

  /**
   * Table state is stable and without changes, table is unlocked and open for new updates.
   */
  Succeeded: "Succeeded",

  /**
   * Table state is deleting.
   */
  Deleting: "Deleting",

  /**
   * Table state is failed.
   */
  Failed: "Failed",

  /**
   * Table state is canceled.
   */
  Canceled: "Canceled",
}
/**
 * SummaryRules rule type: User.
 */
union RuleTypeEnum {
  string,

  /**
   * User defined summary rule. This is the definition for rules created and defined by users.
   */
  User: "User",
}

/**
 * Indicates the reason for rule deactivation.
 */
union StatusCodeEnum {
  string,

  /**
   * Summary rule stop originated from a user action (Stop was called).
   */
  UserAction: "UserAction",

  /**
   * Summary rule stop was caused due to data plane related error.
   */
  DataPlaneError: "DataPlaneError",
}

/**
 * The time cursor used in Summary rules bins processing, e.g. TimeGenerated.
 */
union TimeSelectorEnum {
  string,

  /**
   * TimeGenerated.
   */
  TimeGenerated: "TimeGenerated",
}
/**
 * Result of the request to list data exports.
 */
model DataExportListResult {
  /**
   * List of data export instances within a workspace..
   */
  @pageItems
  value?: DataExport[];

  /**
   * The URL to get the next set of results.
   */
  @nextLink
  nextLink?: string;
}

/**
 * Data Export properties.
 */
#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "Relocation-only split; DataExportProperties is carried forward verbatim from the 2025-07-01 API and must be preserved byte-for-byte. Deferred to a future intentional API version."
model DataExportProperties {
  /**
   * The data export rule ID.
   */
  dataExportId?: string;

  /**
   * An array of tables to export, for example: [“Heartbeat, SecurityEvent”].
   */
  tableNames: string[];

  /**
   * destination properties.
   */
  destination?: Destination;

  /**
   * Active when enabled.
   */
  enable?: boolean;

  /**
   * The latest data export rule modification time.
   */
  createdDate?: string;

  /**
   * Date and time when the export was last modified.
   */
  lastModifiedDate?: string;
}

/**
 * Destination properties.
 */
model Destination {
  /**
   * The destination resource ID. This can be copied from the Properties entry of the destination resource in Azure.
   */
  resourceId: string;

  /**
   * The type of the destination resource
   */
  @visibility(Lifecycle.Read)
  type?: Type;

  /**
   * destination meta data.
   */
  metaData?: DestinationMetaData;
}

/**
 * Destination meta data.
 */
model DestinationMetaData {
  /**
   * Optional. Allows to define an Event Hub name. Not applicable when destination is Storage Account.
   */
  eventHubName?: string;
}
/**
 * Summary rule properties.
 */
model SummaryLogsProperties {
  /**
   * SummaryRules rule type: User.
   */
  ruleType?: RuleTypeEnum;

  /**
   * The display name of the Summary rule.
   */
  displayName?: string;

  /**
   * The description of the Summary rule.
   */
  description?: string;

  /**
   * Indicates if Summary rule is active. If not, Summary rule execution stops.
   */
  @visibility(Lifecycle.Read)
  isActive?: boolean;

  /**
   * Indicates the reason for rule deactivation.
   */
  @visibility(Lifecycle.Read)
  statusCode?: StatusCodeEnum;

  /**
   * Summary rule is in provisioning state. If set to 'updating' or 'deleting', indicates a resource lock due to an ongoing operation, preventing any update to the Summary rule until the operation is complete.
   */
  @visibility(Lifecycle.Read)
  provisioningState?: ProvisioningStateEnum;

  /**
   * Rule definition parameters.
   */
  ruleDefinition?: RuleDefinition;
}

/**
 * Rule definition parameters.
 */
model RuleDefinition {
  /**
   * Summary rule query.
   */
  query?: string;

  /**
   * Scheduled window in minutes. Allowed values: 20, 30, 60, 120, 180, 360, 720, 1440.
   */
  binSize?: int32;

  /**
   * The minimum delay in seconds before bin processing.
   */
  binDelay?: int32;

  /**
   * The start time (UTC) when Summary rule execution starts.
   */
  binStartTime?: utcDateTime;

  /**
   * The time cursor used in Summary rules bins processing, e.g. TimeGenerated.
   */
  timeSelector?: TimeSelectorEnum;

  /**
   * The destination table used for the Summary rule results.
   */
  destinationTable?: string;
}

/**
 * Request to retry a summary logs bin.
 */
model SummaryLogsRetryBin {
  /**
   * Retry bin properties.
   */
  properties?: SummaryLogsRetryBinProperties;
}

/**
 * Properties for retrying a Summary rule bin.
 */
model SummaryLogsRetryBinProperties {
  /**
   * The time (UTC) of the bin to retry.
   */
  retryBinStartTime: utcDateTime;
}
