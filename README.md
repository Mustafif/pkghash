# PkgHash 

> This uses the current Zig Stable, `v0.11.0`. 

This tool is taken from [https://github.com/zigzap/zap/tree/master/tools](https://github.com/zigzap/zap/tree/master/tools) and is available 
standalone to help other Zig developers to use the `ZON` package manager, and be able to figure the hash. 

Usage: 

```shell
Usage: pkghash [options]

Options: 
  -h --help           Print this help and exit.
  -g --git            Use git ls-files

Sub-options: 
  --allow-directory : calc hash even if no build.zig is present
                      applies in no-git mode only

Sub-options for --git: 
  --tag=<tag>          : specify git tag to use in template
                         defaults to tag pointing to HEAD
  --template=<file.md> : specify markdown template to render
```

