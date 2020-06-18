# random

An all purpose random library written in V.

## Features

- All variate functions possible.
- Generate random `int` and `string` with ease.
- range functions for `int` and `f32`.
- Array functions like `shuffle`, `choose`, `sample` etc.
- Makes life easier *sorta*
- Many more features coming soon! 

## Installation

- Via `git clone`
    - `git clone https://github.com/Delta456/random`
- Via `v install`
    - `v install random`
- Via `vpkg`
    - `vpkg install random`

## Docs

Comments are given in all `.v` files in the repo. It wil hosted on vdoc or pasted on the `README.md` soon.

## Usage

In `main.v`

```v
import random // or delta456.random
import rand // for seeding
import time // for time.now().unix
fn main() {
    rand.seed([u32(time.now().unix), 0])
    // use your random functions
}
```

## Acknowledgments

I thank [Python Software Foundation](https://www.python.org/psf/) for their work on [random](https://github.com/python/cpython/blob/master/Lib/random.py) library which helped me to port variate functions. 

## License

Licensed under [MIT](LICENSE)
