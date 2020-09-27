module random

import rand

const (
	captial_letters = 'ABCDEFGHIJLMNOPQURSTUVWXYZ'
	small_letters   = 'abcdefghijklmnopqurstuwxyz'
	letters         = 'ABCDEFGHIJLMNOPQURSTUVWXYZabcdefghijklmnopqurstuwxyz'
	digits          = '0123456789'
	symbols         = '!@#$%^&*()_+=|/'
)

// string returns a random string of n length 
pub fn string(n int) string {
	mut str := []string{}
	letters_ := letters.split('')
	for _ in range(0, n) {
		str << letters_[rand.intn(letters_.len)]
	}
	return str.join('')
}

// string_alpha returns an alpha string of n length
pub fn string_alpha(n int) string {
	mut str := []string{}
	letters_ := letters.split('')
	nums := digits.split('')
	for _ in range(0, n) {
		// TODO: do this in a better way
		str << nums[rand.intn(nums.len)] + letters_[rand.intn(letters_.len)]
	}
	str2 := str.join('')
	return if str2.len > n { str2[..n] } else { str2 }
}
