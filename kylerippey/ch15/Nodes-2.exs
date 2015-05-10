### Question ###
# When I introduced the interval server, I said it sent a tick
# “about every 2 seconds.” But in the receive loop, it has an
# explicit timeout of 2,000 ms. Why did I say “about” when it
# looks as if the time should be pretty accurate?

### Answer ###
# Because after the 2,000ms we loop through a list of clients
# and send a tick to each one. There is overhead associated with
# sending the message, and if we have a long list of clients it
# will take time to get through the entire list.