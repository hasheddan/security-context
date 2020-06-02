# Kubernetes Security Context

This project is meant to show every possible configuration of Kubernetes
Pod and Container Security Context. Its mission is to make security less
scary for users of Kubernetes such that they do not reach the point of
disregarding security out of frustration.

## Matrix

|*Pod*|*Image*|*PodSecurityContext*|fsGroup|fsGroupChangePolicy|runAsGroup|runAsNonRoot|runAsUser|seLinuxOptions|supplementalGroups|sysctls|windowsOptions|*SecurityContext*|allowPrivilegeEscalation|capabilities|privileged|procMount|readOnlyRootFilesystem|runAsGroup|runAsNonRoot|runAsUser|seLinuxOptions|windowsOptions|`$ id`|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|[001](pods/001.yaml)|[no-uid-no-gid](images/no-uid-no-gid)|**No**|-|-|-|-|-|-|-|-|-|**No**|-|-|-|-|-|-|-|-|-|-|`uid=0(root) gid=0(root) groups=0(root)`|
|[002](pods/002.yaml)|[uid-no-gid](images/uid-no-gid)|**No**|-|-|-|-|-|-|-|-|-|**No**|-|-|-|-|-|-|-|-|-|-|`uid=1000 gid=0(root) groups=0(root)`|
|[003](pods/003.yaml)|[uid-gid](images/uid-gid)|**No**|-|-|-|-|-|-|-|-|-|**No**|-|-|-|-|-|-|-|-|-|-|`uid=1000(1000) gid=1000(mygroup) groups=1000(mygroup)`|
|[004](pods/004.yaml)|[no-uid-no-gid](images/no-uid-no-gid)|**Yes**|`2000`|-|-|-|-|-|-|-|-|**No**|-|-|-|-|-|-|-|-|-|-|`uid=0(root) gid=0(root) groups=0(root),2000`|
|[005](pods/005.yaml)|[no-uid-no-gid](images/no-uid-no-gid)|**Yes**|-|-|`3000`|-|-|-|-|-|-|**No**|-|-|-|-|-|-|-|-|-|-|`Failed create pod sandbox: rpc error: code = Unknown desc = failed to make sandbox docker config for pod "005": runAsGroup is specified without a runAsUser`|
|[006](pods/006.yaml)|[no-uid-no-gid](images/no-uid-no-gid)|**Yes**|-|-|`3000`|-|`2000`|-|-|-|-|**No**|-|-|-|-|-|-|-|-|-|-|`uid=2000 gid=3000 groups=3000`|

## Descriptions

The following are descriptions of each field and how they work with
other fields and the containers and volumes they modify.

### PodSecurityContext

All fields that can be specified in both the `PodSecurityContext` and
the `SecurityContext` will defer to value in `SecurityContext`.

- `fsGroup`: A special supplemental group that applies to all containers
  in a pod. Some volume types allow the Kubelet to change the ownership
  of that volume to be owned by the pod.
    - Must be used with `runAsUser` (See [005](pods/005.yaml)).
- `fsGroupChangePolicy`
- `runAsGroup`: The GID to run the entrypoint of the container process.
  Uses runtime default if unset.
- `runAsNonRoot`: Indicates that the container must run as a non-root
  user. If true, the Kubelet will validate the image at runtime to
  ensure that it does not run as UID 0 (root) and fail to start the
  container if it does. If unset or false, no such validation will be
  performed.
- `runAsUser`: The UID to run the entrypoint of the container process.
  Defaults to user specified in image metadata if unspecified.
- `seLinuxOptions`: The SELinux context to be applied to all containers.
  If unspecified, the container runtime will allocate a random SELinux
  context for each container.
- `supplementalGroups`: A list of groups applied to the first process
  run in each container, in addition to the container's primary GID.
- `sysctls`: Sysctls hold a list of namespaced sysctls used for the pod.
  Pods with unsupported sysctls (by the container runtime) might fail to
  launch.
- `windowsOptions`: The Windows specific settings applied to all
  containers. If unspecified, the options within a container's
  SecurityContext will be used.

### SecurityContext

- `allowPrivilegeEscalation`: AllowPrivilegeEscalation controls whether
  a process can gain more privileges than its parent process. This bool
  directly controls if the no_new_privs flag will be set on the
  container process. AllowPrivilegeEscalation is true always when the
  container is:
    - 1) run as Privileged
    - 2) has CAP_SYS_ADMIN
- `capabilities`: The capabilities to add/drop when running containers.
  Defaults to the default set of capabilities granted by the container
  runtime.
- `privileged`: Run container in privileged mode. Processes in
  privileged containers are essentially equivalent to root on the host.
  Defaults to false.
- `procMount`: procMount denotes the type of proc mount to use for the
  containers. The default is DefaultProcMount which uses the container
  runtime defaults for readonly paths and masked paths. This requires
  the ProcMountType feature flag to be enabled.
- `readOnlyRootFilesystem`: Whether this container has a read-only root
  filesystem. Default is false.
- `runAsGroup`: The GID to run the entrypoint of the container process.
  Uses runtime default if unset.
- `runAsNonRoot`: Indicates that the container must run as a non-root
  user. If true, the Kubelet will validate the image at runtime to
  ensure that it does not run as UID 0 (root) and fail to start the
  container if it does. If unset or false, no such validation will be
  performed.
- `seLinuxOptions`: The SELinux context to be applied to the container.
  If unspecified, the container runtime will allocate a random SELinux
  context for each container.
- `windowsOptions`: The Windows specific settings applied to all
  containers. If unspecified, the options from the PodSecurityContext
  will be used.
