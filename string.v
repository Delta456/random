module random

import rand
import range

const (
	captial_letters = 'ABCDEFGHIJLMNOPQURSTUVWXYZ'
	small_letters = 'abcdefghijklmnopqurstuwxyz'
	letters = 'ABCDEFGHIJLMNOPQURSTUVWXYZabcdefghijklmnopqurstuwxyz'
	digits = '0123456789'
	symbols = '!@#$%^&*()_+=|/'
)

pub fn string(n int) string {
	mut str := []string{}
	letters_ = letters.split('')

	for i in range(stop:n) {
		str << letters_[rand.next(cap.len)]
	}
	return str.join('')
}

pub fn string_alpha(n int) string {
	mut str := []string{}
	letters_ = letters.split('')
	nums := digits.split('')

	for i in range(stop:n) {
		str << nums[rand.next(num.len)] + letters_[rand.next(letters_.len)]
	}
	return str.join('')
}
