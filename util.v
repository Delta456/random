module random

import rand

fn range(start, end int) []int {
    mut arr := []int{}
    for i := start; i < end; i++ {
        arr << i
    }
    return arr
}

fn rand() int {
    return C.rand()
}

fn rand_f32() f32 {
    return f32(rand.next(C.RAND_MAX)) / (f32(C.RAND_MAX) + f32(1))
}
