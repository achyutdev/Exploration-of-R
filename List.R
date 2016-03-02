###########
### List 

student.name <- c("Devid","Dev","Achyut")
student.weight <- c(60.5,74.3,45.9)
student.gender <- factor(c("Male","Male","Female"))
student.physics.marks <- c(70L,83L,86L)
student.chemistry.marks <- c(79L,93L,76L)

#unnamed list
student1 <- list(student.name[1],student.weight[1],student.gender[1],student.physics.marks[1],student.chemistry.marks[1])
str(student1)
student1

#_____________ operation
student1[1]
typeof(student1[1]) #return list
student1[[1]]
typeof(student1[[1]])#return characters type
student1[1:3]


#named list
student1 <- list(
  names=student.name[1],
  weight=student.weight[1],
  gender=student.gender[1],
  physics=student.physics.marks[1],
  chemistry=student.chemistry.marks[1]
)

str(student1)
student1

#__________Operation
student1[["names"]]
student1$gender
student1[c("physics","chemistry")]
length(student1)



#vector in list
student1 <- list(
  names=student.name[1],
  weight=student.weight[1],
  gender=student.gender[1],
  marks=c(student.physics.marks[1],student.chemistry.marks[1])
)
str(student1)
student1