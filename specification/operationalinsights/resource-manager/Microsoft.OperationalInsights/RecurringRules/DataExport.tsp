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
 * The top level data export resource container.
 */
model DataExport is Azure.ResourceManager.ProxyResource<DataExportProperties> {
  ...ResourceNameParameter<
    Resource = DataExport,
    KeyName = "dataExportName",
    SegmentName = "dataExports",
    NamePattern = ""
  >;
}

@armResourceOperations(#{ omitTags: true })
interface DataExports {
  /**
   * Gets a data export instance.
   */
  @tag("DataExport")
  get is DataExportOps.Read<DataExport>;

  /**
   * Create or update a data export.
   */
  @tag("DataExport")
  createOrUpdate is DataExportOps.CreateOrUpdateSync<DataExport>;

  /**
   * Deletes the specified data export in a given workspace..
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "Relocation-only split; the 2025-07-01 DELETE returns 200/404 and must be preserved byte-for-byte. Deferred to a future intentional API version."
  @tag("DataExport")
  delete is DataExportOps.DeleteSync<
    DataExport,
    Response = ArmDeletedResponse | ArmNotFoundResponse
  >;

  /**
   * Lists the data export instances within a workspace.
   */
  @tag("DataExport")
  listByWorkspace is DataExportOps.List<
    DataExport,
    Response = ArmResponse<DataExportListResult>
  >;
}

alias DataExportOps = Azure.ResourceManager.Legacy.LegacyOperations<
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
     * The data export rule name.
     */
    @path
    @segment("dataExports")
    @key("dataExportName")
    dataExportName: string;
  }
>;

@@doc(DataExport.name, "The data export rule name.");
@@doc(DataExport.properties, "data export properties.");
@@doc(
  DataExports.createOrUpdate::parameters.resource,
  "The parameters required to create or update a data export."
);
