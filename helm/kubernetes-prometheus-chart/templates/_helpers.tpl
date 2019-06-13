{{- define "prometheus-operator.name" -}}
{{- default .Chart.Name | trunc 50 | trimSuffix "-" -}}
{{- end }}

{{- define "prometheus-operator.fullname" -}}
{{- .Release.Name | trunc 50 | trimSuffix "-" -}}
{{- end -}}
