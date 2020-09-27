module random

fn range(start, end int) []int {
	mut arr := []int{}
	for i := start; i < end; i++ {
		arr << i
	}
	return arr
}
