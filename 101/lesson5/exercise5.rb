munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_munsters = munsters.select { |_, info| info["gender"] == "male" }
total_age = male_munsters.reduce(0) { |age, (_, info)| age + info["age"] }

p total_age
