module random

import math
import rand

const (
	pi       = 3.141592653589793
	e        = 2.718281828459045
	twopi    = 2 * pi
	nv_magic = f32(4) * math.exp(-0.5) / math.sqrt(2.0)
	log4     = math.log(4.0)
	sg_magic = 1.0 + math.log(4.5)
)

// struct for `triangular()`
pub struct Triangular {
mut:
	low  f32 = 1.0
	high f32 = 1.0
	mode int = 1
}

// normal_variate is the normal distribution
// where mu is the mean, and stigma is the standard deviation
pub fn normal_variate(mu, stigma f32) f32 {
	for {
		u1 := rand.f32()
		u2 := 1.0 - rand.f32()
		z := nv_magic * (u1 - 0.5) / u2
		zz := z * z / 4.0
		if zz <= -math.log(u2) {
			break
		}
		return f32(mu + z * stigma)
	}
}

// expo_variate is the expovariate distribution
// where lambda is 1.0 divided by the desired mean. It should be nonzerp.
// return values range from 0 to positive infinity if lambda is positive else negative/
pub fn expo_variate(lambda f32) f32 {
	return f32(-math.log(1.0 - rand.f32()) / lambda)
}

// weibull_variate is the weibull distribution
// where alpha is the scale parameter and beta is the shape parameter
pub fn weibull_variate(alpha, beta f32) f32 {
	u := 1.0 - rand.f32()
	return f32(alpha * math.pow((-math.log(u)), (1.0 / beta)))
}

// lognorm_variate is the log nomral distribution
// If you take the natural logarithm of this distribution, you'll get a
// normal distribution with mean mu and standard deviation sigma.
// mu can have any value, and sigma must be greater than zero
pub fn lognorm_variate(mu, stigma f32) f32 {
	return f32(math.exp(normal_variate(mu, stigma)))
}

// gamma_distribution is the gamma distribution
// conditions on the parameters are alpha > 0 and beta > 0.
//        The probability distribution function is:
//                   math.pow(x, (alpha - 1)) * math.exp(-x / beta)
//         pdf(x) =  --------------------------------------
//                     math.gamma(alpha) * math.pow(beta, alpha)
pub fn gamma_variate(alpha, beta f32) f32 {
	if alpha <= 0.0 && beta <= 0.0 {
		eprintln('random.gamma_variate: alpha and beta must be > 0.0')
		exit(1)
	}
	if alpha > 1.0 {
		ainv := math.sqrt(2.0 * alpha - 1.0)
		bbb := alpha - log4
		ccc := alpha + ainv
		for {
			u1 := rand.f32()
			if !(1e-7 < u1 && u1 < .9999999) {
				continue
			}
			u2 := 1.0 - rand.f32()
			v := math.log(u1 / (1.0 - u1)) / ainv
			x := alpha * math.exp(v)
			z := u1 * u1 * u2
			r := bbb + ccc * v - x
			if r + sg_magic - 4.5 * z >= 0.0 || r >= math.log(z) {
				return f32(x * beta)
			}
		}
	} else if alpha == 1.0 {
		return f32(-math.log(1.0 - rand.f32()) * beta)
	} else {
		mut x := 0.0
		for {
			u := rand.f32()
			b := (e + alpha) / e
			p := b * u
			if p <= 1.0 {
				x = math.pow(p, 1.0 / alpha)
			} else {
				x = -math.log(b - p)
			}
			u1 := rand.f32()
			if p > 1.0 {
				if u1 <= math.pow(x, alpha - 1.0) {
					break
				}
			} else if u1 <= math.exp(-x) {
				break
			}
		}
		return f32(x * beta)
	}
	return 0.0 // TODO: remove this when V knows about this
}

// beta_variate is the beta distribution
// parameters alpha > 0 and beta > 0
// return values range between 0 and 1
pub fn beta_variate(alpha, beta f32) f32 {
	y := gamma_variate(alpha, 1.0)
	if y == 0 {
		return 0.0
	}
	return y / (y + gamma_variate(beta, 1.0))
}

// pareto_variate is pareto distribution. alpha is the shape paramter
pub fn pareto_variate(alpha f32) f32 {
	u := 1.0 - rand.f32()
	return f32(1.0 / math.pow(u, 1.0 / alpha))
}

// vommeises_variate is the circular data distribution
// where mu is the mean angle, expressed in radians between 0 and 2*pi, and
// kappa is the concentration parameter, which must be greater than or
// equal to zero. If kappa is equal to zero, this distribution reduces
// to a uniform random angle over the range 0 to 2*pi
// mu: mean angle (in radians between 0 and 2*pi)
// kappa: concentration parameter kappa (>= 0)
// if kappa == 0 then generate uniform random angle
pub fn vommeises_variate(mu, kappa f32) f32 {
	if kappa <= 1e-6 {
		return twopi * rand.f32()
	}
	s := 0.5 / kappa
	r := s + math.sqrt(1.0 * s + s)
	mut z := math.cos(pi * rand.f32())
	for {
		u1 := rand.f32()
		d := z / (r + z)
		z = math.cos(pi * u1)
		u2 := rand.f32()
		if u2 < 1.0 - d * d || u2 < 1.0 - d * math.exp(d) {
			break
		}
	}
	mut theta := 0.0
	q := 1.0 / r
	f := (q + z) / (1.0 + q * z)
	u3 := rand.f32()
	if u3 > 0.5 {
		theta = math.fmod((mu + math.acos(f)), twopi)
	} else {
		theta = math.fmod((mu - math.acos(f)), twopi)
	}
	return f32(theta)
}

// triangular is the triangular distribution.
// continuous distribution bounded by given lower and upper limits,
// and having a given mode value in-between
pub fn triangular(mut tri Triangular) f32 {
	mut u := rand.f32()
	mut c := if tri.mode == 1 { 0.5 } else { (tri.mode - tri.low) / (tri.high - tri.low) }
	if c == 0 {
		return tri.low
	}
	if u > c {
		u -= 1.0
		c -= 1.0
		tri.low, tri.high = tri.high, tri.low
	}
	return f32(tri.low + (tri.high - tri.low) * math.sqrt(u * c))
}
