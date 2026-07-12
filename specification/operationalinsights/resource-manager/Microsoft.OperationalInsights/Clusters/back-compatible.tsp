import "@azure-tools/typespec-client-generator-core";

using Azure.ClientGenerator.Core;
using Microsoft.OperationalInsights;

@@clientName(Clusters.createOrUpdate::parameters.resource, "parameters");
@@clientName(Clusters.update::parameters.properties, "parameters");
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserves x-ms-client-flatten on Cluster.properties from the 2025-07-01 API so the relocated SDK surface stays byte-identical; legacy flatten is retained only for back-compat, not added net-new."
@@Legacy.flattenProperty(Cluster.properties);
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "Preserves x-ms-client-flatten on ClusterPatch.properties from the 2025-07-01 API so the relocated SDK surface stays byte-identical; legacy flatten is retained only for back-compat, not added net-new."
@@Legacy.flattenProperty(ClusterPatch.properties);
@@clientName(KeyVaultProperties, "keyVaultProperties");
