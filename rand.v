module random

import rand
//import math
//import range

pub struct IntRange {
    start int
    stop int
    step int = 1
}

pub struct FloatRange {
    start f32
    stop f32
    step f32 = 1.0
}

//type RandType = int | f32
pub fn uniform(a, b f32) f32 {
    return a + (b-a) * rand_f32()
}

pub fn int_range(range IntRange) int {
    if range.stop == 0 {
        if range.start > 1 {
            return rand.next(range.start)
        }
        eprintln('random: empty range for int_range()')
        exit(0)
    }
    width := range.stop - range.start
    mut n := 0
    if range.step == 1 {
        if width > 0 {
            return range.start + rand.next(width)
        }
        eprintln('random: empty range for int_range($range.start, $range.stop, $width)')
        exit(0)
    }

    if range.step > 0 {
        n = (width + range.step - 1) / range.step
    }
    else if range.step < 0 {
        n = (width + range.step + 1) / range.step
    }
    else {
        eprintln('random: empty range provided')
        exit(0)

    }
   return range.start + range.step * rand.next(n)
}

pub fn float_range(range FloatRange) f32 {
    if range.stop == 0 {
        if range.start >= 1 {
            return float_next(range.start)
        }
        eprintln('random: empty range for int_range()')
        exit(0)
    }
    width := range.stop - range.start
    mut n := 0
    if range.step == 1 {
        if width > 0 {
            return range.start + float_next(width)
        }
        eprintln('random: empty range for float_range($range.start, $range.stop, $width)')
        exit(0)
    }

    if range.step > 0 {
        n = (width + range.step - 1) / range.step
    }
    else if range.step < 0 {
        n = (width + range.step + 1) / range.step
    }
    else {
        eprintln('random: empty range provided')
        exit(0)

    }
   return range.start + range.step * float_next(n)
}

pub fn numeric(n int) int {
    mut str := []string{}
    digits_ := digits.split('')

    for i := 0; i < n; i++ {
        str << digits_[rand.next(digits_.len)]
    }
    return str.join('').int()
}

/* TODO: uncomment these once Generics are back
pub fn shuffle<T>(arr []T) []T {
   mut clone := arr
    
    for i in range(0, arr.len).reverse() {
        j := rand.next(i+1)
        clone[j], clone[i] = clone[i], clone[j]
    }
    return clone
}


pub fn choose<T>(arr []T) T {
    return arr[rand.next(arr.len)]
}
*/
