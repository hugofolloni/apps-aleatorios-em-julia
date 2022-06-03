using LinearAlgebra;

function esticamento(B, C, indice, fator)
    hB, wB = size(B);
    hC, wC = size(C);
    for i = 1:hB
        B[i, indice] = B[i, indice] * fator
    end
    for j = 1:wC
        C[indice, j] = C[indice, j] / fator
    end
    return B, C
end

function troca(B, C, i, j)
    primeiraColuna = []
    segundaColuna = []

    hB, wB = size(B);
    hC, wC = size(C);
    
    for linha = 1:hB
        primeiraColuna = [primeiraColuna, B[linha, i]]
        segundaColuna = [segundaColuna, B[linha, j]]
    end
    for linha = 1:hB
        B[linha, i] = segundaColuna[linha]
        B[linha, j] = primeiraColuna[linha] 
    end

    return B, C
end

function soma(B, C, i, j, fator)

    hB, wB = size(B);
    hC, wC = size(C);
    
    for linha = 1:hB
        B[linha, i] = B[linha, i] + fator * B[linha, j]
    end
    for coluna = 1:wC
        C[j, coluna] = C[i, coluna] - fator * C[i, coluna]
    end

    return B, C
end

A = Matrix{Int64}([1:3:2:3:10],
                [2, 6, 5, 9 ,20],
                [3, 9, 7, 12, 30], 
                [6, 18, 14, 24, 60], 5, 4)

# A = [[1 3 2 3 10];
#     [2 6 5 9 20];
#     [3 9 7 12 30] ;
#     [6 18 14 24 60]]

print(A)
print('\n')


function algorithm(A)

    B = copy(A)

    tamanhoM, tamanhoN = size(B)

    println(string(tamanhoM))
    println(string(tamanhoN))

    identidade = Matrix(1I, tamanhoN, tamanhoM)
    
    linha = 1
    coluna = 1
    janela = [1, 1]

    while linha < tamanhoM && coluna < tamanhoN
        if B[linha, coluna] == 0
            if linha == tamanhoM - 1
                coluna = coluna + 1
                linha = janela[1]
            else
                linha = linha + 1
            end
        else
            numero = B[linha, coluna]
            esticamento(identidade, B, linha, numero)
            for i = 1:tamanhoM - 1
                if i != linha
                    soma(identidade, B, linha, i, B[i, coluna])
                end
            end
            janela = [linha + 1, coluna + 1]
            linha += 1
            coluna += 1
        end
    end

    print(identidade)
    print('\n')
    print(B)
end

algorithm(A)

# Faltam alguns detalhes