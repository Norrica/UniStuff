fun getLength(str: String?): Int? {

    return str!!.length

}

fun calcNullValues(input: Array<Int?>): Array<Int> {

    var j = 0
    var k = 0
    for (i in input) {
        if (i == null)
            j++
        else k += i
    }
    return arrayOf(j, k)
}

fun main() {
    var a = arrayOf(
        82,
        null,
        null,
        null,
        null,
        null,
        7,
        55,
        null,
        59,
        4,
        25,
        null,
        null,
        66,
        null,
        3,
        62,
        55,
        null,
        42,
        5,
        35,
        8,
        null
    )
    print(calcNullValues(a)[0])
    print("\n")
    print(calcNullValues(a)[1])

}
