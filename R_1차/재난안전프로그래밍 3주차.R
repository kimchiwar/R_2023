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
#벡터는 1차원 행렬의 데이터 구조이다
Vector_1 <-c(1.6, 2.3, 3.5)
Vector_2 <-c(2.6, 5.3, 7.5) 
Vector_1+Vector_2

#행렬은 2차원의 데이터만을 표현가능하다
matrix(data = c(1,2,3,4,5,6), nrow =2, ncol =3) #2행 3열
#인자 byrow는 데이터를 어느 방향으로 넣을지 기본: False
a = matrix(c(1,2,3,4,5,6),nrow=2,byrow = TRUE)
a
rc1 <-c(2,4,5,6)
rc2 <-c(7,8,9,10)
cmatrix <- cbind(rc1,rc2)#열결합
rmatrix <- rbind(rc1,rc2)#행결합
cmatrix
rmatrix

행과 열에 이름을 붙이는 법
m = matrix(c(1,2,3,4),nrow=2)
#첫번째 방법
rownames(m) = c("Row1", "Row2")
colnames(m) = c("Col1", "Col2")
m
#두번째 방법
row_names <- c("Row1", "Row2")
col_names <- c("Col1", "Col2")
dimnames(m) =list(row_names, col_names)
m

matrix(data = c(1,2,3,4,5,6),nrow=2,ncol=3)
array(data = c(1,2,3,4,5,6),dim = c(2,3)) #행렬은 다차원으로 표현 가능하다 dim 인자를 사용하여 차원 표시 

array(data = c(1,2,3,4,5,6),dim = c(2,2,2))

#배열 연산
a = array(data = c(1,2,3,4,5,6),dim=c(2,2))
b = array(data = c(1,2,3,4,5,6),dim=c(2,2))
a_c<-cbind(a,b)
a_r<-rbind(a,b)

#차원별 이름부여
my_array <- array(1:12, dim = c(2,3,2)) #1~12까지 생성

row_names <- c("Row1","Row2")
col_names <- c("Col1","Col2","Col3")
slice_names <- c("Slice1","Slice2")

dimnames(my_array) <- list(row_names,col_names,slice_names)
my_array
#이름을 붙이고 싶지않은 경우
dimnames(my_array) <- list(NULL,col_names,slice_names)

#인덱싱 특정값을 추출하기 위한 인덱스를 지정하는 과정
a = "abcdef"
a = list(1,2,3,4,5,6,7)
a[2] #list형
a[[2]] #double 형

a = c(1,2,3,4,5,6,7)
a[2] 
a[[2]]

a = array(data = c(1,2,3,4,5,6),dim = c(2,3,2))
a
a[1,2,1]
a[[1]]

my_list <- list("apple",3.14,c(1,2,3),TRUE)
my_list[[3]][2]
my_list[3]    #list 형
my_list[[3]]  #data 타입

my_vec <- c("apple", 3.14,c(1,2,3),TRUE)
my_vec[[3]][2]#벡터 안에 있는 벡터는 그냥 똑같은 벡터이기 때문에 2값을 뽑고 싶으면[4]를 써야함
my_vec[3]
my_vec[[3]] 

my_array <- array(c(5,3,1,5,7,8,10),dim = c(2,3))
my_array
my_array[1,2]
my_array[2,1]
my_array[1,]
my_array[,2]

arr <- array(c(1:20),dim = c(2,5,2))
arr[1,3,1]
arr[2,3,2]

city <- c("Seoul", "Busan", "Daegu", "Seoul", "Busan", "Daegu", "Ulsan")
pm25 <- c(18, 21, 21, 17, 8, 11, 25)

df <- data.frame(city = city, pm25 = pm25)
df$city # == df[["city"]]
df$city[1:3]

#문제 1~7
vec1 <- c("A","B","B","B","B","A","A","A","A","A","B","B")
vec1
vec2 <- c(5000,12000,13000,8000,9000,3000,5000,4000,4500,6000,8000,8500)
vec2
vec3 <- c(2500,5000,6000,5500,7000,4600,3000,2500,3400,4700,6400,4400)
vec3

vec <- c(1:32)
matr <- matrix(vec,nrow = 4)
matr

arr <- array(vec,dim=(c(2,4,2,2)))
arr
arr[2,2,1,2]
arr[2,3,2,2]
arr

arr[,,1,2]
arr[,,1,1]
a = arr[,,1,2]+arr[,,1,1]
a

arr1 <- array(c(1:12),dim=c(4,3))
arr2 <- array(c(13:24),dim = c(4,3))
c_ <- cbind(arr1,arr2)
r_ <- rbind(arr1,arr2)
rname <- c("id","pw","em")
cname <- c(1:8)
dimnames(r_) = list(cname,rname)
r_

df = data.frame(vec1,vec2,vec3)
