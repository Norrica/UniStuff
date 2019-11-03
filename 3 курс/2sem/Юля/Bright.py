from PIL import Image


lena = Image.open("lennaNoisy.png")
w = lena.size[0]
h = lena.size[1]
lenna = lena.load()
retlenna = lena.copy()

for i in range(1, w - 1):
    for j in range(1, h - 1):
        a = lenna[i - 1, j - 1][0] + lenna[i - 1, j - 1][1] + lenna[i - 1, j - 1][2]
        b = lenna[i - 1, j][0] + lenna[i - 1, j][1] + lenna[i - 1, j][2]
        c = lenna[i - 1, j + 1][0] + lenna[i - 1, j + 1][1] + lenna[i - 1, j + 1][2]
        d = lenna[i, j - 1][0] + lenna[i, j - 1][1] + lenna[i, j - 1][2]
        e = lenna[i, j][0] + lenna[i, j][1] + lenna[i, j][2]
        f = lenna[i, j + 1][0] + lenna[i, j + 1][1] + lenna[i, j + 1][2]
        g = lenna[i + 1, j - 1][0] + lenna[i + 1, j - 1][1] + lenna[i + 1, j - 1][2]
        k = lenna[i + 1, j][0] + lenna[i + 1, j][1] + lenna[i + 1, j][2]
        l = lenna[i + 1, j + 1][0] + lenna[i + 1, j + 1][1] + lenna[i + 1, j + 1][2]

        avg = (a + b + c + d + e + f + g + k + l) / 8

        if e == 0:
            e = 1

        if e < avg:
            retlenna.putpixel((i, j), (int(lenna[i, j][0] * avg / e),
                                       int(lenna[i, j][1] * avg / e),
                                       int(lenna[i, j][2] * avg / e)))

retlenna.save("lennaNoisyBrUP.png", "PNG")
