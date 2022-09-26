
{{/* this will override "kube-prometheus-stack.labels" in the sub-chart  */}}
{{/* Generate basic labels */}}
{{- define "kube-prometheus-stack.labels" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: "{{ .Chart.Version }}"
app.kubernetes.io/part-of: {{ template "kube-prometheus-stack.name" . }}
application.giantswarm.io/team: atlas
chart: {{ template "kube-prometheus-stack.chartref" . | trunc 63 }}
release: {{ $.Release.Name | quote }}
heritage: {{ $.Release.Service | quote }}
{{- if .Values.commonLabels}}
{{ toYaml .Values.commonLabels }}
{{- end }}
{{- end }}