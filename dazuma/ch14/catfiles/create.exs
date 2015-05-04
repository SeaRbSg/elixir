defmodule CreateCats do
  def run(num_files, min_cats, max_cats) do
    1..num_files |> Enum.each(fn (n) ->
      (:random.uniform(max_cats - min_cats) + min_cats)
      |> generate_content
      |> save_file("file-#{n}.txt")
    end)
  end

  def generate_content(ncats) do
    Stream.repeatedly(&generate_elem/0)
     |> Enum.take(ncats)
    |> Enum.join
  end

  def generate_elem do
    [
      String.duplicate("dog", :random.uniform(2) - 1),
      "cat",
      String.duplicate("dog", :random.uniform(2) - 1)
    ]
    |> Enum.join
  end

  def save_file(content, name) do
    File.rm!(name)
    File.open!(name, [:write], fn(file) ->
      IO.write(file, content)
    end)
  end
end


CreateCats.run(100, 10000, 50000)
