defmodule WsClientTest do
  use ExUnit.Case
  doctest WsClient

  test "greets the world" do
    assert WsClient.hello() == :world
  end
end
