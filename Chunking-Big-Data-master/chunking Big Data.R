#provide a connection to the base data
con = file("C:/Users/FARSHID/Desktop/train.csv", "r")
s <- read.csv(con, nrows=6)
actualColumnNames <- names(s)
#Remember to close the connection
close(con)
#define the chunk size
chunkSize<- 30000000

#chunk 1
#connect to the base data
con = file("C:/Users/FARSHID/Desktop/train.csv", "r")
#chose the first chunk and add to the s1 matrix, take the skip into account, here the s1 will not have header so add it through col.name
s1<- read.csv(con,skip = 0, nrows=chunkSize
              ,col.names=actualColumnNames)
#Remember to close the connection every time that you open one!
close(con)
write.csv(s1,"C:/Users/FARSHID/Desktop/s1.csv",row.names = F)
#remove the base data
rm(s1)
#print that the first chunk is done!
print(paste('chunk1 done:', chunkSize))

#repeat the same procedure for the rest of data, take the skip into account
#chunk 2
con = file("C:/Users/FARSHID/Desktop/train.csv", "r")
s2<- read.csv(con,skip = 1*chunkSize, nrows=chunkSize
              ,col.names=actualColumnNames)
close(con)
write.csv(s2,"C:/Users/FARSHID/Desktop/s2.csv",row.names = F)
rm(s2)
print(paste('chunk2 done:', chunkSize))
#...
#chunk 3
con = file("C:/Users/FARSHID/Desktop/train.csv", "r")
s3<- read.csv(con,skip = 2*chunkSize, nrows=chunkSize
              ,col.names=actualColumnNames)
close(con)
write.csv(s3,"C:/Users/FARSHID/Desktop/s3.csv",row.names = F)
rm(s3)
print(paste('chunk3 done', chunkSize))
#...
#chunk 4
con = file("C:/Users/FARSHID/Desktop/train.csv", "r")
s4<- read.csv(con,skip = 3*chunkSize, nrows=chunkSize
              ,col.names=actualColumnNames)
close(con)
write.csv(s4,"C:/Users/FARSHID/Desktop/s4.csv",row.names = F)
rm(s4)
print(paste('chunk4 done', chunkSize))
#...
#chunk 5
con = file("C:/Users/FARSHID/Desktop/train.csv", "r")
s5<- read.csv(con,skip = 4*chunkSize, nrows=chunkSize
              ,col.names=actualColumnNames)
close(con)
write.csv(s5,"C:/Users/FARSHID/Desktop/s5.csv",row.names = F)
rm(s5)
print(paste('chunk5 done', chunkSize))
#...
#chunk 6
con = file("C:/Users/FARSHID/Desktop/train.csv", "r")
s6<- read.csv(con,skip = 5*chunkSize, nrows=chunkSize
              ,col.names=actualColumnNames)
close(con)
write.csv(s6,"C:/Users/FARSHID/Desktop/s6.csv",row.names = F)
rm(s6)
print(paste('chunk6 done', chunkSize))
