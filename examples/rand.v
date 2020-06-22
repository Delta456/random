import random
import time
import rand

fn main() {
	rand.seed([u32(time.now().unix), 0])
	for i := 0; i < 5; i++ {
		println('${i+1} iteration')
		println(random.bool())
	    println(random.choose<int>([2, 4, 6, 8, 9, 7]))
		println(random.shuffle<int>([2, 4, 6, 8, 9, 7]))
		println(random.sample<int>([2, 4, 6, 7, 12, 8], 4))
		println(random.numeric(5))
		println(random.int_range(start: 5, stop: 15, step: 2))
		println(random.float_range(start: 5.3, stop: 15.4, step: 2.0))
		println('\n')
	}
}
