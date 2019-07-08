#주말 과제2
2. my_split() 함수 구현해라 
대신, str 내용을 ch를 기준으로 분리한 뒤 리스트에 저장 후 리턴해라. def my_split(str, ch) 


def my_split(str1, ch):

    while b in a:
        c = a.index(b)
        h = len(b)
        d = a[ : c] + ' ' +a[(c+h) : ]
        e = [d]
        break
    return e 


a = input('문장을 입력하세요: ')
b = input('단어를 입력하세요: ')
f = my_split(a, b)


print(f)


결과
문장을 입력하세요: 아들아 너는 계획이 있구나
단어를 입력하세요: 계획이
['아들아 너는   있구나']


def my_max(number1, number2):##a와 b를 받을 때 동일한 틀에서 가능
    
    if a < b:
      maximum = b
    else:
      maximum = a   

return maximum


d = my_max(a, b)
a = int(input('숫자를 입력하세요: '))
b = int(input('숫자를 입력하세요: ')) 
print(d)
