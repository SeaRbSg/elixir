prefix = -> (pre) do
  -> (suf) do
    "#{pre} #{suf}"
  end
end

```
irb(main):017:0> prefix = -> (pre) do
irb(main):018:1*   -> (suf) do
irb(main):019:2*     "#{pre} #{suf}"
irb(main):020:2>   end
irb(main):021:1> end
=> #<Proc:0x007f8c1e286c00@(irb):17 (lambda)>
irb(main):022:0> mrs = prefix.call('Mrs.')
=> #<Proc:0x007f8c1e29acf0@(irb):18 (lambda)>
irb(main):023:0> puts mrs.call('Smith')
Mrs. Smith
=> nil
```
