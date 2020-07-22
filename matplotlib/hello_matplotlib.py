import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm
fig=plt.figure()
ax = fig.gca(projection='3d')
point1=np.array([10,3,3])
point2=np.array([3,10,3])
point3=np.array([3,3,10])
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')
plt.scatter(point1[0],point1[1],point1[2], color='black')
plt.scatter(point2[0],point2[1],point2[2], color='black')
plt.scatter(point3[0],point3[1],point3[2], color='black')
plt.plot(point1,point2)
plt.plot(point1,point3)
plt.show()