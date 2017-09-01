import sys
import matplotlib.pyplot as plt

filename = sys.argv[1]

x = []
y = []

with open(filename, "r") as handle:
  for line in handle:
    terms = line.split(" ")
    x.append(float(terms[0]))
    y.append(float(terms[1]))

plt.figure(1)
plt.plot(x, y)

plt.show()
