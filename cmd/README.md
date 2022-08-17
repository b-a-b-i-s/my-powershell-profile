# cmd profile

## Requirements

- Clink [[Website](https://chrisant996.github.io/clink/), [Github](https://github.com/chrisant996/clink)]

## Location

Create a new file called oh-my-posh.lua in your Clink scripts directory (run `clink info` inside cmd to find that file's location) with the following content.

```lua
load(io.popen('oh-my-posh init cmd --config https://raw.githubusercontent.com/b-a-b-i-s/oh-my-posh-guide/main/.thecyberden-babis.omp.json'):read("*a"))()
```

I didn't manage to make it work with a local file so I used a file hosted in github.
