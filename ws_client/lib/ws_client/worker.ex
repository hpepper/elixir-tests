defmodule WsClient.Worker do
  @moduledoc """
  This module
  """

  use WebSockex

  @default_ms_between_sending_messages 1000

  defmodule StateData do
    @moduledoc false

    @type t :: %__MODULE__{
            ms_between_sending_packets: non_neg_integer(),
            example_string: String.t(),
            example_date: %DateTime{}
          }
    defstruct ip: %{},
              ms_between_sending_packets: 0,
              example_string: nil,
              example_date: nil
  end

  # ------------------------ Front facing API

  @impl WebSockex
  def start_link(url) do
    IO.puts("DDD start_link(#{url})")
    state_data = %StateData{
      ms_between_sending_packets: @default_ms_between_sending_messages,
      example_string: "test",
      example_date: DateTime.utc_now()
    }
    WebSockex.start_link(url, __MODULE__, state_data)
  end

  def handle_frame({:text, msg}, state) do
    IO.puts "Received a message: #{msg}"
    {:ok, state}
  end

  def handle_cast({:send, {type, msg} = frame}, state) do
    IO.puts "Sending #{type} frame with payload: #{msg}"
    {:reply, frame, state}
  end
end
