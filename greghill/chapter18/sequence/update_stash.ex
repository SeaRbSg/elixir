defmodule Sequence.Stash do 
  use GenServer
  @vsn "1"
  #### External API
  def start_link (current_number) do 
    GenServer.start_link(__MODULE__, {current_number,1})
  end

  def get_value stash_pid do
    GenServer.call stash_pid, :get_value
  end

  def get_delta stash_pid do
    GenServer.call stash_pid, :get_delta
  end

  def save_state(stash_pid, state) do
    GenServer.cast stash_pid, {:save_state, state}
  end

  #### GenServer Implementation
  def handle_call(:get_value, _from, {current_value,current_delta}) do
    {:reply, current_value, {current_value,current_delta}}
  end

  def handle_call(:get_delta, _from, {current_value,current_delta}) do
    {:reply, current_delta, {current_value,current_delta}} 
  end

  def handle_cast({:save_state, new_state}, _current_state ) do
    {:noreply, new_state}
  end

  def code_change("0", current_value , _extra) do
    new_state = { current_value, 1 }
                    
 #   Logger.start
    # Logger.info "Change code from 0 to 1"
    # Logger.info inspect(old_state)
    # Logger.info inspect(new_state)
    {:ok, new_state}
  end
end

# iex(1)> :sys.suspend Sequence.Server
# :ok
# iex(2)>  :sys.suspend Sequence.Stash
# :ok
# iex(3)>  c("update_stash.ex")
# update_stash.ex:1: warning: redefining module Sequence.Stash
# [Sequence.Stash]
# iex(4)>  c("updated_server.ex")
# updated_server.ex:1: warning: redefining module Sequence.Server
# updated_server.ex:6: warning: redefining module Sequence.Server.State
# updated_server.ex:61: warning: variable old_state is unused
# [Sequence.Server, Sequence.Server.State]
# iex(5)> :sys.change_code Sequence.Server, Sequence.Server, "0", []
# :ok
# iex(6)> :sys.change_code Sequence.Stash, Sequence.Stash, "0", []
# :ok
# iex(7)>  :sys.resume Sequence.Stash
# :ok
# iex(8)>  :sys.resume Sequence.Server
# :ok
# iex(9)> Sequence.Server.next_number
# 456
# iex(10)> Sequence.Server.next_number
# 457
# iex(11)> Sequence.Server.next_number
# 458
# iex(12)> Sequence.Server.increment_number 10
# :ok
# iex(13)> Sequence.Server.increment_number 10
# :ok
# iex(14)> Sequence.Server.next_number
# 479
# iex(15)> Sequence.Server.next_number
# 489
# iex(16)> Sequence.Server.next_number
# 499
# iex(17)> Sequence.Server.increment_number "cat"
# :ok
# iex(18)>
# =ERROR REPORT==== 17-May-2015::13:29:03 ===
# ** Generic server 'Elixir.Sequence.Server' terminating
# ** Last message in was {'$gen_cast',{increment_number,<<"cat">>}}
# ** When Server state == [{data,[{"State",
#                                  <<"My current state is '%Sequence.Server.State{current_number: 509, delta: 10, stash_pid: #PID<0.77.0>}', and I'm happy">>}]}]
# ** Reason for termination ==
# ** {badarith,
#        [{'Elixir.Sequence.Server',handle_cast,2,
#             [{file,"updated_server.ex"},{line,47}]},
#         {gen_server,try_dispatch,4,[{file,"gen_server.erl"},{line,593}]},
#         {gen_server,handle_msg,5,[{file,"gen_server.erl"},{line,659}]},
#         {proc_lib,init_p_do_apply,3,[{file,"proc_lib.erl"},{line,237}]}]}

# nil
# iex(19)> Sequence.Server.next_number
# 509
# iex(20)> Sequence.Server.next_number
# 519
# iex(21)> Sequence.Server.next_number
# 529
# iex(22)> Sequence.Server.next_number
# 539
