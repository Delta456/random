module random

import rand
import math

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

fn float_next(num f32) f32 {
    return math.fmod(rand_f32(), num)
}

fn rand_f32() f32 {
    return f32(rand.next(C.RAND_MAX)) / (f32(C.RAND_MAX) + f32(1))
}
/*
fn rand_arr() int {
    a := [1, 2]
    return a[rand.next(a.len)]
}
*/
