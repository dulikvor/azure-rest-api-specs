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
 * Instruct the system how to handle and charge the logs ingested to this table.
 */
union TablePlanEnum {
  string,

  /**
   * Medium-touch logs needed for troubleshooting and incident response.
   */
  Basic: "Basic",

  /**
   * High-value logs used for continuous monitoring, real-time detection, and performance analytics.
   */
  Analytics: "Analytics",

  /**
   * Low-touch logs, such as verbose logs, and data required for auditing and compliance.
   */
  Auxiliary: "Auxiliary",
}

/**
 * Column data type.
 */
union ColumnTypeEnum {
  string,

  /**
   * string
   */
  string: "string",

  /**
   * int
   */
  int: "int",

  /**
   * long
   */
  long: "long",

  /**
   * real
   */
  real: "real",

  /**
   * boolean
   */
  boolean: "boolean",

  /**
   * dateTime
   */
  dateTime: "dateTime",

  /**
   * guid
   */
  guid: "guid",

  /**
   * dynamic
   */
  dynamic: "dynamic",
}

/**
 * Column data type logical hint.
 */
union ColumnDataTypeHintEnum {
  string,

  @doc("A string that matches the pattern of a URI, for example, scheme://username:password@host:1234/this/is/a/path?k1=v1&k2=v2#fragment")
  uri: "uri",

  /**
   * A standard 128-bit GUID following the standard shape, xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
   */
  guid: "guid",

  /**
   * An Azure Resource Model (ARM) path: /subscriptions/{...}/resourceGroups/{...}/providers/Microsoft.{...}/{...}/{...}/{...}...
   */
  armPath: "armPath",

  /**
   * A standard V4/V6 ip address following the standard shape, x.x.x.x/y:y:y:y:y:y:y:y
   */
  ip: "ip",
}

/**
 * Table's creator.
 */
union SourceEnum {
  string,

  /**
   * Tables provisioned by the system, as collected via Diagnostic Settings, the Agents, or any other standard data collection means.
   */
  microsoft: "microsoft",

  /**
   * Tables created by the owner of the Workspace, and only found in this Workspace.
   */
  customer: "customer",
}

/**
 * Table's creator.
 */
union TableTypeEnum {
  string,

  /**
   * Standard data collected by Azure Monitor.
   */
  Microsoft: "Microsoft",

  /**
   * Custom log table.
   */
  CustomLog: "CustomLog",

  /**
   * Restored data.
   */
  RestoredLogs: "RestoredLogs",

  /**
   * Data collected by a search job.
   */
  SearchResults: "SearchResults",
}

/**
 * The subtype describes what APIs can be used to interact with the table, and what features are available against it.
 */
union TableSubTypeEnum {
  string,

  /**
   * The default subtype with which built-in tables are created.
   */
  Any: "Any",

  /**
   * Indicates a table created through the Data Collector API or with the custom logs feature of the MMA agent, or any table against which Custom Fields were created.
   */
  Classic: "Classic",

  /**
   * A table eligible to have data sent into it via any of the means supported by Data Collection Rules: the Data Collection Endpoint API, ingestion-time transformations, or any other mechanism provided by Data Collection Rules
   */
  DataCollectionRuleBased: "DataCollectionRuleBased",
}

/**
 * Table's current provisioning state. If set to 'updating', indicates a resource lock due to ongoing operation, forbidding any update to the table until the ongoing operation is concluded.
 */
#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "provisioningState enum values are preserved verbatim from the 2025-07-01 API for the relocation-only split; adding terminal Failed/Canceled would be a contract change and is deferred to a future API version."
union OperationalInsightsTableProvisioningState {
  string,

  /**
   * Table schema is still being built and updated, table is currently locked for any changes till the procedure is done.
   */
  Updating: "Updating",

  /**
   * Table schema is stable and without changes, table data is being updated.
   */
  InProgress: "InProgress",

  /**
   * Table state is stable and without changes, table is unlocked and open for new updates.
   */
  Succeeded: "Succeeded",

  /**
   * Table state is deleting.
   */
  Deleting: "Deleting",
}

/**
 * The list tables operation response.
 */
model TablesListResult {
  /**
   * A list of data tables.
   */
  @pageItems
  value?: Table[];

  /**
   * The URL to get the next set of results.
   */
  @nextLink
  nextLink?: string;
}

/**
 * Table properties.
 */
model TableProperties {
  /**
   * In Analytics table: the tables analytics retention in days, between 4 and 730. Setting this property to -1 will default to the workspace retention. In Basic and Auxiliary table: read only property.
   */
  @maxValue(730)
  @minValue(4)
  retentionInDays?: int32;

  /**
   * The table total retention in days, between 4 and 4383. Setting this property to -1 will default to retentionInDays.
   */
  @maxValue(4383)
  @minValue(4)
  totalRetentionInDays?: int32;

  /**
   * The tables long-term retention in days. Calculated as (totalRetentionInDays-retentionInDays).
   */
  @visibility(Lifecycle.Read)
  archiveRetentionInDays?: int32;

  /**
   * Parameters of the search job that initiated this table.
   */
  searchResults?: SearchResults;

  /**
   * Parameters of the restore operation that initiated this table.
   */
  restoredLogs?: RestoredLogs;

  /**
   * Search job execution statistics.
   */
  @visibility(Lifecycle.Read)
  resultStatistics?: ResultStatistics;

  /**
   * Instruct the system how to handle and charge the logs ingested to this table.
   */
  plan?: TablePlanEnum;

  /**
   * The timestamp that table plan was last modified (UTC).
   */
  @visibility(Lifecycle.Read)
  lastPlanModifiedDate?: string;

  /**
   * Table schema.
   */
  schema?: Schema;

  /**
   * Table's current provisioning state. If set to 'updating', indicates a resource lock due to ongoing operation, forbidding any update to the table until the ongoing operation is concluded.
   */
  @visibility(Lifecycle.Read)
  provisioningState?: OperationalInsightsTableProvisioningState;

  /**
   * True - Value originates from workspace retention in days, False - Customer specific.
   */
  @visibility(Lifecycle.Read)
  retentionInDaysAsDefault?: boolean;

  /**
   * True - Value originates from retention in days, False - Customer specific.
   */
  @visibility(Lifecycle.Read)
  totalRetentionInDaysAsDefault?: boolean;
}

/**
 * Parameters of the search job that initiated this table.
 */
model SearchResults {
  /**
   * Search job query.
   */
  query?: string;

  /**
   * Search job Description.
   */
  description?: string;

  /**
   * Limit the search job to return up to specified number of rows.
   */
  limit?: int32;

  /**
   * The timestamp to start the search from (UTC)
   */
  startSearchTime?: utcDateTime;

  /**
   * The timestamp to end the search by (UTC)
   */
  endSearchTime?: utcDateTime;

  /**
   * The table used in the search job.
   */
  @visibility(Lifecycle.Read)
  sourceTable?: string;

  /**
   * Search results table async operation id.
   */
  @visibility(Lifecycle.Read)
  azureAsyncOperationId?: string;
}

/**
 * Restore parameters.
 */
model RestoredLogs {
  /**
   * The timestamp to start the restore from (UTC).
   */
  startRestoreTime?: utcDateTime;

  /**
   * The timestamp to end the restore by (UTC).
   */
  endRestoreTime?: utcDateTime;

  /**
   * The table to restore data from.
   */
  sourceTable?: string;

  /**
   * Search results table async operation id.
   */
  @visibility(Lifecycle.Read)
  azureAsyncOperationId?: string;
}

/**
 * Search job execution statistics.
 */
model ResultStatistics {
  /**
   * Search job completion percentage.
   */
  @visibility(Lifecycle.Read)
  progress?: float32;

  /**
   * The number of rows that were returned by the search job.
   */
  @visibility(Lifecycle.Read)
  ingestedRecords?: int32;

  /**
   * Search job: Amount of scanned data.
   */
  @visibility(Lifecycle.Read)
  scannedGb?: float32;
}

/**
 * Table's schema.
 */
model Schema {
  /**
   * Table name.
   */
  name?: string;

  /**
   * Table display name.
   */
  displayName?: string;

  /**
   * Table description.
   */
  description?: string;

  /**
   * A list of table custom columns.
   */
  @identifiers(#["name"])
  columns?: Column[];

  /**
   * A list of table standard columns.
   */
  @visibility(Lifecycle.Read)
  @identifiers(#["name"])
  standardColumns?: Column[];

  /**
   * Table category.
   */
  @visibility(Lifecycle.Read)
  categories?: string[];

  /**
   * Table labels.
   */
  @visibility(Lifecycle.Read)
  labels?: string[];

  /**
   * Table's creator.
   */
  @visibility(Lifecycle.Read)
  source?: SourceEnum;

  /**
   * Table's creator.
   */
  @visibility(Lifecycle.Read)
  tableType?: TableTypeEnum;

  /**
   * The subtype describes what APIs can be used to interact with the table, and what features are available against it.
   */
  @visibility(Lifecycle.Read)
  tableSubType?: TableSubTypeEnum;

  /**
   * List of solutions the table is affiliated with
   */
  @visibility(Lifecycle.Read)
  solutions?: string[];
}

/**
 * Table column.
 */
model Column {
  /**
   * Column name.
   */
  name?: string;

  /**
   * Column data type.
   */
  type?: ColumnTypeEnum;

  /**
   * Column data type logical hint.
   */
  dataTypeHint?: ColumnDataTypeHintEnum;

  /**
   * Column display name.
   */
  displayName?: string;

  /**
   * Column description.
   */
  description?: string;

  /**
   * Is displayed by default.
   */
  @visibility(Lifecycle.Read)
  isDefaultDisplay?: boolean;

  /**
   * Is column hidden.
   */
  @visibility(Lifecycle.Read)
  isHidden?: boolean;
}
