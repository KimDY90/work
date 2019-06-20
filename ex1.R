library(dplyr)
library(ggplot2)
library(readxl)
library(foreign)



# 대전 CCTV
police <- read.csv("C:/Users/CPB06GameN/Desktop/daejeon/police.csv")
str(police)
dim(police)
View(police)
table(police)

police <- select(police, "시군구명", "도로노선명", "단속구분", "제한속도")

# 시군구명
table(police$시군구명)
summary(police$시군구명)
qplot(police$시군구명)
count(police$시군구명)

20 + 16 + 32 + 47 + 18


# 제한속도
table(police$제한속도)
mean(police$제한속도)
summary(police$제한속도)

gu_limit <- select(police, 시군구명, 제한속도)
View(gu_limit)

ggplot(data = gu_limit, aes(x = 시군구명, y = 제한속도)) + geom_point(color = "blue") + DJIS

table(gu_limit)

count <- count(gu_limit, 시군구명)

View(count)

count <- rename(count, "설치갯수" = "n")
ggplot(data = count, aes(x= 시군구명, y = 설치갯수)) + geom_col()

View(gu_limit)


ggplot(data = gu_limit, aes(x = 시군구명, y = 제한속도)) +
  geom_point(color = "blue") +z
  geom_hline(yintercept = mean(gu_limit$제한속도))

CCTV_ans <- select(police, "시군구명", "설치년도") 
str(CCTV_ans)
dim(CCTV_ans)
View(CCTV_ans)

one <- table(CCTV_ans$시군구명) %>%
View(CCTV_ans)




# 연도별 구내 CCTV설치율
DD <- filter(CCTV_ans, 시군구명 == "대덕구") 
DJ <- filter(CCTV_ans, 시군구명 == "중구")
DD2 <- filter(CCTV_ans, 시군구명 == "동구")
DS <- filter(CCTV_ans, 시군구명 == "서구")
DU <- filter(CCTV_ans, 시군구명 == "유성구")

table(DD)
table(DD)
table(DJ)
table(DS)
table(DU)
table(DD2)

DD <- mutate(count(DD, 설치년도))
DS <- mutate(count(DS, 설치년도))
DJ <- mutate(count(DJ, 설치년도))
DU <- mutate(count(DU, 설치년도))
DD2 <- mutate(count(DD2, 설치년도))

View(DD)
View(DD2)
View(DU)
View(DS)
View(DJ)

str(DJ) 
DD <- rename(DD, "대덕구" = n) # 누락연도 : 12, 15, 16년
DD2 <- rename(DD2, "동구" = n) # 누락연도 : 12, 15, 16, 17년
DU <- rename(DU, "유성구" = n) # 누락연도 : 15년
DS <- rename(DS, "서구" = n) # 누락연도 : 12, 15 ,16년 
DJ <- rename(DJ, "중구" = n) # 누락연도 : 12, 15, 16, 18년

# 로가 동일한 DD와 DS 병합
DDS <- left_join(DD, DS, by = "설치년도") 
DDS

# rbind()함수: 행 추가하는 함수
# 1. C()로 변수를 만든다
"설치년도" <- c(2012, 2015, 2016)
"대덕구" <- c(0, 0, 0)
"서구" <- c(0, 0, 0)

# 2. 데이터프레임 생성
DDS2 <- data.frame(설치년도, 
                   대덕구, 
                   서구)
DDS2
View(DDS2)

# rbind()로 병합
DDS3 <- rbind(DDS, DDS2)
View(DDS3)
str(DDS3)

# 유성구와 병합
D1 <- left_join(DDS3, DU, by = "설치년도") 
D1

arrange(D1, 설치년도)

"설치년도" <- c(2012, 2015, 2016, 2017)
"동구" <- c(0, 0, 0, 0)


DDS4 <- data.frame(설치년도, 동구)
DDS4

DDS5 <- rbind(DD2, DDS4)
DDS5

"설치년도" <- c(2012, 2015, 2016, 2018)
"중구" <- c(0, 0, 0, 0)

DDS6 <- data.frame(설치년도, 중구)
DDS6

DDS7<- rbind(DJ, DDS6)
DDS7

SS <- left_join(D1, DDS5, by = "설치년도") 
SS


SSS <- left_join(SS, DDS7, by = "설치년도") 
SSS

D2 <- arrange(SSS, 설치년도)
D2
D2$유성구 <- ifelse(is.na(D2$유성구), 0, D2$유성구)
D2$유성구
View(D2)
D2

ggplot(data = D2, aes(x = 설치년도, y= 대덕구)) + geom_line()+ geom_point()
ggplot(data = D2, aes(x = 설치년도, y= 동구)) + geom_line() + geom_point()
ggplot(data = D2, aes(x = 설치년도, y= 유성구)) + geom_line()+ geom_point()
ggplot(data = D2, aes(x = 설치년도, y= 서구)) + geom_line()+ geom_point()
ggplot(data = D2, aes(x = 설치년도, y= 중구)) + geom_line()+ geom_point()


install.packages('reshape2')
library(reshape2)


View(D3)
w <- summary(D2)
qplot(w)
ggplot(data = w, aes(x= 설치년도, y = ) )



# 평균 제한속도
View(gu_limit)
U <- gu_limit %>% filter(시군구명 == "유성구")
U
"유성구" <- mean(U$제한속도)  ## 65.31915

DJD <- gu_limit %>% filter(시군구명 == "대덕구")
"대덕구" <- mean(DJD$제한속도) ## 62

DJD2 <-gu_limit %>% filter(시군구명 == "동구")
"동구" <- mean(DJD2$제한속도) ## 60

S <-gu_limit %>% filter(시군구명 == "서구")
"서구" <- mean(S$제한속도) ## 55.9375

J <- gu_limit %>% filter(시군구명 == "중구")  
"중구" <- mean(J$제한속도) ## 58.88889

DJIS <- data.frame( 대덕구, 동구, 서구, 유성구, 중구)
DJIS 
qplot(DJIS)

ggplot(data = DJIS, aes(x = 대덕구)) + geom_bar()


row.names.data.frame(data = DJIS)
