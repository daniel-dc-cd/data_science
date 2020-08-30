# install.packages("lpSolve")
library(lpSolve)

f.obj <- c(13,23)

f.con <- matrix(c(5,15,
                  4,4,
                  35,20), nrow = 3, byrow = TRUE)

f.dir <- c("<=",
           "<=",
           "<=")

f.rhs <- c(480,
           160,
           1190)

sol<-lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)
sol$objval
sol$solution
sol$duals
