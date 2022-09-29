{{/* Create chart name and version as used by the chart label. */}}
{{- define "kube-prometheus-stack.chartref" -}}
{{- replace "+" "_" .Chart.Version | printf "%s-%s" .Chart.Name | trunc 63 -}}
{{- end }}


{{/* this will override "kube-prometheus-stack.labels" in the sub-chart  */}}
{{/* Generate basic labels */}}
{{- define "kube-prometheus-stack.labels" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: "{{ .Chart.Version }}"
app.kubernetes.io/part-of: {{ template "kube-prometheus-stack.name" . }}
application.giantswarm.io/team: atlas
chart: {{ template "kube-prometheus-stack.chartref" . }}
release: {{ $.Release.Name | quote }}
heritage: {{ $.Release.Service | quote }}
{{- if .Values.commonLabels}}
{{ toYaml .Values.commonLabels }}
{{- end }}
{{- end }}