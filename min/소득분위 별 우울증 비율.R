#맥 폰트 문제
#install.packages("extrafont")
library(extrafont)
font_import()
#library(ggplot2)
#theme_set(theme_grey(base_family="AppleGothic"))

setwd("/Users/song-ginam/Desktop/재난안전프로그래밍 임시폴더")

df = read.csv('건강조사 데이터/HN_19~21.csv')

#우울증여부, 소득분위(5분위) 가져오기
df_s = subset(df,select = c('DF2_pr','ho_incm5'))

#결측치 0(우울증없음)
df_s[is.na(df_s)]<-0

# 소득분위별로 구분
ho1 = subset(df_s,df_s$ho_incm5 == "1",select = c('DF2_pr','ho_incm5'))
ho2= subset(df_s,df_s$ho_incm5 == "2",select = c('DF2_pr','ho_incm5'))
ho3= subset(df_s,df_s$ho_incm5 == "3",select = c('DF2_pr','ho_incm5'))
ho4= subset(df_s,df_s$ho_incm5 == "4",select = c('DF2_pr','ho_incm5'))
ho5= subset(df_s,df_s$ho_incm5 == "5",select = c('DF2_pr','ho_incm5'))

#소득분위 별 우울증 환자수
incm_1 = nrow(subset(ho1,ho1$DF2_pr==1))
incm_2 = nrow(subset(ho2,ho2$DF2_pr==1))
incm_3 = nrow(subset(ho3,ho3$DF2_pr==1))
incm_4 = nrow(subset(ho4,ho4$DF2_pr==1))
incm_5 = nrow(subset(ho5,ho5$DF2_pr==1))

#소득분위 별 우울증 환자 비율(1000명)
incm_1_c = incm_1*(1000/nrow(ho1))
incm_2_c = incm_2*(1000/nrow(ho2))
incm_3_c = incm_3*(1000/nrow(ho3))
incm_4_c = incm_4*(1000/nrow(ho4))
incm_5_c = incm_5*(1000/nrow(ho5))

library(ggplot2)

#소득분위(5분위)
incm <- c('1분위','2분위','3분위','4분위','5분위')
#소득분위 별 우울증 환자 비율
pr <- c(incm_1_c,incm_2_c,incm_3_c,incm_4_c,incm_5_c)

df <- data.frame(소득분위 = incm,pr = pr)

#바, 선점도 차트
ggplot(df, aes(x = incm, y = pr, fill = 소득분위)) + geom_bar(stat = "identity") +
  labs(title = "소득분위별 우울증 비율(1000명 단위)") + xlab("소득분위") +
  geom_point(color = "skyblue", size = 3) +
  geom_line(aes(group = 1), color = "skyblue") +
  ylab("우울증환자") 




ggplot(df, aes(x = reorder(incm, pr), y = pr)) +
  geom_point(color = "skyblue", size = 3) +
  geom_line(aes(group = 1), color = "skyblue") +
  labs(title = '소득분위 별 우울증 비율',
       x = "소득분위",
       y = "우울증환자") +
  theme_minimal()
y





지역 = c("서울", "부산", "대구", "인천", "광주", "대전", "울산", "세종",
       "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주")

인구 = c(Seoul_all, Busan_all, Daegu_all, Incheon_all, Gwangju_all, Deajeon_all, Ulsan_all,
       Sejong_all, Gyeonggi_all, Gangwon_all, Chungbuk_all, Chungnam_all, Jeonbuk_all,
       Jeonnam_all, Gyeongbuk_all, Gyeongnam_all, Jeju_all)

우울증율 = c(Seoul_c, Busan_c, Daegu_c, Incheon_c, Gwangju_c, Daejeon_c, Ulsan_c, Sejong_c,
         Gyeonggi_c, Gangwon_c, Chungbuk_c, Chungnam_c, Jeonbuk_c, Jeonnam_c, Gyeongbuk_c,
         Gyeongnam_c, Jeju_c)




library(ggplot2)


# 그래프를 그리기 위한 데이터 프레임 생성
plot_data <- data.frame(지역 = factor(지역, levels = 지역),
                        인구 = 인구,
                        우울증율 = 우울증율)

# 그래프 1: 지역별 인구 점 그래프
plot1 <- ggplot(plot_data, aes(x = reorder(지역, 인구), y = 인구)) +
  geom_point(color = "skyblue", size = 3) +
  geom_line(aes(group = 1), color = "skyblue") +
  labs(title = "지역별 인구",
       x = "지역",
       y = "인구") +
  theme_minimal()

# 그래프 2: 지역별 1000명당 우울증 환자 수 점 그래프
plot2 <- ggplot(plot_data, aes(x = reorder(지역, 인구), y = 우울증율)) +
  geom_point(color = "salmon", size = 3) +
  geom_line(aes(group = 1), color = "salmon") +
  labs(title = "지역별 1000명당 우울증 환자 수",
       x = "지역",
       y = "우울증 환자 수 (1000명당)") +
  theme_minimal()


library(gridExtra)

grid.arrange(plot1, plot2, ncol = 1)






