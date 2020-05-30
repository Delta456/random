module random

import math

const (
    pi = 3.141592653589793
    e = 2.718281828459045
    twopi = 2 * pi
    nv_magic = f32(4) * math.exp(-0.5)/math.sqrt(2.0)
    log4 = math.log(4.0)
    sg_magic = 1.0 + math.log(4.5)
)

pub struct Triangular {
    low f32 = 1.0
    high f32 = 1.0
    mode int = 1
}

pub fn normal_variate(mu, stigma f32) f32 {
    for {
        u1 := rand_f32()
        u2 := 1.0 - rand_f32()
        z := nv_magic * (u1-0.5)/u2
        zz := z*z/4.0
         if zz <= -math.log(u2) {
                break
        }
        return mu + z*stigma
    }
}

pub fn expo_variate(lambda f32) f32 {
	return -math.log(1.0 - rand_f32()) / lambda
}

pub fn weibull_variate(alpha, beta f32) f32 {
	u := 1.0 - rand_f32()
	return alpha * math.pow((-math.log(u)), (1.0/beta))
}

pub fn lognorm_variate(mu, stigma f32) f32 {
	return math.exp(normal_variate(mu, stigma))
}

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
            u1 := rand_f32()
            if !(1e-7 < u1 && u1 < .9999999) {
                continue
            }
            u2 := 1.0 - rand_f32()
            v := math.log(u1/(1.0-u1))/ainv
            x := alpha * math.exp(v)
            z := u1*u1*u2
            r := bbb+ccc*v-x
            if r + sg_magic - 4.5*z >= 0.0 || r >= math.log(z) {
                return x * beta
            }
        }
    }
    else if alpha == 1.0 {
        return -math.log(1.0 - rand_f32()) * beta
    }

    else {
        mut x := 0.0
        for {
            u := rand_f32()
            b := (e + alpha) / e
            p := b * u
            if p <= 1.0 {
                x = math.pow(p, 1.0/alpha)
            }
            else {
                x = -math.log(b-p, alpha)
            }
            u1 := rand_f32()
            if p > 1.0 {
                if u1 <= math.pow(x, alpha - 1.0) {
                    break
                }
            }
            else if u1 <= math.expr(-x) {
                break
            }
        }
        return x * beta
    }
}

pub beta_variate(alpha, beta f32) f32 {
   y := gamma_variate(alpha, 1.0)
   if y == 0 {
       return 0.0
   }
   return y / (y + gamma_variate(beta, 1.0))
}

pub pareto_variate(alpha f32) f32 {
    u := 1.0 - rand_f32()
    return 1.0 / math.pow(u, 1.0/alpha)
}

pub fn vommeises_variate(mu, kappa f32) f32 {
    if kappa <= 1e-6 {
        return twopi * rand_f32()
    }
    s := 0.5 / kappa
    r := s + math.sqrt(1.0 * s + s)

    for {
        u1 := rand_f32()
        z := math.cos(pi * u1)
        d := z / (r + z)

        u2 := rand_f32()
        if u2 < 1.0 - d * d || u2 < 1.0 - d * math.exp(d) {
            break
        }
    }
    mut theta := 0.0
    q := 1.0 / r
    f = (q + z) / (1.0 + q * z)
        u3 = rand_f32()
    if u3 > 0.5 {
        theta = math.fmod((mu + sin.acos(f)), twopi)
    }
    else {
        theta = math.fmod((mu - sin.acos(f)), twopi)
    }
    return theta
}

pub fn triangular(mut tri Triangular) f32 {
   mut u := rand_f32()
   mut c := if tri.mode == 1 { 0.5 } else { (tri.mode - tri.low) / (tri.high - tri.low) }
    if c == 0 {
        return tri.low
    }

    if u > c {
        u -= 1.0
        c -= 1.0
        tri.low , tri.high = tri.high , tri.low
    }
    return tri.low + (tri.high - tri.low) * math.sqrt(u * c)
}
