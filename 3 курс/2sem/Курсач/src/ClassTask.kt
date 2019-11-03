class SugarStorage(volume: Int = 10) {

    public var volume: Int = 10
    fun decreaseSugar(v: Int) {
        if (volume - v >= 0 && v >= 0)
            volume -= v
    }

    fun increaseSugar(v: Int) {
        if (volume + v >= 0 && v >= 0)
            volume += v
    }


}

open class Bug(val rank: Int, val name: String) {
    open fun getSugarLimit(): Int {
        return rank
    }

    fun getId(): String {
        return "${rank}.${name}"
    }
}

class BugCivilian(rank: Int, name: String) : Bug(rank, name) {
    override fun getSugarLimit() = super.getSugarLimit() / 2
}

fun main() {
    var s: SugarStorage = SugarStorage(volume = 10)

    s.decreaseSugar(10000)
    println(s.volume)

}