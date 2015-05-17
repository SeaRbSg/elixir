# Start up the original server
Sequence.Supervisor.start_link 500
Sequence.Server.next_number
Sequence.Server.increment_number 10
Sequence.Server.next_number

# Update 1
:sys.suspend Sequence.Server
c "updated_server.ex"
:sys.change_code Sequence.Server, Sequence.Server, "0", []
:sys.resume Sequence.Server

Sequence.Server.increment_number 20
Sequence.Server.next_number

# Update 2
:sys.suspend Sequence.Server
c "updated_server_2.ex"
:sys.change_code Sequence.Server, Sequence.Server, "1", []
:sys.resume Sequence.Server

Sequence.Server.increment_number 30
Sequence.Server.next_number