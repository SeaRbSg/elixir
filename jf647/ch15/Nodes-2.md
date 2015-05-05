* if a registration is received before the 2 second timeout, then the timeout resets
* if there are many clients, it has to walk the list of clients to send the tick message, which scales linearly and at some point may become non-trivial
