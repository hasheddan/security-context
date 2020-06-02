# Kubernetes Security Context

This project is meant to show every possible configuration of Kubernetes
Pod and Container Security Context. Its mission is to make security less
scary for users of Kubernetes such that they do not reach the point of
disregarding security out of frustration.

## Matrix

|*Pod*|*Image*|*PodSecurityContext*|fsGroup|fsGroupChangePolicy|runAsGroup|runAsNonRoot|runAsUser|seLinuxOptions|supplementalGroups|sysctls|windowsOptions|*SecurityContext*|allowPrivilegeEscalation|capabilities|privileged|procMount|readOnlyRootFilesystem|runAsGroup|runAsNonRoot|runAsUser|seLinuxOptions|windowsOptions|`$ id`|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
