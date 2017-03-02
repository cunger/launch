## Observations, notes, and insights on `Enumerator` 

```ruby
> 3.times { puts "Yay!" }
Yay!
Yay!
Yay!
=> 3
```

```ruby
> 3.times { |i| puts i.to_s }
0
1
2
=> 3
```

```ruby
> 3.times { |_,j| puts j.to_s }



=> 3
```
