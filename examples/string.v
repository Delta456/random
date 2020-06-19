mport random
import time
import rand

fn main() {
	rand.seed([u32(time.now().unix), 0])
	for i := 0; i < 5; i++ {
		println('${i+1} iteration')
		println(random.string(10))
		println(random.string_alpha(10))
		println('\n')
	}
}
