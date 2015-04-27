defmodule TableFormatterTest do
  use ExUnit.Case
 
  import ExUnit.CaptureIO

  alias Issues.TableFormatter, as: TF

  def set_up_test_data do
    testdata = HashDict.new
              |> Dict.put("head1",10)
              |> Dict.put("head2","valuevslfgdd")
    testdata2 = testdata
              |> Dict.put("head2","valuevslfgddsdfsdf")
    [testdata,testdata2]
  end

  test "get_max_widths" do
    data = set_up_test_data
    assert TF.get_max_widths(["head1","head2"],data) == [2,18]
  end

  test "get_header_widths" do
    data = set_up_test_data
    assert TF.get_header_widths([2,18],["head1","head2"]) == [5,18]
  end

  test "getFormatter" do 
    assert TF.getFormatter([2,5,123], "*", "#") == " ~-2..*s # ~-5..*s # ~-123..*s ~n"
  end

  test "printheader" do 
    result = capture_io fn ->  TF.printheader(["head1","head2"],[5,18]) end
    assert result == " head1 | head2              \n"
  end

  test "printseparator" do
    result = capture_io fn -> TF.printseparator([6,12]) end

    assert result == " ------ + ------------ \n"
  end

  test "printrows" do
    result = capture_io fn -> TF.printrows(["head1","head2"],set_up_test_data,[5,18]) end
    assert result == """
     10    | valuevslfgdd       
     10    | valuevslfgddsdfsdf 
    """
  end

  

end