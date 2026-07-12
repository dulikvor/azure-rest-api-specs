import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.OperationalInsights;
/**
 * Workspace data table definition.
 */
model Table is Azure.ResourceManager.ProxyResource<TableProperties> {
  ...ResourceNameParameter<
    Resource = Table,
    KeyName = "tableName",
    SegmentName = "tables",
    NamePattern = "^[A-Za-z0-9-_]+$"
  >;
}

alias TableOps = Azure.ResourceManager.Legacy.LegacyOperations<
  {
    ...ApiVersionParameter;
    ...SubscriptionIdParameter;
    ...ResourceGroupParameter;
    ...Legacy.Provider;

    /**
     * The name of the workspace.
     */
    @path
    @segment("workspaces")
    @key("workspaceName")
    @minLength(4)
    @maxLength(63)
    @pattern("^[A-Za-z0-9][A-Za-z0-9-]+[A-Za-z0-9]$")
    workspaceName: string;
  },
  {
    /**
     * The name of the table.
     */
    @path
    @segment("tables")
    @key("tableName")
    @minLength(4)
    @maxLength(63)
    @pattern("^[A-Za-z0-9-_]+$")
    tableName: string;
  }
>;

@armResourceOperations
interface Tables {
  /**
   * Gets a Log Analytics workspace table.
   */
  get is TableOps.Read<Table>;

  /**
   * Update or Create a Log Analytics workspace table.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-put-operation-response-codes" "Relocation-only split of the existing 2025-07-01 Tables API; the PUT 200/202 async model (no 201) is the shipped 2025-07-01 contract and must be preserved byte-for-byte. Modernizing to 201/provisioningState is deferred to a future intentional API version."
  #suppress "@azure-tools/typespec-azure-resource-manager/lro-location-header" "Relocation-only split; the 2025-07-01 LRO uses Azure-AsyncOperation without a Location header and must be preserved byte-for-byte. Deferred to a future intentional API version."
  createOrUpdate is TableOps.CreateOrUpdateAsync<
    Table,
    Response =
      | ArmResourceUpdatedResponse<Table>
      | ArmAcceptedLroResponse<LroHeaders = ArmAsyncOperationHeader<FinalResult = Table> &
          Azure.Core.Foundations.RetryAfterHeader>
  >;

  /**
   * Update a Log Analytics workspace table.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/lro-location-header" "Relocation-only split; the 2025-07-01 LRO uses Azure-AsyncOperation without a Location header and must be preserved byte-for-byte. Deferred to a future intentional API version."
  @patch(#{ implicitOptionality: false })
  update is TableOps.CustomPatchAsync<
    Table,
    PatchModel = Table,
    LroHeaders = ArmAsyncOperationHeader<FinalResult = Table> &
      Azure.Core.Foundations.RetryAfterHeader
  >;

  /**
   * Delete a Log Analytics workspace table.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/lro-location-header" "Relocation-only split; the 2025-07-01 LRO uses Azure-AsyncOperation without a Location header and must be preserved byte-for-byte. Deferred to a future intentional API version."
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "Relocation-only split; the 2025-07-01 async DELETE response-code set is the shipped contract and must be preserved byte-for-byte. Deferred to a future intentional API version."
  @Azure.Core.useFinalStateVia("azure-async-operation")
  delete is TableOps.DeleteWithoutOkAsync<
    Table,
    Response =
      | ArmDeletedResponse
      | ArmDeleteAcceptedLroResponse<ArmCombinedLroHeaders &
          Azure.Core.Foundations.RetryAfterHeader>
      | ArmDeletedNoContentResponse
  >;

  /**
   * Gets all the tables for the specified Log Analytics workspace.
   */
  listByWorkspace is TableOps.List<
    Table,
    Response = ArmResponse<TablesListResult>
  >;

  /**
   * Migrate a Log Analytics table from support of the Data Collector API and Custom Fields features to support of Data Collection Rule-based Custom Logs.
   */
  migrate is TableOps.ActionSync<Table, void, OkResponse>;

  /**
   * Cancel a log analytics workspace search results table query run.
   */
  cancelSearch is TableOps.ActionSync<Table, void, OkResponse>;
}

@@maxLength(Table.name, 63);
@@minLength(Table.name, 4);
@@doc(Table.name, "The name of the table.");
@@doc(Table.properties, "Table's properties.");
@@doc(
  Tables.createOrUpdate::parameters.resource,
  "The parameters required to update table properties."
);
@@doc(
  Tables.update::parameters.properties,
  "The parameters required to update table properties."
);
