1. the order of responses is in theory determininistic, assuming that the receivers
are waiting before the message is sent.  In practice, there is some variance, though
after one Betty before Fred I end up always getting Fred before Betty.

2. the order could be made deterministic by adding a msgid and waiting for the msgid
to come back in order
