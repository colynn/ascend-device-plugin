{{- define "atlas-device-plugin.fullimage" -}}
{{- .Values.global.dockerRegistry -}}/{{- .Values.image.plugin.repository -}}:{{- .Values.image.plugin.tag -}}
{{- end }}

{{- define "npu-exporter.fullimage" -}}
{{- .Values.global.dockerRegistry -}}/{{- .Values.image.exporter.repository -}}:{{- .Values.image.exporter.tag -}}
{{- end }}


{{- define "volcano-scheduler.fullimage" -}}
{{- .Values.global.dockerRegistry -}}/{{- .Values.volcano.scheduler.repository -}}:{{- .Values.volcano.scheduler.tag -}}
{{- end }}


{{- define "volcano-controller.fullimage" -}}
{{- .Values.global.dockerRegistry -}}/{{- .Values.volcano.controller.repository -}}:{{- .Values.volcano.controller.tag -}}
{{- end }}


{{- define "ascend-noded.fullimage" -}}
{{- .Values.global.dockerRegistry -}}/{{- .Values.volcano.noded.repository -}}:{{- .Values.volcano.noded.tag -}}
{{- end }}

{{- define "ascend-clusterd.fullimage" -}}
{{- .Values.global.dockerRegistry -}}/{{- .Values.volcano.clusterd.repository -}}:{{- .Values.volcano.clusterd.tag -}}
{{- end }}

{{- define "initContainers.fullimage" -}}
{{- .Values.global.dockerRegistry -}}/{{- .Values.initContainers.repository -}}:{{- .Values.initContainers.tag -}}
{{- end }}

{{- define "atlas-device-plgin.imagePullSecrets" -}}
{{- if .Values.image.pullSecrets -}}
imagePullSecrets:
{{- range .Values.image.pullSecrets }}
  - name: {{ . }}
{{- end }}
{{- else }}
imagePullSecrets: {}
{{- end }}
{{- end }}

{{- define "common.names.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.names.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.labels.standard" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
helm.sh/chart: {{ include "common.names.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}