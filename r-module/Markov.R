library(expm)
T <- matrix(c(0.95,0.05,0,0,0.75,0.2,0.05,0,0.2,0.55,0.2,0.05,0.2, 0.55,0.2,0.05), nrow = 4, byrow = TRUE)
colnames(T) = c(0,1,2,3)
rownames(T) = c(0,1,2,3)

T

T%^%2

T%^%5

T%^%20
