
#Rubik Cube Modeling
# The standard rubik cube has 6 faces, on each face has 9 fixed colors.
# The standard moves are R(turning clokewise) and R'(turn-counterclockwise)
# These two moves can be apploied to each face which generate different moves which are called R(right), R'(reverse-right), L(left),L'(reverse-left), U, U', B, B' and so on...


rubik_Scrambling_Num <- 1
NumOfFaces <- 6 #number of cube faces which is 6 fro 3*3 rubik cube
NumOfCol <- 9 #number of each face colors which is 9 for 3*3 rubik cube

M <- matrix(0, NumOfFaces,NumOfCol)
M[1,] <- 1
M[2,] <- 2
M[3,] <- 3
M[4,] <- 4
M[5,] <- 5
M[6,] <- 6


M_SuperPosition <- matrix(0, NumOfFaces,NumOfCol) # super position matrix
M_SuperPosition[1,] <- 1
M_SuperPosition[2,] <- 2
M_SuperPosition[3,] <- 3
M_SuperPosition[4,] <- 4
M_SuperPosition[5,] <- 5
M_SuperPosition[6,] <- 6


for (i in 1:rubik_Scrambling_Num){





  #Generate a random integer between 1 and 6 (NumOfFaces).
  #Chose the face randomly that the move gonna be commited on.
  Face <- sample(1:NumOfFaces, 1)

  #Generate a random integer between 1 and 2.
  # 1 is clock wise turn and 2 is counterclockwise
  Move <- sample(1:2, 1)

  #Commite move on the Rubik cube Face and update the suerposition matrix

  #Or you may apply your favorite move and do sensitivity anlysis
  #Face <- 3
  #Move <- 1
  #----------------------------------------------------------------Commite Move on Face#1
  if (Face ==1){

    if (Move ==1){
      #update face corners
      M_SuperPosition[1,1] <- M[1,7]
      M_SuperPosition[1,3] <- M[1,1]
      M_SuperPosition[1,9] <- M[1,3]
      M_SuperPosition[1,7] <- M[1,9]
      #update face edge
      M_SuperPosition[1,2] <- M[1,4]
      M_SuperPosition[1,6] <- M[1,2]
      M_SuperPosition[1,8] <- M[1,6]
      M_SuperPosition[1,4] <- M[1,8]




      #update Edge#1
      M_SuperPosition[5,7] <- M[2,9]
      M_SuperPosition[4,1] <- M[5,7]
      M_SuperPosition[3,3] <- M[4,1]
      M_SuperPosition[2,9] <- M[3,3]
      #update Edge#2
      M_SuperPosition[5,8] <- M[2,6]
      M_SuperPosition[4,4] <- M[5,8]
      M_SuperPosition[3,2] <- M[4,4]
      M_SuperPosition[2,6] <- M[3,2]
      #update Edge#3
      M_SuperPosition[5,9] <- M[2,3]
      M_SuperPosition[4,7] <- M[5,9]
      M_SuperPosition[3,1] <- M[4,7]
      M_SuperPosition[2,3] <- M[3,1]

    }
    else {
      #update face corners
      M_SuperPosition[1,1] <- M[1,3]
      M_SuperPosition[1,3] <- M[1,9]
      M_SuperPosition[1,9] <- M[1,7]
      M_SuperPosition[1,7] <- M[1,1]
      #update face edge
      M_SuperPosition[1,2] <- M[1,6]
      M_SuperPosition[1,6] <- M[1,8]
      M_SuperPosition[1,8] <- M[1,4]
      M_SuperPosition[1,4] <- M[1,2]




      #update Edge#1
      M_SuperPosition[5,7] <- M[4,1]
      M_SuperPosition[4,1] <- M[3,3]
      M_SuperPosition[3,3] <- M[2,9]
      M_SuperPosition[2,9] <- M[5,7]
      #update Edge#2
      M_SuperPosition[5,8] <- M[4,4]
      M_SuperPosition[4,4] <- M[3,2]
      M_SuperPosition[3,2] <- M[2,6]
      M_SuperPosition[2,6] <- M[5,8]
      #update Edge#3
      M_SuperPosition[5,9] <- M[4,7]
      M_SuperPosition[4,7] <- M[3,1]
      M_SuperPosition[3,1] <- M[2,3]
      M_SuperPosition[2,3] <- M[5,9]
    }
    #update M
    M <- M_SuperPosition
  }


  #----------------------------------------------------------------Commite Move on Face#2
  if (Face ==2){

    if (Move ==1){
      #update face corners
      M_SuperPosition[2,1] <- M[2,7]
      M_SuperPosition[2,3] <- M[2,1]
      M_SuperPosition[2,9] <- M[2,3]
      M_SuperPosition[2,7] <- M[2,9]
      #update face edge
      M_SuperPosition[2,2] <- M[2,4]
      M_SuperPosition[2,6] <- M[2,2]
      M_SuperPosition[2,8] <- M[2,6]
      M_SuperPosition[2,4] <- M[2,8]



      #update Edge#1
      M_SuperPosition[5,1] <- M[6,9]
      M_SuperPosition[1,1] <- M[5,1]
      M_SuperPosition[3,1] <- M[1,1]
      M_SuperPosition[6,9] <- M[3,1]
      #update Edge#2
      M_SuperPosition[5,4] <- M[6,6]
      M_SuperPosition[1,4] <- M[5,4]
      M_SuperPosition[3,4] <- M[1,4]
      M_SuperPosition[6,6] <- M[3,4]
      #update Edge#3
      M_SuperPosition[5,7] <- M[6,3]
      M_SuperPosition[1,7] <- M[5,7]
      M_SuperPosition[3,7] <- M[1,7]
      M_SuperPosition[6,3] <- M[3,7]

    }
    else {
      #update face corners
      M_SuperPosition[2,1] <- M[2,3]
      M_SuperPosition[2,3] <- M[2,9]
      M_SuperPosition[2,9] <- M[2,7]
      M_SuperPosition[2,7] <- M[2,1]
      #update face edge
      M_SuperPosition[2,2] <- M[2,6]
      M_SuperPosition[2,6] <- M[2,8]
      M_SuperPosition[2,8] <- M[2,4]
      M_SuperPosition[2,4] <- M[2,2]



      #update Edge#1
      M_SuperPosition[5,1] <- M[1,1]
      M_SuperPosition[1,1] <- M[3,1]
      M_SuperPosition[3,1] <- M[6,9]
      M_SuperPosition[6,9] <- M[5,1]
      #update Edge#2
      M_SuperPosition[5,4] <- M[1,4]
      M_SuperPosition[1,4] <- M[3,4]
      M_SuperPosition[3,4] <- M[6,6]
      M_SuperPosition[6,6] <- M[5,4]
      #update Edge#3
      M_SuperPosition[5,7] <- M[1,7]
      M_SuperPosition[1,7] <- M[3,7]
      M_SuperPosition[3,7] <- M[6,3]
      M_SuperPosition[6,3] <- M[5,7]
    }
    #update M
    M <- M_SuperPosition
  }




  #----------------------------------------------------------------Commite Move on Face#3
  if (Face ==3){

    if (Move ==1){
      #update face corners
      M_SuperPosition[3,1] <- M[3,7]
      M_SuperPosition[3,3] <- M[3,1]
      M_SuperPosition[3,9] <- M[3,3]
      M_SuperPosition[3,7] <- M[3,9]
      #update face edge
      M_SuperPosition[3,2] <- M[3,4]
      M_SuperPosition[3,6] <- M[3,2]
      M_SuperPosition[3,8] <- M[3,6]
      M_SuperPosition[3,4] <- M[3,8]



      #update Edge#1
      M_SuperPosition[1,7] <- M[2,7]
      M_SuperPosition[4,7] <- M[1,7]
      M_SuperPosition[6,3] <- M[4,7]
      M_SuperPosition[2,7] <- M[6,3]
      #update Edge#2
      M_SuperPosition[1,8] <- M[2,8]
      M_SuperPosition[4,8] <- M[1,8]
      M_SuperPosition[6,2] <- M[4,8]
      M_SuperPosition[2,8] <- M[6,2]
      #update Edge#3
      M_SuperPosition[1,9] <- M[2,9]
      M_SuperPosition[4,9] <- M[1,9]
      M_SuperPosition[6,1] <- M[4,9]
      M_SuperPosition[2,9] <- M[6,1]

    }
    else {
      #update face corners
      M_SuperPosition[3,1] <- M[3,3]
      M_SuperPosition[3,3] <- M[3,9]
      M_SuperPosition[3,9] <- M[3,7]
      M_SuperPosition[3,7] <- M[3,1]
      #update face edge
      M_SuperPosition[3,2] <- M[3,6]
      M_SuperPosition[3,6] <- M[3,8]
      M_SuperPosition[3,8] <- M[3,4]
      M_SuperPosition[3,4] <- M[3,2]



      #update Edge#1
      M_SuperPosition[1,7] <- M[4,7]
      M_SuperPosition[4,7] <- M[6,3]
      M_SuperPosition[6,3] <- M[2,7]
      M_SuperPosition[2,7] <- M[1,7]
      #update Edge#2
      M_SuperPosition[1,8] <- M[4,8]
      M_SuperPosition[4,8] <- M[6,2]
      M_SuperPosition[6,2] <- M[2,8]
      M_SuperPosition[2,8] <- M[1,8]
      #update Edge#3
      M_SuperPosition[1,9] <- M[4,9]
      M_SuperPosition[4,9] <- M[6,1]
      M_SuperPosition[6,1] <- M[2,9]
      M_SuperPosition[2,9] <- M[1,9]
    }
    #update M
    M <- M_SuperPosition
  }





  #----------------------------------------------------------------Commite Move on Face#4
  if (Face ==4){

    if (Move ==1){
      #update face corners
      M_SuperPosition[4,1] <- M[4,7]
      M_SuperPosition[4,3] <- M[4,1]
      M_SuperPosition[4,9] <- M[4,3]
      M_SuperPosition[4,7] <- M[4,9]
      #update face edge
      M_SuperPosition[4,2] <- M[4,4]
      M_SuperPosition[4,6] <- M[4,2]
      M_SuperPosition[4,8] <- M[4,6]
      M_SuperPosition[4,4] <- M[4,8]



      #update Edge#1
      M_SuperPosition[5,9] <- M[1,9]
      M_SuperPosition[6,1] <- M[5,9]
      M_SuperPosition[3,9] <- M[6,1]
      M_SuperPosition[1,9] <- M[3,9]
      #update Edge#2
      M_SuperPosition[5,6] <- M[1,6]
      M_SuperPosition[6,4] <- M[5,6]
      M_SuperPosition[3,6] <- M[6,4]
      M_SuperPosition[1,6] <- M[3,6]
      #update Edge#3
      M_SuperPosition[5,3] <- M[1,3]
      M_SuperPosition[6,7] <- M[5,3]
      M_SuperPosition[3,3] <- M[6,7]
      M_SuperPosition[1,3] <- M[3,3]

    }
    else {
      #update face corners
      M_SuperPosition[4,1] <- M[4,3]
      M_SuperPosition[4,3] <- M[4,9]
      M_SuperPosition[4,9] <- M[4,7]
      M_SuperPosition[4,7] <- M[4,1]
      #update face edge
      M_SuperPosition[4,2] <- M[4,6]
      M_SuperPosition[4,6] <- M[4,8]
      M_SuperPosition[4,8] <- M[4,4]
      M_SuperPosition[4,4] <- M[4,2]



      #update Edge#1
      M_SuperPosition[5,9] <- M[6,1]
      M_SuperPosition[6,1] <- M[3,9]
      M_SuperPosition[3,9] <- M[1,9]
      M_SuperPosition[1,9] <- M[5,9]
      #update Edge#2
      M_SuperPosition[5,6] <- M[6,4]
      M_SuperPosition[6,4] <- M[3,6]
      M_SuperPosition[3,6] <- M[1,6]
      M_SuperPosition[1,6] <- M[5,6]
      #update Edge#3
      M_SuperPosition[5,3] <- M[6,7]
      M_SuperPosition[6,7] <- M[3,3]
      M_SuperPosition[3,3] <- M[1,3]
      M_SuperPosition[1,3] <- M[5,3]
    }
    #update M
    M <- M_SuperPosition
  }




  #----------------------------------------------------------------Commite Move on Face#5
  if (Face ==5){

    if (Move ==1){
      #update face corners
      M_SuperPosition[5,1] <- M[5,7]
      M_SuperPosition[5,3] <- M[5,1]
      M_SuperPosition[5,9] <- M[5,3]
      M_SuperPosition[5,7] <- M[5,9]
      #update face edge
      M_SuperPosition[5,2] <- M[5,4]
      M_SuperPosition[5,6] <- M[5,2]
      M_SuperPosition[5,8] <- M[5,6]
      M_SuperPosition[5,4] <- M[5,8]



      #update Edge#1
      M_SuperPosition[6,7] <- M[2,3]
      M_SuperPosition[4,3] <- M[6,7]
      M_SuperPosition[1,3] <- M[4,3]
      M_SuperPosition[2,3] <- M[1,3]
      #update Edge#2
      M_SuperPosition[6,8] <- M[2,2]
      M_SuperPosition[4,2] <- M[6,8]
      M_SuperPosition[1,2] <- M[4,2]
      M_SuperPosition[2,2] <- M[1,2]
      #update Edge#3
      M_SuperPosition[6,9] <- M[2,1]
      M_SuperPosition[4,1] <- M[6,9]
      M_SuperPosition[1,1] <- M[4,1]
      M_SuperPosition[2,1] <- M[1,1]

    }
    else {
      #update face corners
      M_SuperPosition[5,1] <- M[5,3]
      M_SuperPosition[5,3] <- M[5,9]
      M_SuperPosition[5,9] <- M[5,7]
      M_SuperPosition[5,7] <- M[5,1]
      #update face edge
      M_SuperPosition[5,2] <- M[5,6]
      M_SuperPosition[5,6] <- M[5,8]
      M_SuperPosition[5,8] <- M[5,4]
      M_SuperPosition[5,4] <- M[5,2]



      #update Edge#1
      M_SuperPosition[6,7] <- M[4,3]
      M_SuperPosition[4,3] <- M[1,3]
      M_SuperPosition[1,3] <- M[2,3]
      M_SuperPosition[2,3] <- M[6,7]
      #update Edge#2
      M_SuperPosition[6,8] <- M[4,2]
      M_SuperPosition[4,2] <- M[1,2]
      M_SuperPosition[1,2] <- M[2,2]
      M_SuperPosition[2,2] <- M[6,8]
      #update Edge#3
      M_SuperPosition[6,9] <- M[4,1]
      M_SuperPosition[4,1] <- M[1,1]
      M_SuperPosition[1,1] <- M[2,1]
      M_SuperPosition[2,1] <- M[6,9]
    }
    #update M
    M <- M_SuperPosition
  }





  #----------------------------------------------------------------Commite Move on Face#6
  if (Face ==6){

    if (Move ==1){
      #update face corners
      M_SuperPosition[6,1] <- M[6,7]
      M_SuperPosition[6,3] <- M[6,1]
      M_SuperPosition[6,9] <- M[6,3]
      M_SuperPosition[6,7] <- M[6,9]
      #update face edge
      M_SuperPosition[6,2] <- M[6,4]
      M_SuperPosition[6,6] <- M[6,2]
      M_SuperPosition[6,8] <- M[6,6]
      M_SuperPosition[6,4] <- M[6,8]



      #update Edge#1
      M_SuperPosition[5,3] <- M[4,9]
      M_SuperPosition[2,1] <- M[5,3]
      M_SuperPosition[3,7] <- M[2,1]
      M_SuperPosition[4,9] <- M[3,7]
      #update Edge#2
      M_SuperPosition[5,2] <- M[4,6]
      M_SuperPosition[2,4] <- M[5,2]
      M_SuperPosition[3,8] <- M[2,4]
      M_SuperPosition[4,6] <- M[3,8]
      #update Edge#3
      M_SuperPosition[5,1] <- M[4,3]
      M_SuperPosition[2,7] <- M[5,1]
      M_SuperPosition[3,9] <- M[2,7]
      M_SuperPosition[4,3] <- M[3,9]

    }
    else {
      #update face corners
      M_SuperPosition[6,1] <- M[6,3]
      M_SuperPosition[6,3] <- M[6,9]
      M_SuperPosition[6,9] <- M[6,7]
      M_SuperPosition[6,7] <- M[6,1]
      #update face edge
      M_SuperPosition[6,2] <- M[6,6]
      M_SuperPosition[6,6] <- M[6,8]
      M_SuperPosition[6,8] <- M[6,4]
      M_SuperPosition[6,4] <- M[6,2]



      #update Edge#1
      M_SuperPosition[5,3] <- M[2,1]
      M_SuperPosition[2,1] <- M[3,7]
      M_SuperPosition[3,7] <- M[4,9]
      M_SuperPosition[4,9] <- M[5,3]
      #update Edge#2
      M_SuperPosition[5,2] <- M[2,4]
      M_SuperPosition[2,4] <- M[3,8]
      M_SuperPosition[3,8] <- M[4,6]
      M_SuperPosition[4,6] <- M[5,2]
      #update Edge#3
      M_SuperPosition[5,1] <- M[2,7]
      M_SuperPosition[2,7] <- M[3,9]
      M_SuperPosition[3,9] <- M[4,3]
      M_SuperPosition[4,3] <- M[5,1]
    }
    #update M
    M <- M_SuperPosition
  }

}


Face
Move
print(M)


plot(M,xlab = 'Matrix Num',ylab = 'Face Number',xlim = c(1,9),ylim=c(1,6))
lines(M[1,],col=34)
lines(M[2,],col=62)
lines(M[3,],col=259)
lines(M[4,],col=26)
lines(M[5,],col=101)
lines(M[6,])


















