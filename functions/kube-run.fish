function "kube-run" --description="Run command within the running pod"
  set -l command "$argv[2..-1]"

  if test -z "$command"
    echo (set_color red)"Missing command to run"
    return 0
  end

  set -l pod (kube-get-pod $argv[1])

  echo (set_color green)"Found available pod '$pod'"
  echo (set_color yellow)"Running '$command'"

  set_color normal

  kubectl exec -it $pod -- $argv[2..-1]
end
