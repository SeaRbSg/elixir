fun = fn -> IO.puts(Enum.join(File.ls!, ",")) end 

#iex --sname one
#fun = fn -> IO.puts(Enum.join(File.ls!, ",")) end 
#spawn(fun)

#iex --sname two
#fun = fn -> IO.puts(Enum.join(File.ls!, ",")) end 
#spawn(fun)
