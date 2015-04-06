defmodule Customer do 
  defstruct name: "", company: ""

end

defmodule BugReport do 
  defstruct owner: %{}, details: "", severity: 1
end

report = %BugReport{owner: %Customer{name: "dave", company: "Pragmatic"}, details: "broken"}

#=> %BugReport{details: "broken",
#=>  owner: %Customer{company: "Pragmatic", name: "dave"}, severity: 1}

report = %BugReport{ report | owner: %Customer{report.owner | company: "PragProg"}}

#=> %BugReport{details: "broken",
#=>   owner: %Customer{company: "PragProg", name: "dave"}, severity: 1}

put_in(report.owner.company, "PragProg")