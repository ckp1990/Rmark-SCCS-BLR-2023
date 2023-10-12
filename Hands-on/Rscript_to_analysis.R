library(dplyr,warn.conflicts = F)
##loading the data set into the R
## Enter the Student marks

student_marks<-read.csv("./Resource material/Data/Student_Marks.csv",header = T) 
range_study <- range(student_marks$time_study)%>%round(2)
range_marks <- range(student_marks$Marks)%>%round(2)

model <- lm(Marks~number_courses+time_study,data = student_marks)
anova_table <- anova(model)%>%as.data.frame()%>%round(3)
model_summary <- summary(model)
summary_table <- model_summary$coefficients%>%as.data.frame()%>%round(3)
rownames(summary_table) <- c("Intercept","Courses enrolled-in","Per day hours of study")

library(ggplot2,warn.conflicts = F)
predicted_value<-predict.lm(model,interval = "confidence")%>%as.data.frame()
student_marks<-cbind(student_marks,predicted_value)
plot <- ggplot(data = student_marks, aes(x=time_study,y=Marks,col=as.factor(number_courses)))
plot+geom_point()+
  geom_line(aes(y=fit))+
  geom_ribbon(aes(ymin=lwr,ymax=upr),alpha=0.05)+
  theme_bw()+
  labs(
    x="Study hours per day",
    y="Marks scored"
  )

