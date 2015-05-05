# The same recieve block handles registration and ticking. If a registration
# occurs at, say, 1750 ms through the tick then the tick timer will restart 
# and the tick will be missed for that block of 2 seconds.