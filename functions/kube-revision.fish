function "kube-revision"
  set -l pod_name "$argv[1]"

  if test -z "$pod_name"
    echo (set_color red)"Missing pod name"
    return 0
  end

  set -l IFS

  set -l describe (kubectl describe pod "$pod_name")

  set -l revision (echo $describe | grep "Image:" | head -n 1 | cut -d ":" -f 3)

  if test -z "$revision"
    echo (set_color red)"Can't find revision"
    return 0
  end

  echo $revision
end