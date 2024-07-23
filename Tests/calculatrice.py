from typing import Union

def addition (a : int ,b : int ):
    return (a+b)

class FactorielError(Exception):
    pass

def factoriel(n: Union[int, float]) :
    if n < 0:
        return "factoriel existe pas pour un nombre negatif"
    if type(n) != int:
        return "Factoriel existe pas pour un réel"
    elif n == 0:
        return 1
    else:
        return n * factoriel(n - 1)


if __name__ == "__main__":

    print(factoriel(5))
