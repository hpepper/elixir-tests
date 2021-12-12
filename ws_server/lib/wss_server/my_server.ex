defmodule WssServer.MyServer do
  @moduledoc """
  handle websockety things
  """

  @behaviour :cowboy_websocket

  defmodule StateData do
    @moduledoc false
    @type t :: %__MODULE__{
            path: String.t(),
            my_ip: String.t(),
            my_port: :inet.port_number(),
            stun_peer_key: String.t(),
            peer: {String.t(), :inet.port_number()}
          }
    defstruct path: nil,
              my_ip: nil,
              my_port: nil,
              stun_peer_key: nil,
              peer: nil
  end

  def init(request, opts) do
    IO.puts("DDD init(req,sock) #{inspect(request)}")
    {:cowboy_websocket, request, opts}
  end

  def websocket_init(state) do
    IO.puts("DDD websocket_init() - #{inspect(state)}")
    {:ok, state}
  end

  def websocket_handle(
        {:binary, payload},
        state
      ) do
    IO.puts("DDD websocket_handle() - #{inspect(payload)}")

    {:ok, state}
  end

  # ------------------------------------------------------------------------------------------------
  def websocket_handle({:pong, _payload}, state), do: handle_pong(state)

  def websocket_handle(:pong, state), do: handle_pong(state)

  def websocket_handle({:text, "ping"}, state) do
    IO.puts("DDD text ping")
    {:reply, {:text, "pong"}, state}
  end

  # Default fallback for unrecognized messages
  def websocket_handle({:text, payload}, state) do
    IO.puts("DDD text other #{inspect(payload)}")
    {:ok, state, :hibernate}
  end


  def websocket_info(information, state) do
    IO.puts("DDD websocket_info() - #{inspect(information)}")
    {:ok, state}
  end

  defp handle_pong(state) do
    IO.puts("DDD handle_pong()")
    {:ok, state}
  end

end
