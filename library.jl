using LinearAlgebra

x = [12.42; 3.521]
y = [5; 6]

function norma(x)
    # uma função que retorna o tamanho do vetor x, ou seja, a norma
    return sqrt(x' * x)
end

function distancia(x, y)
    # uma função que retorna a distância entre os vetores x e y
    return norma(x - y)
end 

function normalizar(x)
    # uma função que dado vetor x retorna um vetor v tal que norma(v)=1 e v está na mesma direção e sentido que x
    return x / norma(x)
end

function lambda(x, y)
    # uma função que retorna o "tamanho" do vetor y projetado em x, ou melhor, quantas vezes você tem que andar no vetor unitário ~x
    return y' * normalizar(x)
end

function projetar(x, y)
    # uma função que retorna o vetor y projetado em x
    return lambda(x, y) * normalizar(x)
end

function cosseno(x, y)
    # acha o cosseno do angulo entre os vetores (indica o quão proximo dois vetores estão em termos de ângulo (de 0 a 1))
    return lambda(x,y) / norma(y)
end

function approx(x, y)
    if ((x - y) < 0.001) && ((x - y) > -0.001)
        return true
    end
end


function é_perpendicular(x, y)
    approx(cosseno(x, y), 0)
end

function está_na_mesma_direcao(x, y)
    approx(cosseno(x, y), 1)
end

materia = [3; 4; 0]
livro = [300; 400; 1]

function fatoração(a1, a2) # Dado a1 e a2, retorna q1, q2 tal que q1 está na mesma direção que a1 e a norma(q1) = 1 e norma(q2) = 1 e q1 perpendicular a q2
    q1 = normalizar(a1)
    p = projetar(a2, q1)
    d = a2 - p # esse vetor está perpendicular ao q1
    q2 = normalizar(d)
     
    return q1, q2, R
end


println(cosseno(materia, livro))
println(está_na_mesma_direcao(materia, livro))
