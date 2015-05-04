Changing pid to \_pid, I see no changes

Even after doing what is suggested in the forums (adding an Enum.reverse),
I get consistent results.

The bug is that without anchoring the pattern match, we accept the messages
in whatever order they come in, rather than setting up a dedicated receiver
for each sender.
