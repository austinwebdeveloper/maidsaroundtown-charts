{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "maidsaroundaustin.name" }}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this
(by the DNS naming spec).
*/}}
{{- define "maidsaroundaustin.fullname" }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Calculate ecommerce certificate
*/}}
{{- define "maidsaroundaustin.ecommerce-certificate" }}
{{- if (not (empty .Values.ingress.ecommerce.certificate)) }}
{{- printf .Values.ingress.ecommerce.certificate }}
{{- else }}
{{- printf "%s-ecommerce-letsencrypt" (include "maidsaroundaustin.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Calculate broomlyadmin certificate
*/}}
{{- define "maidsaroundaustin.broomlyadmin-certificate" }}
{{- if (not (empty .Values.ingress.broomlyadmin.certificate)) }}
{{- printf .Values.ingress.broomlyadmin.certificate }}
{{- else }}
{{- printf "%s-broomlyadmin-letsencrypt" (include "maidsaroundaustin.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Calculate broomlypro certificate
*/}}
{{- define "maidsaroundaustin.broomlypro-certificate" }}
{{- if (not (empty .Values.ingress.broomlypro.certificate)) }}
{{- printf .Values.ingress.broomlypro.certificate }}
{{- else }}
{{- printf "%s-broomlypro-letsencrypt" (include "maidsaroundaustin.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Calculate broomlycommerce certificate
*/}}
{{- define "maidsaroundaustin.broomlycommerce-certificate" }}
{{- if (not (empty .Values.ingress.broomlycommerce.certificate)) }}
{{- printf .Values.ingress.broomlycommerce.certificate }}
{{- else }}
{{- printf "%s-broomlycommerce-letsencrypt" (include "maidsaroundaustin.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Calculate ecommerce hostname
*/}}
{{- define "maidsaroundaustin.ecommerce-hostname" }}
{{- if (and .Values.config.ecommerce.hostname (not (empty .Values.config.ecommerce.hostname))) }}
{{- printf .Values.config.ecommerce.hostname }}
{{- else }}
{{- if .Values.ingress.ecommerce.enabled }}
{{- printf .Values.ingress.ecommerce.hostname }}
{{- else }}
{{- printf "%s-ecommerce" (include "maidsaroundaustin.fullname" .) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Calculate ecommerce base url
*/}}
{{- define "maidsaroundaustin.ecommerce-base-url" }}
{{- if (and .Values.config.ecommerce.baseUrl (not (empty .Values.config.ecommerce.baseUrl))) }}
{{- printf .Values.config.ecommerce.baseUrl }}
{{- else }}
{{- if .Values.ingress.ecommerce.enabled }}
{{- $hostname := ((empty (include "maidsaroundaustin.ecommerce-hostname" .)) | ternary .Values.ingress.ecommerce.hostname (include "maidsaroundaustin.ecommerce-hostname" .)) }}
{{- $path := (eq .Values.ingress.ecommerce.path "/" | ternary "" .Values.ingress.ecommerce.path) }}
{{- $protocol := (.Values.ingress.ecommerce.tls | ternary "https" "http") }}
{{- printf "%s://%s%s" $protocol $hostname $path }}
{{- else }}
{{- printf "http://%s" (include "maidsaroundaustin.ecommerce-hostname" .) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Calculate broomlyadmin hostname
*/}}
{{- define "maidsaroundaustin.broomlyadmin-hostname" }}
{{- if (and .Values.config.broomlyadmin.hostname (not (empty .Values.config.broomlyadmin.hostname))) }}
{{- printf .Values.config.broomlyadmin.hostname }}
{{- else }}
{{- if .Values.ingress.broomlyadmin.enabled }}
{{- printf .Values.ingress.broomlyadmin.hostname }}
{{- else }}
{{- printf "%s-broomlyadmin" (include "maidsaroundaustin.fullname" .) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Calculate broomlyadmin base url
*/}}
{{- define "maidsaroundaustin.broomlyadmin-base-url" }}
{{- if (and .Values.config.broomlyadmin.baseUrl (not (empty .Values.config.broomlyadmin.baseUrl))) }}
{{- printf .Values.config.broomlyadmin.baseUrl }}
{{- else }}
{{- if .Values.ingress.broomlyadmin.enabled }}
{{- $hostname := ((empty (include "maidsaroundaustin.broomlyadmin-hostname" .)) | ternary .Values.ingress.broomlyadmin.hostname (include "maidsaroundaustin.broomlyadmin-hostname" .)) }}
{{- $path := (eq .Values.ingress.broomlyadmin.path "/" | ternary "" .Values.ingress.broomlyadmin.path) }}
{{- $protocol := (.Values.ingress.broomlyadmin.tls | ternary "https" "http") }}
{{- printf "%s://%s%s" $protocol $hostname $path }}
{{- else }}
{{- printf "http://%s" (include "maidsaroundaustin.broomlyadmin-hostname" .) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Calculate broomlypro hostname
*/}}
{{- define "maidsaroundaustin.broomlypro-hostname" }}
{{- if (and .Values.config.broomlypro.hostname (not (empty .Values.config.broomlypro.hostname))) }}
{{- printf .Values.config.broomlypro.hostname }}
{{- else }}
{{- if .Values.ingress.broomlypro.enabled }}
{{- printf .Values.ingress.broomlypro.hostname }}
{{- else }}
{{- printf "%s-broomlypro" (include "maidsaroundaustin.fullname" .) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Calculate broomlypro base url
*/}}
{{- define "maidsaroundaustin.broomlypro-base-url" }}
{{- if (and .Values.config.broomlypro.baseUrl (not (empty .Values.config.broomlypro.baseUrl))) }}
{{- printf .Values.config.broomlypro.baseUrl }}
{{- else }}
{{- if .Values.ingress.broomlypro.enabled }}
{{- $hostname := ((empty (include "maidsaroundaustin.broomlypro-hostname" .)) | ternary .Values.ingress.broomlypro.hostname (include "maidsaroundaustin.broomlypro-hostname" .)) }}
{{- $path := (eq .Values.ingress.broomlypro.path "/" | ternary "" .Values.ingress.broomlypro.path) }}
{{- $protocol := (.Values.ingress.broomlypro.tls | ternary "https" "http") }}
{{- printf "%s://%s%s" $protocol $hostname $path }}
{{- else }}
{{- printf "http://%s" (include "maidsaroundaustin.broomlypro-hostname" .) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Calculate broomlycommerce hostname
*/}}
{{- define "maidsaroundaustin.broomlycommerce-hostname" }}
{{- if (and .Values.config.broomlycommerce.hostname (not (empty .Values.config.broomlycommerce.hostname))) }}
{{- printf .Values.config.broomlycommerce.hostname }}
{{- else }}
{{- if .Values.ingress.broomlycommerce.enabled }}
{{- printf .Values.ingress.broomlycommerce.hostname }}
{{- else }}
{{- printf "%s-broomlycommerce" (include "maidsaroundaustin.fullname" .) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Calculate broomlycommerce base url
*/}}
{{- define "maidsaroundaustin.broomlycommerce-base-url" }}
{{- if (and .Values.config.broomlycommerce.baseUrl (not (empty .Values.config.broomlycommerce.baseUrl))) }}
{{- printf .Values.config.broomlycommerce.baseUrl }}
{{- else }}
{{- if .Values.ingress.broomlycommerce.enabled }}
{{- $hostname := ((empty (include "maidsaroundaustin.broomlycommerce-hostname" .)) | ternary .Values.ingress.broomlycommerce.hostname (include "maidsaroundaustin.broomlycommerce-hostname" .)) }}
{{- $path := (eq .Values.ingress.broomlycommerce.path "/" | ternary "" .Values.ingress.broomlycommerce.path) }}
{{- $protocol := (.Values.ingress.broomlycommerce.tls | ternary "https" "http") }}
{{- printf "%s://%s%s" $protocol $hostname $path }}
{{- else }}
{{- printf "http://%s" (include "maidsaroundaustin.broomlycommerce-hostname" .) }}
{{- end }}
{{- end }}
{{- end }}
