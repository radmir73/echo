defmodule EchoServer do
  use GenServer

  # Client

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def send_message(pid, :ping) do
    GenServer.call(pid,  {:send_message, :ping})
  end

  # Server (callbacks)

  @impl true
  def init(init_args) do
    {:ok, init_args}
  end

  @impl true
  def handle_call({:send_message, :ping}, _from, state) do
    {:reply, {:pong, Node.self()}, state}
  end
end