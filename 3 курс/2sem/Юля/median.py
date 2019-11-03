
from PIL import Image

img = Image.open("lennaNoisy.png")
w = img.size[0]
h = img.size[1]
lenna = img.load()
retlenna = img.copy()


for i in range(1, w - 1):
    for j in range(1, h - 1):
        a = [lenna[i - 1, j - 1][0], lenna[i - 1, j - 1][1], lenna[i - 1, j - 1][2]]
        b = [lenna[i - 1, j][0], lenna[i - 1, j][1], lenna[i - 1, j][2]]
        c = [lenna[i - 1, j + 1][0], lenna[i - 1, j + 1][1], lenna[i - 1, j + 1][2]]
        d = [lenna[i, j - 1][0], lenna[i, j - 1][1], lenna[i, j - 1][2]]

        e = [lenna[i, j][0], lenna[i, j][1], lenna[i, j][2]]
        f = [lenna[i, j + 1][0], lenna[i, j + 1][1], lenna[i, j + 1][2]]
        g = [lenna[i + 1, j - 1][0], lenna[i + 1, j - 1][1], lenna[i + 1, j - 1][2]]
        k = [lenna[i + 1, j][0], lenna[i + 1, j][1], lenna[i + 1, j][2]]
        l = [lenna[i + 1, j + 1][0], lenna[i + 1, j + 1][1], lenna[i + 1, j + 1][2]]

        R = [a[0], b[0], c[0], d[0], e[0], f[0], g[0], k[0], l[0]]
        G = [a[1], b[1], c[1], d[1], e[1], f[1], g[1], k[1], l[1]]
        B = [a[2], b[2], c[2], d[2], e[2], f[2], g[2], k[2], l[2]]

        R.sort()
        G.sort()
        B.sort()

        retlenna.putpixel((i, j), (R[4], G[4], B[4]))

retlenna.save("lennaMedian.png", "PNG")
