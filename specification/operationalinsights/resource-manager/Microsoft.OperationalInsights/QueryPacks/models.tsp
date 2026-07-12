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
 * Properties that define an Log Analytics QueryPack-Query resource.
 */
#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "Relocation-only split; LogAnalyticsQueryPackQuery has no provisioningState in the 2025-07-01 API and must be preserved byte-for-byte. Adding one would be a contract change deferred to a future API version."
model LogAnalyticsQueryPackQueryProperties {
  /**
   * The unique ID of your application. This field cannot be changed.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-duplicate-property" "Relocation-only split; the properties-bag 'id' is carried forward verbatim from the 2025-07-01 API and must be preserved byte-for-byte; renaming it would break the contract."
  @visibility(Lifecycle.Read)
  id?: string;

  /**
   * Unique display name for your query within the Query Pack.
   */
  displayName: string;

  /**
   * Creation Date for the Log Analytics Query, in ISO 8601 format.
   */
  @visibility(Lifecycle.Read)
  timeCreated?: utcDateTime;

  /**
   * Last modified date of the Log Analytics Query, in ISO 8601 format.
   */
  @visibility(Lifecycle.Read)
  timeModified?: utcDateTime;

  /**
   * Object Id of user creating the query.
   */
  @visibility(Lifecycle.Read)
  author?: string;

  /**
   * Description of the query.
   */
  description?: string;

  /**
   * Body of the query.
   */
  body: string;

  /**
   * The related metadata items for the function.
   */
  related?: LogAnalyticsQueryPackQueryPropertiesRelated;

  /**
   * Tags associated with the query.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-no-record" "Relocation-only split; the Record<string[]> tags shape is carried forward verbatim from the 2025-07-01 API and must be preserved byte-for-byte."
  tags?: Record<string[]>;

  /**
   * Additional properties that can be set for the query.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-duplicate-property" "Relocation-only split; the nested 'properties' member is carried forward verbatim from the 2025-07-01 API and must be preserved byte-for-byte."
  #suppress "@azure-tools/typespec-azure-core/no-unknown" "Relocation-only split; the free-form 'properties' bag is typed as unknown to preserve the 2025-07-01 contract exactly."
  properties?: unknown;
}

/**
 * The related metadata items for the function.
 */
model LogAnalyticsQueryPackQueryPropertiesRelated {
  /**
   * The related categories for the function.
   */
  categories?: string[];

  /**
   * The related resource types for the function.
   */
  resourceTypes?: string[];

  /**
   * The related Log Analytics solutions for the function.
   */
  solutions?: string[];
}

/**
 * Properties that define an Log Analytics QueryPack-Query search properties.
 */
model LogAnalyticsQueryPackQuerySearchProperties {
  /**
   * The related metadata items for the function.
   */
  related?: LogAnalyticsQueryPackQuerySearchPropertiesRelated;

  /**
   * Tags associated with the query.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-no-record" "Relocation-only split; the Record<string[]> tags shape is carried forward verbatim from the 2025-07-01 API and must be preserved byte-for-byte."
  tags?: Record<string[]>;
}

/**
 * The related metadata items for the function.
 */
model LogAnalyticsQueryPackQuerySearchPropertiesRelated {
  /**
   * The related categories for the function.
   */
  categories?: string[];

  /**
   * The related resource types for the function.
   */
  resourceTypes?: string[];

  /**
   * The related Log Analytics solutions for the function.
   */
  solutions?: string[];
}

/**
 * Properties that define a Log Analytics QueryPack resource.
 */
model LogAnalyticsQueryPackProperties {
  /**
   * The unique ID of your application. This field cannot be changed.
   */
  @visibility(Lifecycle.Read)
  queryPackId?: string;

  /**
   * Creation Date for the Log Analytics QueryPack, in ISO 8601 format.
   */
  @visibility(Lifecycle.Read)
  timeCreated?: utcDateTime;

  /**
   * Last modified date of the Log Analytics QueryPack, in ISO 8601 format.
   */
  @visibility(Lifecycle.Read)
  timeModified?: utcDateTime;

  /**
   * Current state of this QueryPack: whether or not is has been provisioned within the resource group it is defined. Users cannot change this value but are able to read from it. Values will include Succeeded, Deploying, Canceled, and Failed.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "Relocation-only split; provisioningState is carried forward verbatim as a free-form string from the 2025-07-01 API. Modeling it as an enum would be a contract change deferred to a future API version."
  @visibility(Lifecycle.Read)
  provisioningState?: string;
}

/**
 * A container holding only the Tags for a resource, allowing the user to update the tags on a QueryPack instance.
 */
model TagsResource {
  /**
   * Resource tags
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-no-record" "Relocation-only split; the Record<string> tags shape is carried forward verbatim from the 2025-07-01 API and must be preserved byte-for-byte."
  tags?: Record<string>;
}
