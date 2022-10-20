{{/* this will override "kube-prometheus-stack.labels" in the sub-chart  */}}
{{/* Generate basic labels */}}
{{- define "kube-prometheus-stack.labels" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: "{{ .Chart.Version }}"
app.kubernetes.io/part-of: {{ template "kube-prometheus-stack.name" . }}
application.giantswarm.io/team: atlas
chart: {{ include "kube-prometheus-stack.chartref" . | trunc 63 }}
release: {{ $.Release.Name | quote }}
heritage: {{ $.Release.Service | quote }}
{{- if .Values.commonLabels}}
{{ toYaml .Values.commonLabels }}
{{- end }}
{{- end }}

{{/* Deploymet label Hook name. */}}
{{- define "prometheus-operator.deployment-label-name" -}}
{{- printf "%s-%s" ( include "kube-prometheus-stack.name" . ) "hook" | replace "+" "_" | trimSuffix "-" -}}
{{- end -}}

{{- define "kube-prometheus-stack.selectorLabels" -}}
app.kubernetes.io/name: "{{ template "kube-prometheus-stack.name" . }}"
app.kubernetes.io/instance: "{{ template "kube-prometheus-stack.name" . }}"
{{- end -}}


{{/* Job Deploymet label annotation */}}
{{- define "prometheus-operator.deployment-label-annotation" -}}
"helm.sh/hook": "post-install,post-upgrade"
"helm.sh/hook-delete-policy": "before-hook-creation,hook-succeeded"
{{- end -}}

{{/* Create a label which can be used to select any orphaned crd-install hook resources */}}
{{- define "prometheus-operator.deployment-label-selector" -}}
{{- printf "%s" "deployment-label-hook" -}}
{{- end -}}


{{/* Generate basic labels for NetworkPolicy */}}
{{- define "kube-prometheus-stack.networkPolicySelector" }}
app.kubernetes.io/instance: {{ .Release.Name }}
release: {{ $.Release.Name | quote }}
{{- end }}
