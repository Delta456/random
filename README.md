# THIS MODULE HAS BEEN DEPRECATED AND [V'S RAND MODULE](https://github.com/vlang/v/tree/master/vlib/rand) SHOULD BE USED INSTEAD!

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

```v
// struct for `triangular()`
struct Triangular {
mut:
        low  f32 = 1.0
        high f32 = 1.0
        mode int = 1
}

// struct for `int_range()`
struct IntRange {
        start int
        stop  int
        step  int = 1
}

// struct for `float_range()`
struct FloatRange {
        start f32
        stop  f32
        step  f32 = 1.0
}

// normal_variate is the normal distribution where mu is the 
// mean, and stigma is the standard deviation
fn normal_variate(mu, stigma f32) f32


// expo_variate is the expovariate distribution where lambda is // 1.0 divided by the desired mean. It should be nonzero. 
// return values range from 0 to positive infinity if lambda is // positive else negative
fn expo_variate(lambda f32) f32


// weibull distribution where alpha is the scale parameter and 
// beta is the shape parameter
fn weibull_variate(alpha, beta f32) f32

// lognorm_variate is the log nomral distribution If you take 
// the natural logarithm of this distribution, you'll get a 
// normal distribution with mean mu and standard deviation 
//sigma. mu can have any value, and sigma must be greater than
// zero
fn lognorm_variate(mu, stigma f32) f32

// gamma_distribution is the gamma distribution conditions on the parameters are alpha > 0 and beta > 0.
// conditions on the parameters are alpha > 0 and beta > 0.
//        The probability distribution function is:
//                   math.pow(x, (alpha - 1)) * math.exp(-x / beta)
//         pdf(x) =  --------------------------------------
//                     math.gamma(alpha) * math.pow(beta, alpha)
fn gamma_variate(alpha, beta f32) f32


// beta_variate is the beta distribution parameters alpha > 0 
// and beta > 0 return values range between 0 and 1
fn beta_variate(alpha, beta f32) f32


// pareto_variate is pareto distribution. alpha is the shape 
// paramter.
fn pareto_variate(alpha f32) f32

// vommeises_variate is the circular data distribution
// where mu is the mean angle, expressed in radians between 0 and 2*pi, and
// kappa is the concentration parameter, which must be greater than or
// equal to zero. If kappa is equal to zero, this distribution reduces
// to a uniform random angle over the range 0 to 2*pi
// mu: mean angle (in radians between 0 and 2*pi)
// kappa: concentration parameter kappa (>= 0)
// if kappa == 0 then generate uniform random angle
fn vommeises_variate(mu, kappa f32) f32

// triangular is the triangular distribution. continuous 
// distribution bounded by given lower and upper limits, and 
// having a given mode value in-between
fn triangular(mut tri Triangular) f32

// uniform returns a random number between the range [a, b) or 
// [a, b] depending on rounding
fn uniform(a, b f32) f32

// int_range returns a random int between the specified range
fn int_range(range IntRange) int

// float_range returns a random float upon the given range
fn float_range(range FloatRange) f32

// numeric returns a number with n digits long
fn numeric(n int) int

// bool returns a random bool
fn bool() bool

// shuffle returns the new shuffled array
fn shuffle<T>(arr []T) []T

// sample returns the new k-sized array
// no_repetitions must be true when no repetitions are needed
// else it must be false
fn sample<T>(arr []T, k int) []T

// choose returns a random element from the array
fn choose<T>(arr []T) T

// string returns a random string of n length
fn string(n int) string

// string_alpha returns an alpha string of n length
fn string_alpha(n int) string
```

## Usage

See [math](examples/rand.v), [random](examples/rand.v) and [string](examples/string.v) for usage.

## Acknowledgments

I thank [Python Software Foundation](https://www.python.org/psf/) for their work on [random](https://github.com/python/cpython/blob/master/Lib/random.py) library which helped me to port variate functions. 

## License

Licensed under [MIT](LICENSE)
