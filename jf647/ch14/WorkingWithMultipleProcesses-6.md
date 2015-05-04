self was assigned to me because the spawned processes use anon functions.
Inside the anon function, self is a local that shadows the spawning process,
so the spawned function would otherwise send a message back to itself.
