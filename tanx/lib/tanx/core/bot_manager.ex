defmodule Tanx.Core.BotManager do
  @doc """
    Starts a BotManager process. This should be called only from a Game process.
  """
  def start_link(player_manager) do
    {:ok, pid} = GenServer.start_link(__MODULE__,
        {player_manager})
    pid
  end

  @doc """
    Creates a bot player. Returns {:ok, player} if succeessful, or {:error, reason} if not.
  """
  def create_bot(bot_manager, bot_name) do
    GenServer.call(bot_manager, {:create_bot, bot_name})
  end

  #### GenServer callbacks

  use GenServer

  # The state for this process. Includes handles to other processes needed by players, and
  # a mapping of player process IDs to PlayerInfo structs.
  defmodule State do
    defstruct player_manager: nil,
              bots: []
  end


  def init({player_manager}) do
    Process.flag(:trap_exit, true)
    state = %State{
      player_manager: player_manager
    }
    {:ok, state}
  end

  # Called by the 'game' process to create a Player when one connects. Returns:
  # - {:ok, player} if successful
  # - {:error, reason} if not
  def handle_call({:create_bot, name}, _from, state) do
    {:ok, bot} = state.player_manager |> Tanx.Core.PlayerManager.create_player(name)
    state = %State{state | bots: [bot | state.bots]}
    {:reply, {:ok, bot}, state}
  end

end
