```
M00972939 ➜  stack git:(master) ✗ iex -S mix
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Compiled lib/stack/stack.ex
Compiled lib/stack/subsupervisor.ex
Compiled lib/stack/supervisor.ex
Compiled lib/stack/server.ex
Generated stack.app
Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Stack.Server.push 5
:ok
iex(2)>
06:55:12.898 [error] GenEvent handler Logger.ErrorHandler installed at :error_logger
** (exit) an exception was raised:
    ** (ArgumentError) argument error
        :erlang.byte_size({%RuntimeError{message: "can't push integers less than 10"}, [{Stack.Server, :handle_cast, 2, [file: 'lib/stack/server.ex', line: 26]}, {:gen_server, :try_dispatch, 4, [file: 'gen_server.erl', line: 593]}, {:gen_server, :handle_msg, 5, [file: 'gen_server.erl', line: 659]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 237]}]})
        (elixir) lib/exception.ex:106: Exception.format_banner/3
        (elixir) lib/exception.ex:171: Exception.format_exit/2
        (logger) lib/logger/translator.ex:39: Logger.Translator.translate/4
        (logger) lib/logger/error_handler.ex:116: Logger.ErrorHandler.translate/6
        (logger) lib/logger/error_handler.ex:62: Logger.ErrorHandler.log_event/5
        (logger) lib/logger/error_handler.ex:27: Logger.ErrorHandler.handle_event/2
        (stdlib) gen_event.erl:525: :gen_event.server_update/4
iex(2)> Stack.Server.push 10
:ok
iex(3)> Stack.Server.push 15
:ok
iex(4)> Stack.Server.pop
10
iex(5)> Stack.Server.push 5
:ok
iex(6)>
06:55:28.100 [error] GenEvent handler Logger.ErrorHandler installed at :error_logger
** (exit) an exception was raised:
    ** (ArgumentError) argument error
        :erlang.byte_size({%RuntimeError{message: "can't push integers less than 10"}, [{Stack.Server, :handle_cast, 2, [file: 'lib/stack/server.ex', line: 26]}, {:gen_server, :try_dispatch, 4, [file: 'gen_server.erl', line: 593]}, {:gen_server, :handle_msg, 5, [file: 'gen_server.erl', line: 659]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 237]}]})
        (elixir) lib/exception.ex:106: Exception.format_banner/3
        (elixir) lib/exception.ex:171: Exception.format_exit/2
        (logger) lib/logger/translator.ex:39: Logger.Translator.translate/4
        (logger) lib/logger/error_handler.ex:116: Logger.ErrorHandler.translate/6
        (logger) lib/logger/error_handler.ex:62: Logger.ErrorHandler.log_event/5
        (logger) lib/logger/error_handler.ex:27: Logger.ErrorHandler.handle_event/2
        (stdlib) gen_event.erl:525: :gen_event.server_update/4
iex(6)> Stack.Server.pop
15
iex(7)> Stack.Server.pop
** (EXIT from #PID<0.115.0>) an exception was raised:
    ** (ArgumentError) argument error
        :erlang.byte_size({:function_clause, [{Stack.Server, :handle_call, [:pop, {#PID<0.115.0>, #Reference<0.0.0.659>}, {[], #PID<0.112.0>}], [file: 'lib/stack/server.ex', line: 21]}, {:gen_server, :try_handle_call, 4, [file: 'gen_server.erl', line: 607]}, {:gen_server, :handle_msg, 5, [file: 'gen_server.erl', line: 639]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 237]}]})
        (elixir) lib/exception.ex:106: Exception.format_banner/3
        (elixir) lib/exception.ex:171: Exception.format_exit/2
        (elixir) lib/exception.ex:205: Exception.format_exit/2
        (elixir) lib/exception.ex:114: Exception.format_banner/3
        (iex) lib/iex/evaluator.ex:158: IEx.Evaluator.print_error/3
        (iex) lib/iex/evaluator.ex:95: IEx.Evaluator.eval/2
        (iex) lib/iex/evaluator.ex:29: IEx.Evaluator.loop/1

Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)

06:55:31.411 [error] GenEvent handler Logger.ErrorHandler installed at :error_logger
** (exit) an exception was raised:
    ** (ArgumentError) argument error
        :erlang.byte_size({:function_clause, [{Stack.Server, :handle_call, [:pop, {#PID<0.115.0>, #Reference<0.0.0.659>}, {[], #PID<0.112.0>}], [file: 'lib/stack/server.ex', line: 21]}, {:gen_server, :try_handle_call, 4, [file: 'gen_server.erl', line: 607]}, {:gen_server, :handle_msg, 5, [file: 'gen_server.erl', line: 639]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 237]}]})
        (elixir) lib/exception.ex:106: Exception.format_banner/3
        (elixir) lib/exception.ex:171: Exception.format_exit/2
        (logger) lib/logger/translator.ex:39: Logger.Translator.translate/4
        (logger) lib/logger/error_handler.ex:116: Logger.ErrorHandler.translate/6
        (logger) lib/logger/error_handler.ex:62: Logger.ErrorHandler.log_event/5
        (logger) lib/logger/error_handler.ex:27: Logger.ErrorHandler.handle_event/2
        (stdlib) gen_event.erl:525: :gen_event.server_update/4
iex(1)>
```
