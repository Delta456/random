module random

import math

const (
    nv_magic = f32(4) * math.exp(-0.5)/math.sqrt(2.0)
)

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
