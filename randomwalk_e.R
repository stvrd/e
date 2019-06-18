rm(list=ls())
setwd("~/Desktop/Steve statistiques")

options(digits = 2)
options(scipen = 999)
format(exp(1))

e <- readChar("e.txt", nchars = 10000)

# FUNCTIONS =================================

rad2deg <- function(rad) {(rad * 180) / (pi)} ; rad2deg(pi)
deg2rad <- function(deg) {(deg * pi) / (180)} ; deg2rad(180)

map <- function(x, base=9) {
  deg <- as.numeric(x)*360/base
  rad <- deg2rad(deg)
  xy  <- c(cos(rad),sin(rad))
  return(xy) }
# ===================================================

RW <- data.frame(x=vector(,1e4), y=vector(,1e4))
for (i in 3:1000) { RW[i,] <- RW[i-1,] + map(substr(e,i,i)) }
head(RW,100)
plot(RW$x,RW$y, pch='.')
