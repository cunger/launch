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

### The `&:` idiom

```ruby
blah.map(&:method) == blah.map { |x| x.method }
```

`&` in front of the last argument to a methods tells Ruby that this should be treated as a `Proc`. So if it's not a `Proc` already, Ruby calls `#to_proc` on it.
That is, when we feed it a symbol, it calls `Symbol#to_proc`, which converts that symbol into a `Proc`.
