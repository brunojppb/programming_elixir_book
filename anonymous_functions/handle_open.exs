handle_open = fn
  {:ok, file} -> "First line: #{IO.read(file, :line)}"
  {_, error} -> "Error while opening file: #{:file.format_error(error)}"
end

result = handle_open.(File.open("../README.md"))
IO.puts("Result: #{result}")

error = handle_open.(File.open("non_existent.md"))
IO.puts("error: #{error}")
