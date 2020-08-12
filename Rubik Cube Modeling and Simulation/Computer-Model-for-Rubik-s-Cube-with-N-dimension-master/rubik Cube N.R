#Rubik's Cube Modeling NNN
#Creat two type of matrixs for each Face.
#One is called base matrix (F[i]) and another one is superposition matrix (FS[i])which takes the moves on
#each rubiks cube faces and memorize it and pass it to the base matrix (F[i]).

#Creat two type of matrixs for each Face. One is called base matrix (F[i]) and another one is superposition matrix (FS[i])which
#takes the moves on each rubiks cube faces and memorize it and pass it to the base matrix (F[i])
N <- 3 # Rubik'c Cube Dimension
NumOfFaces <- 6 #number of cube faces which is 6 for 3*3 rubik cube. For shapes with more faces (more than 6) this gigit should be opened and investigated!
#This digit acts like a cofficent of a model in determinstic models. However, in fact it has lot of independant parameters in it.
F1 <- matrix(1, N,N)
FS1 <- matrix(1, N,N) # super position matrix
F2 <- matrix(2, N,N)
FS2 <- matrix(2, N,N) # super position matrix
F3 <- matrix(3, N,N)
FS3 <- matrix(3, N,N) # super position matrix
F4 <- matrix(4, N,N)
FS4 <- matrix(4, N,N) # super position matrix
F5 <- matrix(5, N,N)
FS5 <- matrix(5, N,N) # super position matrix
F6 <- matrix(6, N,N)
FS6 <- matrix(6, N,N) # super position matrix



rubik_Scrambling_Num <- 1
for (i in 1:rubik_Scrambling_Num){

  #Generate a random integer between 1 and 6 (NumOfFaces).
  #Chose the face randomly that the move gonna be commited on.
  Face_Direction <- round(runif(1,1,6))
  # Face_Direction <- 6
  #Generate value between 1 to 6
  layer_number <- round(runif(1,1,N-1))
  # layer_number <- 1
  #Generate a random integer between 1 and 2.
  # 1 is clock wise turn and 2 is counterclockwise
  Move <- round(runif(1,1,2))
  # Move <- 2
  #======================================================================
  #Face#1, Rotate clockwise(Move=1) or counterclockwise(Move=2)
  if (Face_Direction ==1){
    if (layer_number==1){
      if (Move ==1){
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS1[i,j] <- F1[N+1-i,i]
            FS1[j,N+1-i] <- F1[i,j]
            FS1[N+1-i,N+1-i] <- F1[j,N+1-i]
            FS1[N+1-i,i] <- F1[N+1-i,N+1-i]
          }
        }
      }
      else {
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS1[i,j] <- F1[j,N+1-i]
            FS1[j,N+1-i] <- F1[N+1-i,N+1-i]
            FS1[N+1-i,N+1-i] <- F1[N+1-i,i]
            FS1[N+1-i,i] <- F1[i,j]
          }
        }
      }
    }
    #update other face#1 neighbors if move is 1
    if (Move==1){
      FS2[1:N,N+1-layer_number] <- F3[1,1:N]
      FS5[N+1-layer_number,1:N] <- F2[1:N,N+1-layer_number]
      FS4[1:N,layer_number] <- F5[N+1-layer_number,1:N]
      FS3[layer_number,1:N] <- F4[1:N,layer_number]
    }
    else {
      FS2[1:N,N+1-layer_number] <- F5[N+1-layer_number,1:N]
      FS5[N+1-layer_number,1:N] <- F4[1:N,layer_number]
      FS4[1:N,layer_number] <- F3[1,1:N]
      FS3[layer_number,1:N] <- F2[1:N,N+1-layer_number]
    }
    #update base matrixs#1
    F1 <- FS1
    F2 <- FS2
    F3 <- FS3
    F4 <- FS4
    F5 <- FS5
    F6 <- FS6
  }
  #======================================================================
  #Face#2, Rotate clockwise(Move=1) or counterclockwise(Move=2)
  if (Face_Direction ==2){
    if (layer_number==1){
      if (Move ==1){
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS2[i,j] <- F2[N+1-i,i]
            FS2[j,N+1-i] <- F2[i,j]
            FS2[N+1-i,N+1-i] <- F2[j,N+1-i]
            FS2[N+1-i,i] <- F2[N+1-i,N+1-i]
          }
        }
      }
      else {
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS2[i,j] <- F2[j,N+1-i]
            FS2[j,N+1-i] <- F2[N+1-i,N+1-i]
            FS2[N+1-i,N+1-i] <- F2[N+1-i,i]
            FS2[N+1-i,i] <- F2[i,j]
          }
        }
      }
    }
    #update other face#2 neighbors if move is 1
    if (Move==1){
      FS6[1:N,N+1-layer_number] <- F3[N:1,layer_number]
      FS5[1:N,layer_number] <- F6[1:N,N+1-layer_number]
      FS1[1:N,layer_number] <- F5[1:N,N+1-layer_number]
      FS3[1:N,layer_number] <- F1[1:N,layer_number]
    }
    else {
      FS6[1:N,N+1-layer_number] <- F5[1:N,layer_number]
      FS5[1:N,layer_number] <- F1[1:N,layer_number]
      FS1[1:N,layer_number] <- F3[N:1,layer_number]
      FS3[1:N,layer_number] <- F6[1:N,N+1-layer_number]
    }
    #update base matrixs#1
    F1 <- FS1
    F2 <- FS2
    F3 <- FS3
    F4 <- FS4
    F5 <- FS5
    F6 <- FS6
  }

  #======================================================================
  #Face#3, Rotate clockwise(Move=1) or counterclockwise(Move=2)
  if (Face_Direction ==3){
    if (layer_number==1){
      if (Move ==1){
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS3[i,j] <- F3[N+1-i,i]
            FS3[j,N+1-i] <- F3[i,j]
            FS3[N+1-i,N+1-i] <- F3[j,N+1-i]
            FS3[N+1-i,i] <- F3[N+1-i,N+1-i]
          }
        }
      }
      else {
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS3[i,j] <- F3[j,N+1-i]
            FS3[j,N+1-i] <- F3[N+1-i,N+1-i]
            FS3[N+1-i,N+1-i] <- F3[N+1-i,i]
            FS3[N+1-i,i] <- F3[i,j]
          }
        }
      }
    }
    #update other face#3 neighbors if move is 1
    if (Move==1){
      FS2[N+1-layer_number,N:1] <- F6[N:1,layer_number]
      FS1[N+1-layer_number,N:1] <- F2[N+1-layer_number,N:1]
      FS4[N+1-layer_number,N:1] <- F1[N+1-layer_number,N:1]
      FS6[N:1,layer_number] <- F4[N+1-layer_number,N:1]
    }
    else {
      FS2[N+1-layer_number,N:1] <- F1[N+1-layer_number,N:1]
      FS1[N+1-layer_number,N:1] <- F4[N+1-layer_number,N:1]
      FS4[N+1-layer_number,N:1] <- F6[N:1,layer_number]
      FS6[N:1,layer_number] <- F2[N+1-layer_number,N:1]
    }
    #update base matrixs#1
    F1 <- FS1
    F2 <- FS2
    F3 <- FS3
    F4 <- FS4
    F5 <- FS5
    F6 <- FS6
  }

  #======================================================================
  #Face#4, Rotate clockwise(Move=1) or counterclockwise(Move=2)
  if (Face_Direction ==4){
    if (layer_number==1){
      if (Move ==1){
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS4[i,j] <- F4[N+1-i,i]
            FS4[j,N+1-i] <- F4[i,j]
            FS4[N+1-i,N+1-i] <- F4[j,N+1-i]
            FS4[N+1-i,i] <- F4[N+1-i,N+1-i]
          }
        }
      }
      else {
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS4[i,j] <- F4[j,N+1-i]
            FS4[j,N+1-i] <- F4[N+1-i,N+1-i]
            FS4[N+1-i,N+1-i] <- F4[N+1-i,i]
            FS4[N+1-i,i] <- F4[i,j]
          }
        }
      }
    }
    #update other face#4 neighbors if move is 1
    if (Move==1){
      FS1[1:N,N+1-layer_number] <- F3[1:N,N+1-layer_number]
      FS5[1:N,N+1-layer_number] <- F1[1:N,N+1-layer_number]
      FS6[1:N,layer_number] <- F5[1:N,N+1-layer_number]
      FS3[N:1,N+1-layer_number] <- F6[1:N,layer_number]
    }
    else {
      FS1[1:N,N+1-layer_number] <- F5[1:N,N+1-layer_number]
      FS5[1:N,N+1-layer_number] <- F6[1:N,layer_number]
      FS6[1:N,layer_number] <- F3[1:N,N+1-layer_number]
      FS3[N:1,N+1-layer_number] <- F1[1:N,N+1-layer_number]
    }
    #update base matrixs#1
    F1 <- FS1
    F2 <- FS2
    F3 <- FS3
    F4 <- FS4
    F5 <- FS5
    F6 <- FS6
  }

  #======================================================================
  #Face#5, Rotate clockwise(Move=1) or counterclockwise(Move=2)
  if (Face_Direction ==5){
    if (layer_number==1){
      if (Move ==1){
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS5[i,j] <- F5[N+1-i,i]
            FS5[j,N+1-i] <- F5[i,j]
            FS5[N+1-i,N+1-i] <- F5[j,N+1-i]
            FS5[N+1-i,i] <- F5[N+1-i,N+1-i]
          }
        }
      }
      else {
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS5[i,j] <- F5[j,N+1-i]
            FS5[j,N+1-i] <- F5[N+1-i,N+1-i]
            FS5[N+1-i,N+1-i] <- F5[N+1-i,i]
            FS5[N+1-i,i] <- F5[i,j]
          }
        }
      }
    }
    #update other face#5 neighbors if move is 1
    if (Move==1){
      FS2[layer_number,1:N] <- F1[layer_number,1:N]
      FS6[N:1,layer_number] <- F2[layer_number,1:N]
      FS4[layer_number,N:1] <- F6[1:N,layer_number]
      FS1[layer_number,1:N] <- F4[layer_number,1:N]
    }
    else {
      FS2[layer_number,1:N] <- F6[1:N,layer_number]
      FS6[N:1,layer_number] <- F4[layer_number,1:N]
      FS4[layer_number,N:1] <- F1[layer_number,1:N]
      FS1[layer_number,1:N] <- F2[layer_number,1:N]
    }
    #update base matrixs#1
    F1 <- FS1
    F2 <- FS2
    F3 <- FS3
    F4 <- FS4
    F5 <- FS5
    F6 <- FS6
  }

  #======================================================================
  #Face#6, Rotate clockwise(Move=1) or counterclockwise(Move=2)
  if (Face_Direction ==6){
    if (layer_number==1){
      if (Move ==1){
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS6[i,j] <- F6[N+1-i,i]
            FS6[j,N+1-i] <- F6[i,j]
            FS6[N+1-i,N+1-i] <- F6[j,N+1-i]
            FS6[N+1-i,i] <- F6[N+1-i,N+1-i]
          }
        }
      }
      else {
        for (i in 1:floor(N/2)){
          for (j in i:(N-i)){
            FS6[i,j] <- F6[j,N+1-i]
            FS6[j,N+1-i] <- F6[N+1-i,N+1-i]
            FS6[N+1-i,N+1-i] <- F6[N+1-i,i]
            FS6[N+1-i,i] <- F6[i,j]
          }
        }
      }
    }
    #update other face#6 neighbors if move is 1
    if (Move==1){
      FS4[1:N,N+1-layer_number] <- F3[N+1-layer_number,N:1]
      FS5[layer_number,1:N] <- F4[1:N,N+1-layer_number]
      FS2[1:N,layer_number] <- F5[N:1,layer_number]
      FS3[N+1-layer_number,1:N] <- F2[1:N,layer_number]
    }
    else {
      FS4[1:N,N+1-layer_number] <- F5[N:1,layer_number]
      FS5[layer_number,1:N] <- F2[1:N,layer_number]
      FS2[1:N,layer_number] <- F3[N+1-layer_number,N:1]
      FS3[N+1-layer_number,1:N] <- F4[1:N,N+1-layer_number]
    }
    #update base matrixs#1
    F1 <- FS1
    F2 <- FS2
    F3 <- FS3
    F4 <- FS4
    F5 <- FS5
    F6 <- FS6
  }

}


par(mfrow=c(2,3))
plot(c(F1),xlim = c(1,N*N),ylim = c(1,6),xlab = "Matrix Index",ylab = "Colors Number",main = "Face#1")
lines(c(F1))
plot(c(F2),xlim = c(1,N*N),ylim = c(1,6),xlab = "Matrix Index",ylab = "Colors Number",main = "Face#2")
lines(c(F2))
plot(c(F3),xlim = c(1,N*N),ylim = c(1,6),xlab = "Matrix Index",ylab = "Colors Number",main = "Face#3")
lines(c(F3))
plot(c(F4),xlim = c(1,N*N),ylim = c(1,6),xlab = "Matrix Index",ylab = "Colors Number",main = "Face#4")
lines(c(F4))
plot(c(F5),xlim = c(1,N*N),ylim = c(1,6),xlab = "Matrix Index",ylab = "Colors Number",main = "Face#5")
lines(c(F5))
plot(c(F6),xlim = c(1,N*N),ylim = c(1,6),xlab = "Matrix Index",ylab = "Colors Number",main = "Face#6")
lines(c(F6))


par(mfrow=c(2,3))
image(t(F1),col=grey(seq(0, 1, length = 256)),xlab = "Column",ylab = "Row",main = "Face#1")
image(t(F2),col=grey(seq(0, 1, length = 256)),xlab = "Column",ylab = "Row",main = "Face#2")
image(t(F3),col=grey(seq(0, 1, length = 256)),xlab = "Column",ylab = "Row",main = "Face#3")
image(t(F4),col=grey(seq(0, 1, length = 256)),xlab = "Column",ylab = "Row",main = "Face#4")
image(t(F5),col=grey(seq(0, 1, length = 256)),xlab = "Column",ylab = "Row",main = "Face#5")
image(t(F6),col=grey(seq(0, 1, length = 256)),xlab = "Column",ylab = "Rowr",main = "Face#6")





