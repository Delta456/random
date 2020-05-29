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
	num := rand_arr()

	for i := 0; i < n; i++ {
		if num == 1 {
			str << cap[rand.next(cap.len)] + small[rand.next(small.len)]
		}
		else if num == 2 {
			str << small[rand.next(small.len)] + cap[rand.next(cap.len)] 
		}
	}
	return str.join('')
}
