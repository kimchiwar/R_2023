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


