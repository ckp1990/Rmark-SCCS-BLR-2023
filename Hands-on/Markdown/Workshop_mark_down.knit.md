---
title: "My first notebook"
author: "Chandan Kumar Pandey"
date: "2023-10-12"
output:
  pdf_document: default
  html_document:
    df_print: paged
  word_document: default
bibliography: ref.bib
csl: museum-national-dhistoire-naturelle.csl  
---

# Activity uno

## Advantage of R Markdown

### Question 1:- Does the number of hours students study impact their grades?

#### Introduction

You can write your introduction here

#### Method (Hypothetical)

We conducted a survey in schools of Bangalore North Taluk to understand the impact of the number of hours of study on student final scores. Student's parents were interviewed during parent-teacher meetings (PTA) to collect data on number of hours the child. Further from the school records, we collected overall final grades. To assess the impact of study time and course taken on the overall grades, we fitted a linear regression model with the number of hours as the independent variable and number of courses enrolled in and marks are response variable;($marks=\beta_1*Number of course +\beta_2 * Hours study + \epsilon$), where $\epsilon~N(0,1)$ . All analyses were performed in R statistical software R version 4.1.2 (2021-11-01) (@R-base).

#### Results



A total of 100 student records were collected, with the number of courses students were enrolled in ranging between 3 and 8. Based on parents' interviews, on average, students studied for 4.08 hours per day (ranging from 0.1 to 7.96 per day). Further, the average mark scored was 24.42 in log scale, ranging from 5.61 to 55.3..


```r
model <- lm(Marks~number_courses+time_study,data = student_marks)
anova_table <- anova(model)%>%as.data.frame()%>%round(3)
model_summary <- summary(model)
summary_table <- model_summary$coefficients%>%as.data.frame()%>%round(3)
rownames(summary_table) <- c("Intercept","Courses enrolled-in","Per day hours of study")
```

In our model, the number of courses(1,283.298,***p\<0.005*** ) and study times (1,1246.281,***p\<0.005*** )were significant in explaining the student's grades in the final examination (**Table 1**). Overall, our model was able to explain 93.91% of the variation in the marks of students. With the increase in each course, the student average grades improved by -7.456(1.174). Similarly, each extra hour of study will increase the score by a factor of 1.864(0.202) (Table 2, Fig1)


```
## 
## Attaching package: 'kableExtra'
```

```
## The following object is masked from 'package:dplyr':
## 
##     group_rows
```

\begin{table}

\caption{\label{tab:tables1 in latex}Table1: Annova output of the model}
\centering
\resizebox{\linewidth}{!}{
\begin{tabular}[t]{lrrrrr}
\toprule
  & Df & Sum Sq & Mean Sq & F value & Pr(>F)\\
\midrule
\cellcolor{gray!6}{number\_courses} & \cellcolor{gray!6}{1} & \cellcolor{gray!6}{3538.880} & \cellcolor{gray!6}{3538.880} & \cellcolor{gray!6}{283.298} & \cellcolor{gray!6}{0}\\
time\_study & 1 & 15568.180 & 15568.180 & 1246.281 & 0\\
\cellcolor{gray!6}{Residuals} & \cellcolor{gray!6}{97} & \cellcolor{gray!6}{1211.696} & \cellcolor{gray!6}{12.492} & \cellcolor{gray!6}{NA} & \cellcolor{gray!6}{NA}\\
\bottomrule
\end{tabular}}
\end{table}



\begin{table}

\caption{\label{tab:addition table 2 latex}Table2: model summary}
\centering
\resizebox{\linewidth}{!}{
\begin{tabular}[t]{lrrrr}
\toprule
  & Estimate & Std. Error & t value & Pr(>|t|)\\
\midrule
\cellcolor{gray!6}{Intercept} & \cellcolor{gray!6}{-7.456} & \cellcolor{gray!6}{1.174} & \cellcolor{gray!6}{-6.349} & \cellcolor{gray!6}{0}\\
Courses enrolled-in & 1.864 & 0.202 & 9.243 & 0\\
\cellcolor{gray!6}{Per day hours of study} & \cellcolor{gray!6}{5.399} & \cellcolor{gray!6}{0.153} & \cellcolor{gray!6}{35.303} & \cellcolor{gray!6}{0}\\
\bottomrule
\end{tabular}}
\end{table}



![Student performace in relation to number of hours study and courses enrolled in](Workshop_mark_down_files/figure-latex/graphs-1.pdf) 

#### Discussion

1.  Our study align with results of @yu2011much and @borg1989case that with more study we can get good grades
2.  It was surprising that several courses also increased the overall mark. This may be due to the following reasons
    -   Generally, people who study more take more courses.
    -   The average of many subjects compensates for few bad results.

References:
