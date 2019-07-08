#주말 과제2
2. my_split() 함수 구현해라 
대신, str 내용 중 ch를 기준으로 분리해서 리스트에 저장 후 리턴해라. def my_split(str, ch) 


def my_split(str1, ch):

    if b in a:
        c = a.index(b)
        d = a[ : c] + '\n' +a[c : ]
        e = list(d)
    else:
        print("error")
    return e 


a = input('문장을 입력하세요: ')
b = input('단어를 입력하세요: ')
f = my_split(a, b)


print(f)


결과
문장을 입력하세요: 아들아 너는 계획이 있구나
단어를 입력하세요: 계획
['아', '들', '아', ' ', '너', '는', ' ', '\n', '계', '획', '이', ' ', '있', '구', '나']
