defmodule RemoteCallMacro do
  defmacro remote(node_name, do: ast) do
    {{:., _, [{_, _, aliases}, function_name]}, _, args} = ast
    module = Module.concat(aliases)

    quote do
      :rpc.call(unquote(node_name), unquote(module), unquote(function_name), unquote(args))
    end
  end
end
