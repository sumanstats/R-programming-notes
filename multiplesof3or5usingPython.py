def multiplesof3or5usingPython(x,y):
    '''This function does not include y'''
    sum=0
    for i in range(x,y):
        if i%3==0 or i%5==0:
            sum =sum + i
    print (sum)
