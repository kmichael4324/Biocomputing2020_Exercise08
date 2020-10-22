#Biocomputing Exercise 08 
#Kevin Michael 
# Oct 23, 2020 

#1 - Build a Plot of Basketball Score 
setwd("/Users/kevinmichael/Desktop/BioComp/data-shell/Biocomputing2020_Exercise08")


scores <- read.table("UWvMSU_1-22-13.txt", header=T, sep="\t")
UWpoints <- subset(scores, scores$team == "UW")
MSUpoints <- subset(scores, scores$team == "MSU")

csUW = numeric(length=length(UWpoints$score))
for(i in 1:length(UWpoints$score)){
  csUW[i] = sum(UWpoints$score[1:i])
}
csUW

csMSU = numeric(length=length(MSUpoints$score))
for(i in 1:length(MSUpoints$score)){
  csMSU[i] = sum(MSUpoints$score[1:i])
}
csMSU

plot(UWpoints$time, csUW, type = "l", col = "red", xlab = "Time", ylab = "Points Scored")
lines(MSUpoints$time, csMSU, type = "l", col = "green", xlab = "Time", ylab = "Points Scored")



