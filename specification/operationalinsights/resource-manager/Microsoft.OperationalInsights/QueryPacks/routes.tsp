import "@azure-tools/typespec-azure-core";
import "@typespec/rest";
import "./models.tsp";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "./LogAnalyticsQueryPack.tsp";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.ResourceManager;
using TypeSpec.OpenAPI;

namespace Microsoft.OperationalInsights;

#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-interface-requires-decorator" "Relocation-only split; the QueryPacks name-less create action is carried forward verbatim from the 2025-07-01 API and must be preserved byte-for-byte."
interface QueryPacksOperationGroup {
  /**
   * Creates a Log Analytics QueryPack. Note: You cannot specify a different value for InstrumentationKey nor AppId in the Put operation.
   */
  @autoRoute
  @put
  @action("queryPacks")
  createOrUpdateWithoutName is ArmProviderActionSync<
    Request = LogAnalyticsQueryPack,
    Scope = Extension.ResourceGroup,
    Response = ArmResourceCreatedSyncResponse<LogAnalyticsQueryPack>
  >;
}
