#Biocomputing Exercise 08 
#Kevin Michael 
# Oct 23, 2020 

#1 - Build a Plot of Basketball Score 
setwd("/Users/kevinmichael/Desktop/BioComp/data-shell/Biocomputing2020_Exercise08")

#Reading in file 
scores <- read.table("UWvMSU_1-22-13.txt", header=T, sep="\t")
#Creating subsets for each team's respective scores 
UWpoints <- subset(scores, scores$team == "UW")
MSUpoints <- subset(scores, scores$team == "MSU")

#Now creating cumulative sums for each teams scores to signify point 
#totals throughout game with a for loop that sums each point up to the "i"th 
#point in the loop and stores in vector
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
#Now we plot cumulative point totals as a function of time, with Wisco in red and MSU in green
#labels added to make graph easier to understand
plot(UWpoints$time, csUW, type = "l", col = "red", xlab = "Time", ylab = "Points Scored")
lines(MSUpoints$time, csMSU, type = "l", col = "green", xlab = "Time", ylab = "Points Scored")

#2 - Higher or Lower Game 
#First we need to take a random number from a sample of 100 
rand_num = sample(1:100, 1)
#For loop will be set up to allow for 10 guesses
for(guess in 1:10){
  #at this point we set guess as an input value
  guess = readline(prompt = "Enter a Number: ")
  #if the guess is correct, we end the loop
  if(guess == rand_num){
    print("Correct!")
    break
  }
  #if not guess too low, we return "higher"
  else if(guess < rand_num){
    print("Higher")
  }
  #if guess too high, we return "lower"
  else if(guess > rand_num){
    print("Lower")
  }
}

