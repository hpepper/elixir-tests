defmodule WssServerTest do
  use ExUnit.Case
  doctest WssServer

  test "greets the world" do
    assert WssServer.hello() == :world
  end
end
