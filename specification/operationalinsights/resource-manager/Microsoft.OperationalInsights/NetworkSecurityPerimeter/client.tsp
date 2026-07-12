import "@azure-tools/typespec-client-generator-core";
import "./main.tsp";

using Azure.ClientGenerator.Core;
using Azure.Core;
using Microsoft.OperationalInsights;

// NSP operation client names (moved from the OperationalInsights core client).
@@clientName(NetworkSecurityPerimeterConfigurations.getNSP, "getNsp", "java");
@@clientName(NetworkSecurityPerimeterConfigurations.listNSP, "listNsp", "java");
@@clientName(
  NetworkSecurityPerimeterConfigurations.reconcileNSP,
  "reconcileNsp",
  "java"
);
@@clientName(
  NetworkSecurityPerimeterConfigurations.getNSP,
  "GetNetworkSecurityPerimeterConfiguration",
  "csharp"
);
@@clientName(
  NetworkSecurityPerimeterConfigurations.listNSP,
  "GetNetworkSecurityPerimeterConfigurations",
  "csharp"
);
@@clientName(
  NetworkSecurityPerimeterConfigurations.reconcileNSP,
  "ReconcileNetworkSecurityPerimeterConfiguration",
  "csharp"
);

// C# names for Network Security Perimeter common types need RP context
// (moved from the OperationalInsights core client).
@@clientName(
  Azure.ResourceManager.CommonTypes.AccessRule,
  "OperationalInsightsNetworkSecurityPerimeterAccessRule",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.AccessRuleDirection,
  "OperationalInsightsNetworkSecurityPerimeterAccessRuleDirection",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.AccessRuleProperties,
  "OperationalInsightsNetworkSecurityPerimeterAccessRuleProperties",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.IssueType,
  "OperationalInsightsNetworkSecurityPerimeterIssueType",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.NetworkSecurityPerimeter,
  "OperationalInsightsNetworkSecurityPerimeter",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.NetworkSecurityPerimeterConfiguration,
  "OperationalInsightsNetworkSecurityPerimeterConfiguration",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.NetworkSecurityPerimeterConfigurationProperties,
  "OperationalInsightsNetworkSecurityPerimeterConfigurationProperties",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.NetworkSecurityPerimeterConfigurationProvisioningState,
  "OperationalInsightsNetworkSecurityPerimeterConfigurationProvisioningState",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.NetworkSecurityProfile,
  "OperationalInsightsNetworkSecurityProfile",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.ProvisioningIssue,
  "OperationalInsightsNetworkSecurityPerimeterProvisioningIssue",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.ProvisioningIssueProperties,
  "OperationalInsightsNetworkSecurityPerimeterProvisioningIssueProperties",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.ResourceAssociation,
  "OperationalInsightsNetworkSecurityPerimeterResourceAssociation",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.ResourceAssociationAccessMode,
  "OperationalInsightsNetworkSecurityPerimeterResourceAssociationAccessMode",
  "csharp"
);
@@clientName(
  Azure.ResourceManager.CommonTypes.Severity,
  "OperationalInsightsNetworkSecurityPerimeterSeverity",
  "csharp"
);
@@alternateType(
  Azure.ResourceManager.CommonTypes.NetworkSecurityPerimeter.location,
  Azure.Core.azureLocation,
  "csharp"
);
