module random

import rand

// struct for `int_range()`
pub struct IntRange {
	start int
	stop  int
	step  int = 1
}

// struct for `float_range()`
pub struct FloatRange {
	start f32
	stop  f32
	step  f32 = 1.0
}

// uniform returns a random number between the range [a, b) or [a, b] depending on rounding
pub fn uniform(a, b f32) f32 {
	return a + (b - a) * rand.f32()
}

// int_range returns a random int between the specified range
pub fn int_range(range IntRange) int {
	if range.stop == 0 {
		if range.start > 1 {
			return rand.intn(range.start)
		}
		eprintln('random: empty range for int_range()')
		exit(1)
	}
	width := range.stop - range.start
	mut n := 0
	if range.step == 1 {
		if width > 0 {
			return range.start + rand.intn(width)
		}
		eprintln('random: empty range for int_range($range.start, $range.stop, $width)')
		exit(1)
	}
	if range.step > 0 {
		n = (width + range.step - 1) / range.step
	} else if range.step < 0 {
		n = (width + range.step + 1) / range.step
	} else {
		eprintln('random: empty range provided')
		exit(1)
	}
	return range.start + range.step * rand.intn(n)
}

// float_range returns a random float upon the given range
pub fn float_range(range FloatRange) f32 {
	if range.stop == 0 {
		if range.start >= 1 {
			return rand.f32n(range.start)
		}
		eprintln('random: empty range for float_range()')
		exit(1)
	}
	width := range.stop - range.start
	mut n := f32(0)
	if range.step == 1 {
		if width > 0 {
			return range.start + rand.f32n(width)
		}
		eprintln('random: empty range for float_range($range.start, $range.stop, $width)')
		exit(1)
	}
	if range.step > 0 {
		n = (width + range.step - 1) / range.step
	} else if range.step < 0 {
		n = (width + range.step + 1) / range.step
	} else {
		eprintln('random: empty range provided')
		exit(1)
	}
	return range.start + range.step * rand.f32n(n)
}

// numeric returns a number with n digits long
pub fn numeric(n int) int {
	mut str := []string{}
	digits_ := digits.split('')
	for i := 0; i < n; i++
	 {
		str << digits_[rand.intn(digits_.len)]
	}
	return str.join('').int()
}

// bool returns a random bool
pub fn bool() bool {
	boo := [true, false]
	return boo[rand.intn(boo.len)]
}

// shuffle returns the new shuffled array
pub fn shuffle<T>(arr []T) []T {
	mut clone := arr
	for i in range(0, arr.len).reverse() {
		j := rand.intn(i + 1)
		clone[j], clone[i] = clone[i], clone[j]
	}
	return clone
}

// choose returns a random element from the array
pub fn choose<T>(arr []T) T {
	return arr[rand.intn(arr.len)]
}
