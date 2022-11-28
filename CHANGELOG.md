# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project's packages adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Disable AppArmor in embedded grafana

## [2.1.1] - 2022-11-24

### Fixed

- Enable PSP by default.

## [2.1.0] - 2022-11-24

### Added

- Added `CiliumNetworkPolicy` for the deployment-label-hook.

## [2.0.2] - 2022-10-31

### Changed

- Push app to GCP collection

## [2.0.1] - 2022-10-24

### Changed

- Disable `node-exporter` by default.

### Fixed

- Fix coredns service selector.

## [2.0.0] - 2022-10-20

### Changed

- Upgrade prometheus-operator to v0.54.0, There's a lot of breaking changes please check [update-changes](./changelog/23.x_32.x.md)

## [1.3.1] - 2022-10-06

### Added

- Added Circle CI job to push to CAPA app collection

## [1.3.0] - 2022-06-28

### Added

- Label resources with `application.giantswarm.io/team` label.

## [1.2.1] - 2022-05-10

### Fixed

- Scrape only the alertmanager http port and not the gossip protocol.

## [1.2.0] - 2022-05-10

### Added

- Add giantswarm monitoring label to alertmanager.

## [1.1.2] - 2022-03-11

### Fixed

- Fix crd-install job permission, add list verb.

## [1.1.1] - 2022-03-11

### Fixed

- Support custom app name & namespace for prometheus-operator-crd.

## [1.1.0] - 2022-03-01

### Added

- Add giantswarm monitoring label to prometheus.

### Fixed

- Set grafana ingress class name to nginx by default.

## [1.0.2] - 2022-01-24

### Fixed

- Fix CRD helm chart namespace

## [1.0.1] - 2022-01-20

### Changed

- Add monitoring label to scrape prometheus-operator metrics.

## [1.0.0] - 2022-01-20

### Fixed

- Fix CRD helm chart ownership
- Fix `kube-state-metrics` selector, see https://github.com/prometheus-community/helm-charts/blob/main/charts/prometheus/README.md#to-150

### Removed

- Move CRD out into giantswarm/prometheus-operator-crd.

## [0.12.1] - 2021-12-17

### Fixed

- Make pre-install/pre-upgrade CRD install hooks use server side apply.

## [0.12.0] - 2021-12-14

### Changed

- Sync with upstream chart version [kube-prometheus-stack-23.2.0](https://github.com/prometheus-community/helm-charts/releases/tag/kube-prometheus-stack-23.2.0)
    - Upgrade prometheus-operator from 0.50.0 to [0.52.1](https://github.com/prometheus-operator/prometheus-operator/releases/tag/v0.50.0)

## [0.11.0] - 2021-12-13

### Changed

- Sync with upstream chart version [kube-prometheus-stack-19.3.0](https://github.com/prometheus-community/helm-charts/releases/tag/kube-prometheus-stack-19.3.0)
    - Upgrade prometheus-operator from 0.49.0 to [0.50.0](https://github.com/prometheus-operator/prometheus-operator/releases/tag/v0.50.0)
    - fix `.Values.grafana.sidecar.dashboards.multicluster`
    - remove `values.schema.json`
    - fix docker image repositories
    - remove `kube-webhook-certgen` image sha

## [0.10.2] - 2021-10-22

- Update app metadata

## [0.10.1] - 2021-10-21

- Update app metadata

## [0.10.0] - 2021-08-03

### Added

- Basic sli monitoring for prometheus-operator deployment

### Changed

- Sync with upstream chart version [kube-prometheus-stack-17.0.3](https://github.com/prometheus-community/helm-charts/releases/tag/kube-prometheus-stack-17.0.3)
    - Upgrade prometheus-operator from 0.47.0 to [0.49.0](https://github.com/prometheus-operator/prometheus-operator/releases/tag/v0.49.0)
    - Upgrade prometheus from 2.26.1 to [2.28.1](https://github.com/prometheus/prometheus/releases/tag/v2.28.1)
    - Upgrade alertmanager from 0.21.0 to [0.22.2](https://github.com/prometheus/alertmanager/releases/tag/v0.22.2)
    - Remove pre 1.14 prometheus rules and grafana dashboards
    - `kubeApiServer.relabelings` moved to `kubeApiServer.serviceMonitor.relabelings`
    - Use `"helm.sh/hook-delete-policy": before-hook-creation,hook-succeeded` in all helm hooks
    - Change selectorLabels from `app: prometheus` to `app.kubernetes.io/name: prometheus` in prometheus deployment

## [0.9.0] - 2021-07-14

### Changed

- Use `giantswarm/config` to generate managed configuration.

## [0.8.2] - 2021-05-21

### Changed

- Sync with upstream chart version [kube-prometheus-stack-15.4.6](https://github.com/prometheus-community/helm-charts/releases/tag/kube-prometheus-stack-15.4.6)
- Add sha values to all image references in values.yaml
- Bump default prometheus image to 2.26.1 to mitigate [CVE-2021-29622](https://github.com/prometheus/prometheus/security/advisories/GHSA-vx57-7f4q-fpc7)

## [0.8.1] - 2021-05-11

### Changed

- Enable `ingressClass` and `pathType` by default to ease installing on kubernetes >= 1.18.

## [0.7.2] - 2021-04-27

- Internal release, do not use.

## [0.7.1] - 2021-04-27

- Internal release, do not use.

## [0.8.0] - 2021-04-26

### Changed

- Sync with upstream chart version kube-prometheus-stack-15.2.0
- prometheus-operator v0.45.0 -> v0.47.0
- prometheus-config-reloader v0.45.0 -> v0.47.0
- prometheus v2.24.0 -> v2.26.0

## [0.7.0] - 2021-02-24

### Changed

- Sync with upstream chart version kube-prometheus-stack-13.10.0
- prometheus-operator v0.43.2 -> v0.45.0
- prometheus-config-reloader v0.43.2 -> v0.45.0
- prometheus v2.22.1 -> v2.24.0
- **Breaking** chart `apiVersion` changes from `v1` to `v2`. The chart needs helm 3 to install now.

## [0.6.0] - 2021-01-25

### Changed

- Ignore secrets of type `helm.sh/release.v1` by default to prevent OOM on starting.

## [0.5.2] - 2021-01-20

### Fixed

- CRDs are now created correctly on the first install of the App.

## [0.5.1] - 2021-01-13

### Fixed

- Update `values.schema.json` to reflect current values file.

## [0.5.0] - 2021-01-05

### Added

- Added values schema for validating default values

### Updated

- sync with upstream chart version kube-prometheus-stack-11.1.7
- prometheus-operator v0.42.1 -> v0.43.2
- prometheus-config-reloader v0.42.1 -> v0.43.2
- prometheus v2.21.0 -> v2.22.1
- updated scripts (changed sync_chart, added generate_patch)

### Fixed

- Fixed helm CRDs issue by adding crd-install job, to ensure CRDs are up to date

## [0.4.0] - 2020-10-15

### Added

- SHA variable for images

### Changed

- Upstream project location an references throughout the chart
- Change upstream-sync script to new upstream project location and structure
- Replace hyperkube image with kubectl image
- Replace name "prometheus-operator" with "kube-prometheus-stack" in templates

### Updated

- Sync with upstream chart version 10.1.0
- prometheus-operator v0.38.1 -> v0.42.1
- alertmanager v0.20.0 -> v0.21.0
- configmap-reload v0.3.0 -> v0.4.0
- prometheus-config-reloader v0.38.1 -> v0.42.1
- prometheus v2.18.1 -> v2.21.0
- new structure and format to all prometheus rules

## [0.3.4] - 2020-07-22

### Added

- Set default request/limits in deployment (cpu: 100m, memory: 100Mi) per best practice

### Changed

- Sync with upstream
    - Bug fixes
    - Add namespace overwrite

### Updated

- Update architect-orb to `0.10.0`
- kube-state-metrics chart `2.8.8` -> `2.8.11`
- grafana chart `5.1.4` -> `5.3.0`
- grafana chart requirement `5.1.*` -> `5.3.*`
- configmapReloadImage `0.0.1` -> `0.3.0`
- hyperkubeImage `1.12.1` -> `1.16.12`


## [v0.3.3]

### Changed

- Introduce `crd-install` hook for helm 2 compatibility.
- Update Prometheus to 2.18.1
- Update Grafana chart to 5.1.4
- Update prometheus-node-exporter chart to 1.10.0

## [v0.3.2]

### Changed
- Fix CRD installation to support both helm2 and helm3
- Add support for installations in China

## [v0.3.1]

### Changed
- Fix application name in the circleci config

## [v0.3.0]

### Changed
- Fix kubelet service name in the Prometheus Operator deployment
- Update Prometheus Operator to 0.38.1
- Update Prometheus to 2.17.2
- Update Alert manager to 0.20.0
- Update Grafana chart to 5.0.25
- Update kube-state-metrics chart to 2.8.5
- Update prometheus-node-exporter chart to 1.9.1
- Rename to prometheus-operator-app

## [v0.2.0]

### Changed
- Add Kubernetes 1.16 support
- Update Prometheus Operator to 0.35.0
- Update Prometheus to 2.15.2
- Update Alert manager to 0.19.0
- Update Grafana chart to 4.2.3
- Update kube-state-metrics chart to 2.4.1
- Update prometheus-node-exporter chart to 1.8.1

## [v0.1.1]

### Changed

- Disable App Armor in grafana as it does not work on CoreOS and Flatcar.

## [v0.1.0]

### Added

- First version of the prometheus operator chart.

[Unreleased]: https://github.com/giantswarm/prometheus-operator-app/compare/v2.1.1...HEAD
[2.1.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v2.1.0...v2.1.1
[2.1.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v2.0.2...v2.1.0
[2.0.2]: https://github.com/giantswarm/prometheus-operator-app/compare/v2.0.1...v2.0.2
[2.0.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v2.0.0...v2.0.1
[2.0.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v1.3.1...v2.0.0
[1.3.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v1.3.0...v1.3.1
[1.3.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v1.2.1...v1.3.0
[1.2.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v1.1.2...v1.2.0
[1.1.2]: https://github.com/giantswarm/prometheus-operator-app/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v1.0.2...v1.1.0
[1.0.2]: https://github.com/giantswarm/prometheus-operator-app/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.12.1...v1.0.0
[0.12.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.12.0...v0.12.1
[0.12.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.11.0...v0.12.0
[0.11.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.10.2...v0.11.0
[0.10.2]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.10.1...v0.10.2
[0.10.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.10.0...v0.10.1
[0.10.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.9.0...v0.10.0
[0.9.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.8.2...v0.9.0
[0.8.2]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.8.1...v0.8.2
[0.8.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.8.0...v0.8.1
[0.8.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.7.0...v0.8.0
[0.7.2]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.7.1...v0.7.2
[0.7.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.7.0...v0.7.1
[0.7.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.5.2...v0.6.0
[0.5.2]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.5.1...v0.5.2
[0.5.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.3.4...v0.4.0
[0.3.4]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.3.3...v0.3.4
[v0.3.3]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.3.2..v0.3.3
[v0.3.2]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.3.1..v0.3.2
[v0.3.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.3.0..v0.3.1
[v0.3.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.2.0..v0.3.0
[v0.2.0]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.1.1..v0.2.0
[v0.1.1]: https://github.com/giantswarm/prometheus-operator-app/compare/v0.1.0..v0.1.1

[v0.1.0]: https://github.com/giantswarm/prometheus-operator-app/releases/tag/v0.1.0
