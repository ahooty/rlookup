
#An experiment to show how to implement a lookup in R like an Excel vlookup.

# =========================================================
# Create a reference table containing names and test scores

# This value [Names] creates a list of 30 names
Names<-c("ANES","GEORGE","CHRISTOPHER" ,"JESSICA","SAMANTHA","OSMAN","MICHAEL" ,"VANESSA","ALEXANDER","ISABELLE","MICHAEL","CHLOE","FEDJA","VIET-NHAN","LOUISE","PHU-THANH" ,"CELINA","JASON","KEVIN","VINCENT","AMY","KALLEM","KENNY","KEVIN","BRENT" ,"AMANDA","JARED","DAVID","FRED","ABBY"  )

# This value [TestScore] creates a random range of 30 test scores from 1 - 100
TestScore<-sample(1:100, 30, replace=TRUE)

# This creates a data frame by joining Names and TestScore into a table
students<-data.frame(Names,TestScore)

# =====================
# Create a lookup table

# This creates a range of numbers and grades on which to do a conditional lookup.
num<-c(0,9.9,19.9,29.9,39.9,49.9,59.9,69.9,79.9,89.9)
Labels<-c("0 to 9",
          "10 to 19",
          "20 to 29",
          "30 to 39",
          "40 to 49",
          "50 to 59",
          "60 to 69",
          "70 to 79",
          "80 to 89",
          "Up to and including 100")

grades<-c("Unsatisfactory",
          "Unsatisfactory",
          "Unsatisfactory",
          "Unsatisfactory",
          "Barely Acceptable",
          "Acceptable",
          "Good",
          "Very Good",
          "Excellent",
          "Outstanding")

lookup<-data.frame(num,Labels,grades)

# =====================================================================

# This uses the 'cut' function to use the lookup table to create values which corresponds to the grades in the students table
Grade<-cut(students$TestScore,c(lookup$num,100),lookup$grades)
Range<-cut(students$TestScore,c(lookup$num,100),lookup$Labels)

# The Range and Grade values are joined to the students table using 'cbind'.
Results<-cbind(students,Range,Grade)

# View the results
View(Results)
