import rand


pub fn choose<T>(arr []T) T {
    return arr[rand.next(arr.len)]
}

pub fn uniform(a, b int) int {
    return a + (b-a) * C.rand()
}
