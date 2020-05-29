module random

import rand

const (
	captial_letters = 'ABCDEFGHIJLMNOPQURSTUVWXYZ'
	small_letters = 'abcdefghijklmnopqurstuwxyz'
	letters = 'ABCDEFGHIJLMNOPQURSTUVWXYZabcdefghijklmnopqurstuwxyz'
	digits = '0123456789'
	symbols = '!@#$%^&*()_+=|/'
)

pub fn string(n int) string {
	mut str := []string{}
    cap := captial_letters.split('')
	small := small_letters.split('')

	for i := 0; i < n; i++ {
		str << cap[rand.next(cap.len)] + small[rand.next(small.len)]
	}
	return str.join('')
}


