def addition (a : int ,b : int ):
    return (a+b)


def factoriel( n : int):
    if n == 0 :
        return 1
    else :
        return n*factoriel(n-1)



if __name__ == "__main__":

    print(factoriel(0))
    print(factoriel(5))
