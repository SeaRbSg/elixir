defmodule TableFormatterTest do
  use ExUnit.Case
 
  import ExUnit.CaptureIO
  alias Conditions.TableFormatter, as: CF

  def get_test_data do
    Exmerl.from_string("""
    <?xml version="1.0" encoding="ISO-8859-1"?> 
    <?xml-stylesheet href="latest_ob.xsl" type="text/xsl"?>
    <current_observation version="1.0"
     xmlns:xsd="http://www.w3.org/2001/XMLSchema"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:noNamespaceSchemaLocation="http://www.weather.gov/view/current_observation.xsd">
      <credit>NOAA's National Weather Service</credit>
      <suggested_pickup_period>60</suggested_pickup_period>
      <location>Deer Park, Deer Park Airport, WA</location>
      <station_id>KDEW</station_id>
      <latitude>47.97417</latitude>
      <longitude>-117.42833</longitude>
      <observation_time>Last Updated on Apr 25 2015, 2:53 pm PDT</observation_time>
      <weather>Mostly Cloudy</weather>
      <temperature_string>45.0 F (7.2 C)</temperature_string>
      <temp_f>45.0</temp_f>
      <relative_humidity>80</relative_humidity>
      <wind_string>North at 8.1 MPH (7 KT)</wind_string>
      <wind_dir>North</wind_dir>
      <wind_degrees>10</wind_degrees>
      <wind_mph>8.1</wind_mph>
      <windchill_string>41 F (5 C)</windchill_string>
      <windchill_f>41</windchill_f>
      <visibility_mi>10.00</visibility_mi>
    </current_observation>
    """)
  end
  
  test "extract relative_humidity value from the xml" do
    assert '80' == get_test_data
                  |> CF.get_value("relative_humidity")
  end

  test "printing temp_f and wind_dir" do
    result = capture_io fn -> CF.print_table_rows(get_test_data,["temp_f","wind_dir"]) end 
    assert result == """
    Weather Attribute | Value
    ----------------- + -----
               temp_f : 45.0 
             wind_dir : North
    """
  end
end