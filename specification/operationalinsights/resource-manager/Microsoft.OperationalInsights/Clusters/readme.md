# OperationalInsights Clusters

> see https://aka.ms/autorest

This is the AutoRest configuration file for the Azure Log Analytics **Clusters** service (part of the `Microsoft.OperationalInsights` resource provider).

---

## Getting Started

To build the SDK for the OperationalInsights Clusters service, simply [Install AutoRest](https://aka.ms/autorest/install) and in this folder, run:

> `autorest`

To see additional help and options, run:

> `autorest --help`

---

## Configuration

### Basic Information

These are the global settings for the OperationalInsights Clusters service.

```yaml
title: OperationalInsightsManagementClient
description: Operational Insights Clusters Client
openapi-type: arm
tag: package-2026-06-01
```

### Tag: package-2026-06-01

These settings apply only when `--tag=package-2026-06-01` is specified on the command line.

```yaml $(tag) == 'package-2026-06-01'
input-file:
  - stable/2026-06-01/Clusters.json
```
