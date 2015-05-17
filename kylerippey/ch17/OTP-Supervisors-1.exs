# Yes, it restarted and was reinitialized with the same data as the first run.

### Example:
# iex(1)> Stack.Server.pop
# 1
# iex(2)> Stack.Server.push 8
# :ok
# iex(3)> Stack.Server.pop
# 8
# iex(4)> Stack.Server.pop
# 2
# iex(5)> Stack.Server.pop
# 3
# iex(6)> Stack.Server.pop
# [Terminate received] Reason: {:function_clause, [{Stack.Server, :handle_call, [:pop, {#PID<0.95.0>, #Reference<0.0.0.453>}, []], [file: 'lib/server.ex', line: 16]}, {:gen_server, :try_handle_call, 4, [file: 'gen_server.erl', line: 607]}, {:gen_server, :handle_msg, 5, [file: 'gen_server.erl', line: 639]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 237]}]}, State: []

# 16:55:59.167 [error] GenServer Stack.Server terminating
# Last message: :pop
# State: []
# ** (exit) an exception was raised:
#     ** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
#         (stack) lib/server.ex:16: Stack.Server.handle_call(:pop, {#PID<0.95.0>, #Reference<0.0.0.453>}, [])
#         (stdlib) gen_server.erl:607: :gen_server.try_handle_call/4
#         (stdlib) gen_server.erl:639: :gen_server.handle_msg/5
#         (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3
# ** (exit) exited in: GenServer.call(Stack.Server, :pop, 5000)
#     ** (EXIT) an exception was raised:
#         ** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
#             (stack) lib/server.ex:16: Stack.Server.handle_call(:pop, {#PID<0.95.0>, #Reference<0.0.0.453>}, [])
#             (stdlib) gen_server.erl:607: :gen_server.try_handle_call/4
#             (stdlib) gen_server.erl:639: :gen_server.handle_msg/5
#             (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3
#     (elixir) lib/gen_server.ex:356: GenServer.call/3
# iex(6)> Stack.Server.pop
# 1