people = [
  %{ name: "Bruno", height: 1.56 },
  %{ name: "João", height: 1.34 },
  %{ name: "José", height: 1.89 },
  %{ name: "Raimundo", height: 2.00 }
]

for person = %{ height: height } <- people,
  height > 1.5,
  do: IO.inspect person
