import numpy as np
from PIL import Image
import matplotlib.pyplot as plt

np.set_printoptions(threshold=10000000000)
image=Image.open("img.png")
image=image.convert('RGB')
img= np.array(image)
fig, axes = plt.subplots(ncols=2, nrows=1, constrained_layout=True)
axes.flat[0].set(title="original",xlim=(-50,50),ylim=50)
axes.flat[1].set(title="transformed",xlim=(-50,50),ylim=50)
axes.flat[0].invert_yaxis()
axes.flat[1].invert_yaxis()
x = image.size[0]
y = image.size[1]

for i in range(x):
    for j in range(y):
        r = hex(image.getpixel((i, j))[0])[2:]
        b = hex(image.getpixel((i, j))[1])[2:]
        g = hex(image.getpixel((i, j))[2])[2:]
        point = np.array([i,j])
        trans=np.array([[1.5,0],[0,1.5]])#x=x+ay
        prime=np.matmul(point,trans)
        if len(r) == 1:
            r = '0' + r
        if len(b) == 1:
            b = '0' + b
        if len(g) == 1:
            g = '0' + g
        col = '#' + r + b + g
        axes.flat[1].scatter(prime[0],prime[1],c=col)
        axes.flat[0].scatter(i,j,c=col)
plt.show()
