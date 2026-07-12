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
 * The SKU (tier) of a cluster.
 */
union ClusterSkuNameEnum {
  string,

  /**
   * CapacityReservation
   */
  CapacityReservation: "CapacityReservation",
}

/**
 * The provisioning state of the cluster.
 */
union ClusterEntityStatus {
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
 * Configures whether billing will be only on the cluster or each workspace will be billed by its proportional use. This does not change the overall billing, only how it will be distributed. Default value is 'Cluster'
 */
union BillingType {
  string,

  /**
   * Cluster
   */
  Cluster: "Cluster",

  /**
   * Workspaces
   */
  Workspaces: "Workspaces",
}

/**
 * The provisioning state of the cluster replication.
 */
union ClusterReplicationState {
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
 * The cluster sku definition.
 */
model ClusterSku {
  /**
   * The capacity reservation level in Gigabytes for this cluster.
   */
  #suppress "@azure-tools/typespec-azure-core/no-nullable" "Preserves the nullable capacity property from the 2025-07-01 API for byte-identical relocation; changing nullability would be a contract change deferred to a future API version."
  capacity?: int64 | null;

  /**
   * The SKU (tier) of a cluster.
   */
  name?: ClusterSkuNameEnum;
}

/**
 * Cluster properties.
 */
model ClusterProperties {
  /**
   * The ID associated with the cluster.
   */
  @visibility(Lifecycle.Read)
  clusterId?: string;

  /**
   * The provisioning state of the cluster.
   */
  @visibility(Lifecycle.Read)
  provisioningState?: ClusterEntityStatus;

  /**
   * Configures whether cluster will use double encryption. This Property can not be modified after cluster creation. Default value is 'true'
   */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  isDoubleEncryptionEnabled?: boolean;

  /**
   * Sets whether the cluster will support availability zones. This can be set as true only in regions where Azure Data Explorer support Availability Zones. This Property can not be modified after cluster creation. Default value is 'true' if region supports Availability Zones.
   */
  isAvailabilityZonesEnabled?: boolean;

  /**
   * The cluster's billing type.
   */
  billingType?: BillingType;

  /**
   * The associated key properties.
   */
  keyVaultProperties?: KeyVaultProperties;

  /**
   * The last time the cluster was updated.
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  lastModifiedDate?: utcDateTime;

  /**
   * The cluster creation time
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  createdDate?: utcDateTime;

  /**
   * The list of Log Analytics workspaces associated with the cluster
   */
  @identifiers(#["workspaceId"])
  associatedWorkspaces?: AssociatedWorkspace[];

  /**
   * Additional properties for capacity reservation
   */
  capacityReservationProperties?: CapacityReservationProperties;

  /**
   * Cluster's replication properties.
   */
  replication?: ClusterReplicationProperties;
}

/**
 * The key vault properties.
 */
model KeyVaultProperties {
  /**
   * The Key Vault uri which holds they key associated with the Log Analytics cluster.
   */
  keyVaultUri?: string;

  /**
   * The name of the key associated with the Log Analytics cluster.
   */
  keyName?: string;

  /**
   * The version of the key associated with the Log Analytics cluster.
   */
  keyVersion?: string;

  /**
   * Selected key minimum required size.
   */
  keyRsaSize?: int32;
}

/**
 * The list of Log Analytics workspaces associated with the cluster.
 */
model AssociatedWorkspace {
  /**
   * Associated workspace immutable id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-format" "Preserves format: uuid on the associated workspace immutable id from the 2025-07-01 API for byte-identical relocation; removing the format would be a contract change deferred to a future API version."
  @visibility(Lifecycle.Read)
  @format("uuid")
  workspaceId?: string;

  /**
   * Associated workspace resource name.
   */
  @visibility(Lifecycle.Read)
  workspaceName?: string;

  /**
   * Associated workspace arm resource id, in the form of: '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}.
   */
  @visibility(Lifecycle.Read)
  resourceId?: Azure.Core.armResourceIdentifier<[
    {
      type: "Microsoft.OperationalInsights/workspaces";
    }
  ]>;

  /**
   * The time of workspace association.
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  associateDate?: utcDateTime;
}

/**
 * The Capacity Reservation properties.
 */
model CapacityReservationProperties {
  /**
   * The last time Sku was updated.
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  lastSkuUpdate?: utcDateTime;

  /**
   * Minimum CapacityReservation value in Gigabytes.
   */
  @visibility(Lifecycle.Read)
  minCapacity?: int64;
}

/**
 * Cluster replication properties.
 */
model ClusterReplicationProperties {
  /**
   * The secondary location of the replication. If replication is being enabled, enabled must be provided.
   */
  @visibility(Lifecycle.Read, Lifecycle.Create)
  location?: string;

  /**
   * Specifies whether the replication is enabled or not. When true the cluster is replicate to the specified location.
   */
  enabled?: boolean;

  /**
   * Should enable AvailabilityZones for the given replicated cluster
   */
  isAvailabilityZonesEnabled?: boolean;

  /**
   * The provisioning state of the cluster replication.
   */
  @visibility(Lifecycle.Read)
  provisioningState?: ClusterReplicationState;

  /**
   * The cluster's replication creation time
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  createdDate?: utcDateTime;

  /**
   * The last time the cluster's replication was updated.
   */
  @visibility(Lifecycle.Read)
  // FIXME: (utcDateTime) Please double check that this is the correct type for your scenario.
  lastModifiedDate?: utcDateTime;
}

/**
 * The top level Log Analytics cluster resource container.
 */
model ClusterPatch {
  /**
   * Log Analytics cluster properties.
   */
  properties?: ClusterPatchProperties;

  /**
   * Resource's identity.
   */
  identity?: Azure.ResourceManager.CommonTypes.ManagedServiceIdentity;

  /**
   * The sku properties.
   */
  sku?: ClusterSku;

  /**
   * Resource tags.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-no-record" "Preserves the Record<string> tags shape from the 2025-07-01 API for byte-identical relocation; restructuring would be a contract change deferred to a future API version."
  @visibility(Lifecycle.Read, Lifecycle.Create, Lifecycle.Update)
  tags?: Record<string>;
}

/**
 * Log Analytics cluster patch properties.
 */
model ClusterPatchProperties {
  /**
   * The associated key properties.
   */
  keyVaultProperties?: KeyVaultProperties;

  /**
   * The cluster's billing type.
   */
  billingType?: BillingType;
}
