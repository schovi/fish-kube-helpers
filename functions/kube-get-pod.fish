function "kube-get-pod" --description="Get first running pod by its pattern"
  set -l pod_pattern "$argv[1]"

  if test -z "$pod_pattern"
    echo (set_color red)"Missing pattern for matching the pod"
    return 0
  end

  set -l IFS

  set -l pods (kubectl get pods)

  set -l pod (echo "$pods" | grep "$pod_pattern")

  if test -z "$pod"
    echo (set_color red)"No pod is matching pattern '$pod_pattern'"
    return 0
  end

  set -l pod (echo "$pod" | grep "Running")

  if test -z "$pod"
    echo (set_color red)"No running pod for pattern '$pod_pattern'"
    return 0
  end

  echo "$pod" | head -n 1 | awk '{print $1}'
end
