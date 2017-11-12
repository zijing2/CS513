# 2.1 Create the following x and y vectors:
#  x = 1, 2, 3
#  y = 11, 12, 13, 14, 15, 16
x<-c(1,2,3)
y<-c(11,12,13,14,15,16)
  
# 2.2 Calculate and display z=x+y.
z<-x+y

# 2.3   Explain the results.
z

# 2.4 Create a vector of your last name.
last_name<-"Zijing"

# 2.5 Create a vector of your first name.
first_name<-"Huang"

# 2.6 Create a vector of your student ID.
student_id<-10414952

# 2.7 What are the length and data type of the "last name" vector? Why?
# length is 1 and data type is character. Becasue there is one element and it is character.
length(last_name)
mode(last_name)

# 2.8 Combine your first name, last name and student id into a single vector (“myinfo”).
myinfo<-c(last_name, first_name, student_id)

# 2.9 Display "myinfo" in the Console.
myinfo

# 2.10 What are the length and data type of "myinfo"?
length(myinfo)
mode(myinfo)

# 2.11 Remove the "first_name" object.
rm("first_name")

# 2.12 Display "myinfo" in the Console again.
myinfo

# 2.13 Create a dataframe "roster" using the following table:
# First		 Last 		 ID
# fname1   lname1    1111
# fname2   lname2    2222
roster<-data.frame(First=c("fname1,fname2"),Last=c("lname1","lname2"),ID=c(1111,2222))

# 2.14 View the “roster”.
View(roster)

# 2.15 Remove all the objects in your session.
rm(list=ls())




