defmodule EchoServerTest do
  use ExUnit.Case
  doctest EchoServer

  test "return :pong" do
    {:ok, pid} = EchoServer.start_link
    assert EchoServer.send_message(pid, :ping) == {:pong, Node.self()}
  end
end
