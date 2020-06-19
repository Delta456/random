import random
import time
import rand

fn main() {
	rand.seed([u32(time.now().unix), 0])

	for i := 0; i < 5; i++ {
		println('${i+1} iteration')
		println(random.normal_variate(34.0, 5.0))
		println(random.weibull_variate(3.3, 0.3))
		println(random.beta_variate(1, 1.3))
		println(random.pareto_variate(3.3))
		println(random.uniform(1.4, 2.56))
		println(random.triangular(mut random.Triangular{mode:1}))
		println(random.vommeises_variate(0.0, 1.0))
	}

}