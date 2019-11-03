import random
import numpy as np

random.seed('зерно')



def fi(tau):
    RAND = random.random()
    return -tau * np.log(RAND)


def main(n=0, Nin=0, L=7, Nmax=10000, Nloss=0, tauin=13, tauserve=19):
    Tin = fi(tauin)
    queue = []
    Tout = Tin + fi(tauserve)
    n += 1
    while Nin <= Nmax:
        Nin += 1
        Tin += fi(tauin)
        while True:
            if Tin < Tout:
                if n > L:
                    Nloss += 1
                else:
                    n += 1
                break
            n -= 1
            if n == 0:
                Tout = Tin + fi(tauserve)
            else:
                Tout = Tout + fi(tauserve)
                queue.append(n)
    p = tauserve / tauin
    print("Коэффициент потерь по формуле:", (1 - p) / (1 - p ** (L + 2)) * p ** (L + 1))
    print("Средняя длина очереди по формуле:",
          p ** 2 / (1 - p ** (L + 2)) * ((1 - (p ** L) * (1 + L - L * p)) / (1 - p)))
    print("Коэффициент потерь:", Nloss / Nmax)
    print("Средняя длина очереди:", sum(queue) / len(queue))


# print(main())
main()
