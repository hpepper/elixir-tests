
# define the module
defmodule TupleInList do
  def get_simple_array do
    {:ok, ssl_options: [nodelay: true]}
  end

  def get_embeded_tupple do
    {:ok, ssl_options: [{:nodelay, true}]}
  end
end

# Call a function in the module
  {:ok, answer} = TupleInList.get_simple_array()
  IO.puts("DDD '#{inspect(answer)}'")

  {:ok, answer2} = TupleInList.get_embeded_tupple()
  IO.puts("DDD '#{inspect(answer2)}'")

# To run this:
#   iex single_files.exs
# (press Ctrl-C twice to exit the 'eix' )
