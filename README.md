# Kubernetes Security Context

This project is meant to show every possible configuration of Kubernetes
Pod and Container Security Context. Its mission is to make security less
scary for users of Kubernetes such that they do not reach the point of
disregarding security out of frustration.

## Matrix

|*Pod*|*Image*|*PodSecurityContext*|fsGroup|fsGroupChangePolicy|runAsGroup|runAsNonRoot|runAsUser|seLinuxOptions|supplementalGroups|sysctls|windowsOptions|*SecurityContext*|allowPrivilegeEscalation|capabilities|privileged|procMount|readOnlyRootFilesystem|runAsGroup|runAsNonRoot|runAsUser|seLinuxOptions|windowsOptions|`$ id`|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|`001`|`no-uid-no-gid`|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|`uid=0(root) gid=0(root) groups=0(root)`|
|`002`|`uid-no-gid`|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|`uid=1000 gid=0(root) groups=0(root)`|
|`003`|`uid-gid`|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|`uid=1000(1000) gid=1000(mygroup) groups=1000(mygroup)`|