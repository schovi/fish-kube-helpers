# Fish Kubernetes helpers

## Installation

Using [fisher](https://github.com/jorgebucaran/fisher):

```sh
fisher add schovi/fish-kube-helpers
```

## Commands

### kube-get-pod

Returns first pod name matching `pattern` which is in status `Running`
Uses `kubectl get pods`

```bash
$ kube-get-pod pattern
my-pod-pattern-5c8cfc66d6-29dnw
```

### kube-run

Underneath it uses `kube-get-pod` to get a pod name and calls `kubectl exec -it $name -- $command`

```bash
$ kube-run pattern command
....
```

### kube-revision

```bash
$ kube-revision pattern
7c6f6df
```

## Disclaimer