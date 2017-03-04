# `Enumera*`

> Enumerator is an Enumerable plus external iteration.
> -- <cite>[Jared Carroll][1]</cite>

[1]:http://blog.carbonfive.com/2012/10/02/enumerator-rubys-versatile-iterator/

## Observations

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

## Lazy evaluation

Why does `[1,0].cycle.take(6)` work?
