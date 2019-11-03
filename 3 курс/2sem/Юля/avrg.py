
from PIL import Image

lena = Image.open("lennaNoisy.png")
w = lena.size[0]
h = lena.size[1]
lenna = lena.load()
retlenna = lena.copy()


for i in range(1, w - 1):
    for j in range(1, h - 1):
        a = [lenna[i - 1, j - 1][0], lenna[i - 1, j - 1][1], lenna[i - 1, j - 1][2]]
        b = [lenna[i - 1, j][0], lenna[i - 1, j][1], lenna[i - 1, j][2]]
        c = [lenna[i - 1, j + 1][0], lenna[i - 1, j + 1][1], lenna[i - 1, j + 1][2]]
        d = [lenna[i, j - 1][0], lenna[i, j - 1][1], lenna[i, j - 1][2]]

        e = [lenna[i, j + 1][0], lenna[i, j + 1][1], lenna[i, j + 1][2]]
        f = [lenna[i + 1, j - 1][0], lenna[i + 1, j - 1][1], lenna[i + 1, j - 1][2]]
        g = [lenna[i + 1, j][0], lenna[i + 1, j][1], lenna[i + 1, j][2]]
        k = [lenna[i + 1, j + 1][0], lenna[i + 1, j + 1][1], lenna[i + 1, j + 1][2]]

        R = int((a[0] + b[0] + c[0] + d[0] + e[0] + f[0] + g[0] + k[0]) / 8)
        G = int((a[1] + b[1] + c[1] + d[1] + e[1] + f[1] + g[1] + k[1]) / 8)
        B = int((a[2] + b[2] + c[2] + d[2] + e[2] + f[2] + g[2] + k[2]) / 8)

        retlenna.putpixel((i, j), (R, G, B))

retlenna.save("lennaverage.png", "PNG")
