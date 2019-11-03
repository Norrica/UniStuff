# import scipy as sg
from typing import List, Any, Union
import numpy as num
import numpy.random as rand
import matplotlib.pyplot as plt


def rnd():
    rand.seed()
    if rand.randint(0, 1) > 0.5:
        return rand.uniform(0, 1)
    elif rand.randint(0, 1) < 0.5:
        return rand.normal(0, 1)


# %%
x1 = []
x2 = []
x3 = []
x4 = []

for i in range(500):  # Create Arrays
    x1.append(num.sin(2 * num.pi * i / 100))
    x2.append(4 * num.exp(-(i - 150) ** 2 / 300) - num.exp(-(i - 150) ** 2 / 2500))
    if 240 < i < 300:
        x3.append(1)
    elif 299 < i < 380:
        x3.append(-2)
    else:
        x3.append(0)
    x4.append(rnd() + rnd() + rnd() + rnd() + rnd() + rnd())
# list(map(lambda w, x, y, z: w * x * y * z, x1, x2, x3, x4))
xn = []
for i in range(500):
    xn.append(x1[i] + x2[i] + x3[i] + x4[i])

xall = [x1, x2, x3, x4, xn]


def f(*arrays):
    res = []
    for ar in arrays:
        yn = [ar[0]]
        for i, j in enumerate(ar[1:]):
            yn.append(0.05 * j + 0.95 * yn[i - 1])
        res.append(yn)
    return res


def plotter(*arrays, xax="x", yax="y", ttl="exmpl"):
    plt.figure(figsize=(12, 7), num=ttl)
    for ar in arrays:
        for a, b in enumerate(ar):
            plt.subplot(len(ar), 1, a + 1)
            plt.xlabel(xax)
            plt.ylabel(yax)
            plt.plot(b)


yall = f(*xall)
plotter(xall, ttl="Последовательности")
plotter(yall, ttl="Фильтрованные последовательности")
plt.show()


# %%


# In[75]:


def subber(a, b):
    res = []
    for i, j in zip(a, b):
        res.append(i - j)
    return res


buf = f(xn)
subbed = [subber(buf[0], i) for i in yall]
plotter(yall, ttl="Фильтрованные последовательности")
plotter(subbed, ttl="Разница")
plt.show()

# In[77]:


# %%

hn = [i / 25 for i in range(1, 5)]
hn += [i / 25 for i in range(5, 0, -1)]

plotter([xn, num.convolve(hn, xn)], ttl="Результат свёртки")
plt.show()

# In[86]:


xn += [0 for i in range(1024 - len(xn))]
hn += [0 for i in range(1024 - len(hn))]

dpf = num.fft.fft(xn, 1024)
dpf1 = num.fft.fft(hn, 1024)

plotter([num.real(dpf)], xax="Сигнал", yax="ДПФ", ttl="ДПФ сигнала x[n]")
plt.show()

plt.figure("АЧХ сигнала h[n]")
plt.plot(dpf1)
plt.title("АЧХ сигнала h[n]")
plt.plot([0, 1024], [0.1 * dpf1.max(), 0.1 * dpf1.max()], 'g--', label='Зона непрозрачности')
plt.plot([0, 1024], [0.9 * dpf1.max(), 0.9 * dpf1.max()], 'r--', label='Полоса пропускания')
plt.legend(loc='best')
plt.show()

conv = num.convolve(xn, hn, mode="full")

for i in range(1023):
    dpf[i] *= dpf1[i]
dprf = num.fft.ifft(dpf, n=1024)

# plotter([dpf, dpf1, dprf, conv])
# plt.show()

for i in range(1024):
    conv[i] -= num.real(dprf[i])

plotter([num.real(conv)], ttl="Разница между свёрткой и обратным ДПФ")
plt.show()
