defmodule RemoteCallMacro do
  defmacro remote(node_short_name, do: ast) do
    {{:., _, [{_, _, aliases}, function_name]}, _, args} = ast
    module = Module.concat(aliases)

    if Mix.env() == :test do
      quote do
        Process.delete({unquote(module), unquote(function_name), unquote(args)})
      end
    else
      quote do
        node_name =
          Enum.find(Node.list(), fn node ->
            node |> Atom.to_string() |> String.split("@") |> hd() == unquote(node_short_name)
          end)

        node_name || raise "Error node not found: #{inspect(unquote(node_short_name))}"
        response = :rpc.call(node_name, unquote(module), unquote(function_name), unquote(args))

        case response do
          {:badrpc, _} ->
            raise "Error calling node #{inspect(node_name)} via rpc: #{inspect(response)}"

          response ->
            response
        end
      end
    end
  end
end
