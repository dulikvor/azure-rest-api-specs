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
 * The top level Log Analytics cluster resource container.
 */
model Cluster is Azure.ResourceManager.TrackedResource<ClusterProperties> {
  ...ResourceNameParameter<
    Resource = Cluster,
    KeyName = "clusterName",
    SegmentName = "clusters",
    NamePattern = ""
  >;
  ...Azure.ResourceManager.ManagedServiceIdentityProperty;

  /**
   * The sku properties.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-invalid-envelope-property" "Preserves the top-level sku envelope property from the 2025-07-01 API for byte-identical relocation; moving it would be a contract change deferred to a future API version."
  sku?: ClusterSku;
}

@armResourceOperations
interface Clusters {
  /**
   * Gets a Log Analytics cluster instance.
   */
  get is ArmResourceRead<Cluster>;

  /**
   * Create or update a Log Analytics cluster.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-put-operation-response-codes" "Relocation-only split; the 2025-07-01 PUT returns 200/202 (no 201) and must be preserved byte-for-byte. Modernizing to 201/provisioningState is deferred to a future intentional API version."
  createOrUpdate is ArmResourceCreateOrReplaceAsync<
    Cluster,
    Response =
      | ArmResourceUpdatedResponse<Cluster>
      | ArmAcceptedLroResponse<LroHeaders = ArmCombinedLroHeaders<FinalResult = Cluster> &
          Azure.Core.Foundations.RetryAfterHeader>
  >;

  /**
   * Updates a Log Analytics cluster.
   */
  @patch(#{ implicitOptionality: false })
  update is ArmCustomPatchAsync<
    Cluster,
    PatchModel = ClusterPatch,
    LroHeaders = ArmCombinedLroHeaders<FinalResult = Cluster> &
      Azure.Core.Foundations.RetryAfterHeader
  >;

  /**
   * Deletes a cluster instance.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "Relocation-only split; the 2025-07-01 async DELETE response-code set is the shipped contract and must be preserved byte-for-byte. Deferred to a future intentional API version."
  delete is ArmResourceDeleteWithoutOkAsync<
    Cluster,
    Response =
      | ArmDeletedResponse
      | ArmDeleteAcceptedLroResponse
      | ArmDeletedNoContentResponse
  >;

  /**
   * Gets Log Analytics clusters in a resource group.
   */
  listByResourceGroup is ArmResourceListByParent<Cluster>;

  /**
   * Gets the Log Analytics clusters in a subscription.
   */
  list is ArmListBySubscription<Cluster>;
}

@@doc(Cluster.name, "Name of the Log Analytics Cluster.");
@@doc(Cluster.properties, "Log Analytics cluster properties.");
@@doc(
  Clusters.createOrUpdate::parameters.resource,
  "The parameters required to create or update a Log Analytics cluster."
);
@@doc(
  Clusters.update::parameters.properties,
  "The parameters required to patch a Log Analytics cluster."
);
