{{/* this will override "kube-prometheus-stack.labels" in the sub-chart  */}}
{{/* Generate basic labels */}}
{{- define "kube-prometheus-stack.labels" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: "{{ .Chart.Version }}"
app.kubernetes.io/part-of: {{ template "kube-prometheus-stack.name" . }}
application.giantswarm.io/team: {{ index .Chart.Annotations "io.giantswarm.application.team" | default "atlas" | quote }}
chart: {{ include "kube-prometheus-stack.chartref" . | trunc 63 }}
release: {{ $.Release.Name | quote }}
heritage: {{ $.Release.Service | quote }}
{{- if .Values.commonLabels}}
{{ toYaml .Values.commonLabels }}
{{- end }}
{{- end }}

{{- define "kube-prometheus-stack.selectorLabels" -}}
app.kubernetes.io/name: "{{ template "kube-prometheus-stack.name" . }}"
app.kubernetes.io/instance: "{{ template "kube-prometheus-stack.name" . }}"
{{- end -}}

{{/* Generate basic labels for NetworkPolicy */}}
{{- define "kube-prometheus-stack.networkPolicySelector" }}
app.kubernetes.io/instance: {{ .Release.Name }}
release: {{ $.Release.Name | quote }}
{{- end }}


{{/* kube-state-metrics section */}}
{{- define "kube-state-metrics.name" -}}
{{- default "kube-state-metrics" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kube-state-metrics.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default "kube-state-metrics" .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Generate basic labels
*/}}
{{- define "kube-state-metrics.labels" }}
helm.sh/chart: {{ template "kube-state-metrics.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: metrics
app.kubernetes.io/part-of: {{ template "kube-state-metrics.name" . }}
{{- include "kube-state-metrics.selectorLabels" . }}
{{- if .Chart.Version }}
app.kubernetes.io/version: {{ .Chart.Version | quote }}
{{- end }}
{{- if .Values.customLabels }}
{{ toYaml .Values.customLabels }}
{{- end }}
{{- if .Values.releaseLabel }}
release: {{ $.Release.Name | quote }}
heritage: {{ $.Release.Service | quote }}
{{- end }}
application.giantswarm.io/team: {{ index .Chart.Annotations "application.giantswarm.io/team" | default "atlas" | quote }}
{{- end }}

{{/*
Name of the Secret holding the bearer token the control-plane ServiceMonitors present.

Defaults to upstream behaviour: the token Secret this chart creates for its own Prometheus
ServiceAccount, and therefore to upstream's `fail` message when that Secret is not rendered.
Installations where this chart does not deploy Prometheus - i.e. an external agent does the
scraping - point this at a Secret they manage.

Reads from `.Values.global` on purpose: this is invoked through the sub-chart's `tpl`, where
`.Values` is the sub-chart's value tree and `global` is the only shared branch.
*/}}
{{- define "giantswarm.controlPlaneScrapeAuth.secretName" -}}
{{- $cfg := (.Values.global).controlPlaneScrapeAuth | default dict -}}
{{- if $cfg.secretName -}}
{{- $cfg.secretName -}}
{{- else if $cfg.serviceAccountName -}}
{{- printf "%s-token" $cfg.serviceAccountName -}}
{{- else -}}
{{- include "kube-prometheus-stack.prometheus.tokenSecretName" . -}}
{{- end -}}
{{- end -}}
