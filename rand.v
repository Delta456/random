module random

import rand
import math
import arrays

const(
    nv_magic = f32(4) * math.exp(-0.5)/math.sqrt(2.0)
)
fn rand() int {
    return C.rand()
}

fn uniform(a, b f32) f32 {
    return a + (b-a) * f32(rand())
}
/*
fn normal_variate(mu, stigma f32) f32 {
    for {
        u1 := f32(rand())
        u2 := 1.0 - f32(rand())
        z := nv_magic * (u1-0.5)/u2
        zz := z*z/4.0
         if zz <= -math.log(u2) {
                break
         }
        return mu + z*stigma
    }
} 

*/
fn shuffle<T>(arr []T) []T {
   mut clone := arr
    
    for i in arrays.range<int>(0, arr.len).reverse() {
        j := rand.next(i+1)
        temp := clone[j]
        clone[j] = clone[i]
        clone[i] = temp
    }
    
    return clone
}


pub fn choose<T>(arr []T) T {
    return arr[rand.next(arr.len)]
}

