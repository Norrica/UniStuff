class Player(
    var str: Int = 0, var dex: Int = 0, var XP: Int = 0, var lvl: Int = 1,
    var nextLvlXp:Int = 10
) {
    fun receiveXP(xp: Int) {
        XP += xp
        if (XP >= nextLvlXp) lvlUp()
        println("str = ${str} dex = ${dex} lvl = ${lvl}")
    }

    private fun lvlUp() {
        lvl += 1
        str += if (lvl % 2 == 0) 1 else 0
        dex += if (lvl % 2 == 1) 1 else 0
        nextLvlXp += 100
    }
}

fun main() {
    var p = Player(str=2)
    p.receiveXP(10)
    p.receiveXP(100)
    p.receiveXP(100)

}