import random as rand
from PIL import Image

lena = Image.open("Lenna.png")
w = lena.size[0]
h = lena.size[1]
lenna = lena.load()
retlenna = lena.copy()

for i in range(w):
    for j in range(h):
        chance = rand.random()
        if chance > 0.8:
            R = rand.randint(0, 255)
            G = rand.randint(0, 255)
            B = rand.randint(0, 255)
            retlenna.putpixel((i, j), (R, G, B))

retlenna.save("lennaNoisy.png", "PNG")