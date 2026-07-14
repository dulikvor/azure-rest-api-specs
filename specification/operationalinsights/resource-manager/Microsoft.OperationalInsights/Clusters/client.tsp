import "@azure-tools/typespec-client-generator-core";
import "./main.tsp";

using Azure.ClientGenerator.Core;
using Azure.Core;
using Microsoft.OperationalInsights;

// -----------------------------------------------------------------------------
// C# client customizations for the per-service Clusters package.
//
// Mirrors the Clusters-relevant csharp customizations from the previous combined
// OperationalInsights/client.tsp so consumers migrating from the old package keep
// the same `OperationalInsights*` type names and member shapes.
// -----------------------------------------------------------------------------

@@clientName(Cluster, "OperationalInsightsCluster", "csharp");
@@clientName(BillingType, "OperationalInsightsBillingType", "csharp");
@@clientName(
  CapacityReservationProperties,
  "OperationalInsightsCapacityReservationProperties",
  "csharp"
);
@@clientName(
  AssociatedWorkspace,
  "OperationalInsightsClusterAssociatedWorkspace",
  "csharp"
);
@@clientName(AssociatedWorkspace.associateDate, "AssociatedOn", "csharp");
@@alternateType(ClusterProperties.clusterId, uuid, "csharp");
@@clientName(
  ClusterEntityStatus,
  "OperationalInsightsClusterEntityStatus",
  "csharp"
);
@@clientName(ClusterSkuNameEnum, "OperationalInsightsClusterSkuName", "csharp");
@@clientName(
  ClusterReplicationState,
  "OperationalInsightsClusterReplicationState",
  "csharp"
);
@@clientName(
  ClusterReplicationProperties,
  "OperationalInsightsClusterReplicationProperties",
  "csharp"
);
@@clientName(
  ClusterReplicationProperties.enabled,
  "IsReplicationEnabled",
  "csharp"
);
@@clientName(ClusterSku, "OperationalInsightsClusterSku", "csharp");
@@clientName(Capacity, "OperationalInsightsClusterCapacity", "csharp");
@@clientName(
  KeyVaultProperties,
  "OperationalInsightsKeyVaultProperties",
  "csharp"
);
@@clientName(
  CapacityReservationProperties.lastSkuUpdate,
  "LastSkuUpdatedOn",
  "csharp"
);
@@alternateType(ClusterSku.capacity, Capacity, "csharp");

namespace Microsoft.OperationalInsights {
  #suppress "@azure-tools/typespec-azure-core/no-enum" "Preserve previous .NET numeric enum shape used by @@alternateType for SDK compatibility"
  enum Capacity {
    FiveHundred: 500,
    TenHundred: 1000,
    TwoThousand: 2000,
    FiveThousand: 5000,
  }
}
