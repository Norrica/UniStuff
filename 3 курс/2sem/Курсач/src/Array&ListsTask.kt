fun getCubeList(n: Int): List<Int> {
    val a: List<Int> = List<Int>(n, { i -> i * i * i })
    return a
}

fun calculateWordStat1(input: String): String {
    val words: List<String> = input.split(' ')
    val freq = words.groupingBy { it }.eachCount()
    print(freq)
    val a = freq.keys.elementAt(freq.values.indexOf(freq.values.max()!!))
    return a
}

fun calculateWordStat(input:String) = input.
    split(" ").
    groupingBy { it }.
    eachCount().
    maxBy { it.value }?.
    key

fun main() {
    //print(getCubeList(9))
    print(
        (calculateWordStat(
            "PDDPEM MXWHL XJID XJID XJID DTQEHGC DTQEHGC MXWHL XJID " +
                    "DTQEHGC DTQEHGC MXWHL PDDPEM QUCO DTQEHGC MXWHL " +
                    "DTQEHGC MXWHL PDDPEM XJID MXWHL DTQEHGC DTQEHGC" +
                    " XJID XJID XJID MXWHL MXWHL MXWHL MXWHL DTQEHGC " +
                    "PDDPEM DTQEHGC DTQEHGC PDDPEM"
        ))
    )
}