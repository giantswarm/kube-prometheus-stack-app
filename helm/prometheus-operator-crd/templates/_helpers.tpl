{{/* vim: set filetype=mustache: */}}
{{/* Expand the name of the chart. This is suffixed with -alertmanager, which means subtract 13 from longest 63 available */}}
{{- define "kube-prometheus-stack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 50 | trimSuffix "-" -}}
{{- end }}

{{- define "kube-prometheus-stack.crdInstall" -}}
{{- printf "%s-%s" ( include "kube-prometheus-stack.name" . ) "crd-install" | replace "+" "_" | trimSuffix "-" -}}
{{- end -}}

{{- define "kube-prometheus-stack.crdUninstall" -}}
{{- printf "%s-%s" ( include "kube-prometheus-stack.name" . ) "crd-uninstall" | replace "+" "_" | trimSuffix "-" -}}
{{- end -}}

{{- define "kube-prometheus-stack.Annotations" -}}
"helm.sh/hook": "pre-install,pre-upgrade,pre-delete"
"helm.sh/hook-delete-policy": "before-hook-creation,hook-succeeded,hook-failed"
{{- end -}}

{{- define "kube-prometheus-stack.AnnotationsInstall" -}}
"helm.sh/hook": "pre-install,pre-upgrade"
"helm.sh/hook-delete-policy": "before-hook-creation,hook-succeeded,hook-failed"
{{- end -}}

{{- define "kube-prometheus-stack.AnnotationsUninstall" -}}
"helm.sh/hook": "pre-delete"
"helm.sh/hook-delete-policy": "before-hook-creation,hook-succeeded,hook-failed"
{{- end -}}

{{- define "kube-prometheus-stack.selectorLabels" -}}
app.kubernetes.io/name: "{{ template "kube-prometheus-stack.name" . }}"
app.kubernetes.io/instance: "{{ template "kube-prometheus-stack.name" . }}"
{{- end -}}

{{/* Create a label which can be used to select any orphaned crd-install hook resources */}}
{{- define "kube-prometheus-stack.CRDInstallSelector" -}}
{{- printf "%s" "crd-install-hook" -}}
{{- end -}}
