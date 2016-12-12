defmodule GiphyEx.Supervisor do
  @moduledoc false

  use Supervisor

  @doc false
  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  @doc false
  def init([]) do
    children = [
      # Define workers and child supervisors to be supervised
      # worker(GiphyEx.Worker, [])
    ]

    # See http://elixir-lang.org/docs/stable/Supervisor.Behaviour.html
    # for other strategies and supported options
    supervise(children, strategy: :one_for_one)
  end
end
