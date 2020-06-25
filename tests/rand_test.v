import random
import time
import rand

fn init() {
	rand.seed([u32(time.now().unix), 0])
}

fn test_bool() {
	for i := 0; i < 10; i++ {
		b := random.bool()
		assert b == true || b == false
	}
}

fn test_numeric() {
	for i := 0; i < 10; i++ {
		b := random.numeric(5)
		println(b.str().len)
		assert b.str().len == 5 || b.str().len == 6 || b.str().len == 4
	}
}

fn test_int_range() {
	for i := 0; i < 10; i++ {
		b := random.int_range(start: 5, stop: 15, step: 2)
		assert b >= 5
		assert b < 15 
	}

	for i := 0; i < 10; i++ {
		b := random.int_range(start: 15, stop: 1, step:-1)
		assert b <= 15
		assert b > 1 
	}
}

fn test_float_range() {
	for i := 0; i < 10; i++ {
		b := random.float_range(start: 5.3, stop: 15.4, step: 2.0)
		assert b >= f32(5.3)
		assert b < f32(15.4) 
	}

	for i := 0; i < 10; i++ {
		b := random.float_range(start: 15.0, stop: 5.3, step: -1)
		assert b <= f32(15.0)
		assert b > f32(5.3) 
	}
}

fn test_choose() {
	for i := 0; i < 10; i++ {
		arr_int := [2, 5, 7, 8, 9, 10, 13]
		arr_u64 := [u64(2), 37, 56, 79, 10]

		assert random.choose<int>(arr_int) in arr_int
		assert random.choose<u64>(arr_u64) in arr_u64 
	}
}

fn test_shuffle() {
	for i := 0; i < 10; i++ {
		arr_int := [2, 5, 7, 8, 9, 10, 13]
		arr_u64 := [u64(2), 37, 56, 79, 10]

		assert random.shuffle<int>(arr_int).len == arr_int.len
		assert random.shuffle<u64>(arr_u64).len == arr_u64.len
	}
}
/*
fn test_sample() {
	for i := 0; i < 10; i++ {
		arr_int := [2, 5, 7, 8, 9, 10, 13]
		arr_u64 := [u64(2), 37, 56, 79, 10]

		assert random.sample<int>(arr_int, 5, false).len == 5
		assert random.sample<u64>(arr_u64, 6, true).len == 6
	}
}
*/
