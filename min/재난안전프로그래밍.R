a=c(1,2,3,4,5,6)

sum(c(1,2,3,4,5,6,7,8,9,10))


seq(from =1, to=5,by=2)  #1부터 5까지 2개씩 증가
seq(1,5,by=2)

seq(0,1,length.out=1000) #0 ~ 1 까지 1000개 생성

rep(c(1,2,3),times=2) # 1,2,3을 두 번 반복하는 vector
                       #123 123

rep(c(1,2,3),each=2)#1,2,3 개별원소를 두 번 반복하는 vector
                    #11 22 33

a='송기남'
b='123'
print(paste('ㅎㅇ',a,b)) #ㅎㅇ 송기남 123
print(paste0("ㅎㅇ",a,b))#구분문자가 사라짐 ex)ㅎㅇ송기남123
paste('ㅎㅇ',a,b,sep="-") # sep은 구분자 정하기 ex)ㅎㅇ-송기남-123
paste('ㅎㅇ',a,b,sep="-") #ㅎㅇ-송기남-123

x = 1:100
head(x)
head(x,n=7) #처음부터 7까지
tail(x)
tail(x,n=7)

#랜덤 추출 sample(x, size, replace = False, pred = NULL) #replace = 복원여부 pred = 각원소별 추출확률
sample(10,3,prob=(1:10)/55)#각원소에 55를 나눠 확률을 조정한다 즉 10이 가장 확률이 높다
#sample(10,3,prob=c(0.1,0.2,0.3...)) #각 원소에 따로 값을 입력가능

runif(n,min,max) #min ~ max 까지의 균일 분포에서 n개의 연속형 난수 생성
runif(10,1,100)
rnorm(n,평균,sd) #주어진 평균과 표준편차 sd를 갖는 정규분포에서 n개의 난수 생성
rbinom(n,size,prob) #주어진 시행 횟수와 성공 가능성 prob를 사용하여 이항 분포 에서 n개의 난수생성
rbinom(50,200,0.5)  #ex)1/2 확률을 200명에게 50번을 시행했을 때 결과값

a=0
rm(a) #a 변수 삭제 

getwd() #현재 디랙토리 위치
#setwd("\Users\song-ginam\Desktop\") #내가 찾을 디렉토리 혹은 폴더 첫글자 쓰고 tap키를 누르면 목록이 나옴

#문제1 1~100까지 5씩 증가하는 값 생성
seq(1,100,5)
#문제2 1,2,3,4,5의 벡터값을 만들어 이를 100번 반복하는 벡터 만들기
rep(c(1,2,3,4,5),time=100)
#문제3 1,2,3,4,5 각각 100번 반복
rep(c(1,2,3,4,5),each=100)

sample(10,5)
sample(1:49,6)
sample(10,3)
sample(10,3,prob=(1:10)/55)

rbinom(1,500,0.1)#감염확률이 10%인 질병에 500명 중 몇 명이 걸릴지

List <- list(1,2,3)
List
List <- list(1.2,3.5,2.4)
List

char_vector <- c(1,2,3,"arm",TRUE)
typeof(char_vector[1])

List <- list(1,2,3)
List
typeof(List[1])

#list는 값을 보관하는 주머니이기때문에 더할수 없다 vector는 값그자채이기때문에 가능하다
List_1 <-list(1.6, 2.3, 3.5) 
List_2 <-list(2.6, 5.3, 7.5) 
List_1+List_2
Vector_1 <-c(1.6, 2.3, 3.5)
Vector_2 <-c(2.6, 5.3, 7.5) 
Vector_1+Vector_2
#__________________________________________________________10/16일__________________________________________________________
#데이터 프레임(리스트의 모음)

data <- c("A","B","C","B","A")
frequency_table <- table(data)
print(frequency_table)
frequency_table[1]

id<- c(1:5)
gender<- c("M","F","F","M","M")
major<- c("Eng","Math","Com","Eng","Busi")
salary<-c(2500,2800,2500,3000,2600)
survey<- data.frame(ID=id, Gender=gender, Major=major, Salary=salary, stringsAsFactors = FALSE)
survey
head(survey,n=3)
tail(survey,n=3)
survey$Salary      # 벡터구조로 추출
survey[["Salary"]] # 동일

survey$score=c(200,300,400,500,600) # scroe라는 행추가
survey$ss = survey$Salary+survey$score
survey

summary(survey) #데이터 프레임 변수 요약
survey$ID = as.character(survey$ID)

names(survey)
names(survey)[names(survey) == "ss"] = "sum" #항목 이름 변경

survey[c(1,2)] #1,2번 째 열 가져오기
survey[c(-1,-2)]#제외하고 가져오기
survey[survey$Gender == "F",] #gender 카 F인 것만 가져온다
survey[survey$Gender == "M"|survey$score>300,] # |연산과 &연산 사용가능

survey2 <- survey[survey$Gender=="M",] #값 추출하기
survey1 <- survey[survey$Gender!="M",] #값 추출하기
survey1
survey2
rbind(survey1,survey2)

a <-subset(survey,survey$ID >2,select = c("Gender","Major","Salary")) #값추출하기
a

survey$sum <- NULL #변수삭제
survey

name_age_df <- data.frame(
  Name = c("Kim Cheol-soo", "Lee Cheol-soo", "Kim Young-hee","Lee Young-hee",
           "Kim Min-jun", "Park Min-jun", "Kim Ji-young", "Park Ji-young"),
  Age = c(20,24,21,24,35,40,34,35),stringsAsFactors = FALSE)
name_age_df
d = separate(name_age_df, col= "Name",into = c("Lastname","Firstname"),sep = "-") #데이터를 나누는 방법
d

data <- read.csv("/Applications/yes.csv",header=TRUE,stringsAsFactors = FALSE,fileEncoding = "CP949")
data
write.csv(survey, "/Users/song-ginam/survey.csv",row.names = FALSE)
write.csv(survey, "/Users/song-ginam/survey_row.csv",row.names = TRUE)


vec <- c(0,1,2,3,4,5,6,7,8,9,10)
vec2 <- c(10,11,12,13,14,15,16,17,18,19,20)
matr <- cbind(vec,vec2)
matr[4,2] <- 100
matr
vec3 <- c(20,21,22,23,24,25,26,27,28,29,30)
vec <- array(vec,dim=c(5,2))
vec2 <- array(vec2,dim=c(5,2))
vec3 <- array(vec3,dim=c(5,2))
vec3 <- array(vec3,dim=c(5,2))

sorce <- data.frame(
  '이름' = c('Kim','Park','Lee'),
  '국어' = c(100,80,80),
  '영어' = c(60,40,80),
  '수학' = c(50,100,80),
  '물리' = c(40,30,20),
  '화학' = c(40,30,20),
  '생물' = c(40,20,10),
  '지구과학' = c(40,30,50)
)
sorce
sorce$mean <- (sorce$국어 + sorce$영어 + sorce$수학)/3
sorce
print(sorce[sorce$mean>=80,])

hos = data.frame(
  병원 = c('A','B','B','B','B','A','A','A','A','A','B','B'),
  진료금액 = c(5000,12000,13000,8000,9000,3000,5000,4000,4500,6000,8000,8500),
  처방전금액 = c(2500,5000,6000,5500,7000,4600,3000,2500,3400,4700,6400,4400)
)
sum = hos$진료금액 + hos$처방전금액
hos$sum = sum
#row.names를 TURE로 하면 앞의 숫자(몇번째 행인지)를 출력
write.csv(hos,'/Users/song-ginam/Desktop/재난안전프로그래밍 임시폴더/hospital.csv',row.names = FALSE,fileEncoding = 'UTF-8')
#header가 TRUE면 변수명도 저장
hospital <- read.csv('/Users/song-ginam/Desktop/재난안전프로그래밍 임시폴더/hospital.csv',stringsAsFactors = FALSE)
hospital


mtcars
car = data.frame(
  mpg = c(mtcars$mpg),
  cyl = c(mtcars$cyl),
  disp = c(mtcars$disp),
  wt = c(mtcars$wt),
  qsec = c(mtcars$qsec)
)

car$qw = car$wt + car$qsec

car$total_cat = sum(car[,])
car

typeof(car$qw)
summary(car) #평균 등 여러 값들

data= subset(hos,hos$진료금액>=8000 & hos$sum>15000 ,select = c(진료금액,병원)  )
data



#1
car <-data.frame(subset(mtcars,select = c(mpg,cyl,disp,wt,qsec)))

#data(mtcars)
#car = subset(mtcars,select = c(mpg,cyl,disp,wt,qsec) )

#car = data.frame(mpg = c(mtcars['mpg']), cyl = c(mtcars['cyl']),disp = c(mtcars['disp']),wt = c(mtcars['wt']),qesc = c(mtcars['qsec']))
#2

car$qw = car$wt+car$qsec
car

#3
str(car)
mode(car$mpg)

#4
install.packages('dplyr')
library(dplyr)
summary.data.frame(car)

#5
car$total_car <-rowSums(mtcars)
car

#6
car$car_name <- rownames(mtcars)
car

#7
car$car_model <- paste(car$car_name,car$total_car,sep ='-')
car

#8
install.packages('tidyr')
library(tidyr)
c = separate(car,col = 'car_model', into = c('car','model'),sep ='-')
#9
subset(c, c$mpg>20 & c$disp>=160, select = c(mpg,disp,car,model))#,car,model


