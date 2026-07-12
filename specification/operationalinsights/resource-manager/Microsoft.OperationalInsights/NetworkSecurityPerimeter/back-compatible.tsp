import "@azure-tools/typespec-client-generator-core";

using Azure.ClientGenerator.Core;
using Microsoft.OperationalInsights;

@@clientLocation(NetworkSecurityPerimeterConfigurations.getNSP, "Workspaces");
@@clientLocation(NetworkSecurityPerimeterConfigurations.listNSP, "Workspaces");
@@clientLocation(
  NetworkSecurityPerimeterConfigurations.reconcileNSP,
  "Workspaces"
);
