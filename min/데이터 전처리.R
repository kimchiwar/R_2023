#install.packages("data.table")
#install.packages('mice')
#install.packages('dplyr')

library(data.table)
setwd("/Users/song-ginam/Desktop/재난안전프로그래밍 임시폴더")

hn_2009 <- fread('실습데이터/a.csv')
hn_2010 <- fread('실습데이터/b.csv')
hn_2011 <- fread('실습데이터/c.csv')

combined_df <- rbindlist(list(hn_2009, hn_2010, hn_2011), fill=TRUE)
#fill=True 누락된 변수 처리 
dim(combined_df)

col = colnames(hn_2009)
col_2009 <- combined_df[, col, with = FALSE] #2009년 데이터만 가져옴

df<- combined_df

df_clean<-na.omit(df) #모든결측치 제거

df_numeric <- df[,sapply(df,is.numeric),with=FALSE] #수치형 데이터인 변수만 분리
df_character <- df[,sapply(df,is.character),with=FALSE] #문자형 데이터인 변수만 분리
dim(df_numeric)
dim(df_character)

#결측값 처리 
sub_df_numeric = df_numeric[,1:8]
df_numeric =df_numeric[,1:8]
library(mice)

imputed_data <- mice(df_numeric, m=5, maxit=10, method="pmm", seed=1235)
completed_data <- complete(imputed_data,1) #1번째 데이터를 사용
#저장
fwrite(completed_data,'실습데이터/test.csv')

#데이터 변환 쉽게 하도록
df = fread('실습데이터/earlyadopter.csv')
library(dplyr)

#~ifelse : ~ifelse(범위값, 범위에 해당되는 값에 대한 변환 값, 변환하고 싶은 대상) → 하나의 조건에 대해서만 처리
#mutate(데이터, across(c("변수명1","변수명2","변수명3"), ~ifelse(범위값, 변환값, 변환대상))) mutate(a, across(c("X20s","X30s","X40s","X50s","X60s"), ~ifelse(. > 6.0, "High", .)))
mutate(df, across(c("X20s","X30s","X40s","X50s","X60s"), ~ifelse(. > 6.0, "High", .)))# .은 모든 것에 적용

# ~case_when : ~case_when(범위값 ~ 변환값, TRUE ~ 변환하고 싶은 대상) 1로 바꾸겠다        2로         3으로   모든값에 적용
mutate(a, across(c("X30s","X40s","X50s","X60s"), ~case_when(. >= 6.0 ~ 1, . >= 2.5 & . < 6.0 ~ 2, . < 2.5 ~ 3, TRUE ~ .)))
mutate(a, across(c("X20s","X30s","X40s","X50s","X60s"), ~case_when(. >= 6.0 ~ "High", . >= 2.5 & . < 6.0 ~ "Medium", . < 2.5 ~ "Low", TRUE ~ as.character(.) #
