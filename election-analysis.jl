# Election analysis algorithm that i wrote in julia for an exercise in the course.

function variacoes(rk, mk, ano, i)
    temprk = rk
    tempmk = mk
    rk = round(temprk + 0.2 * tempmk - 0.3 * temprk)
    mk = round(tempmk + 0.3 * temprk - 0.2 * tempmk)
    print("rk: ", rk, ", mk: ", mk, ", ano: ", ano, "\n")
    i = i + 1
    if i < 30
        variacoes(rk, mk, ano + 1, i)
    end
end

pessoas = 1000

i = 0

rk = 0.5 * pessoas
mk = 0.5 * pessoas

variacoes(rk, mk, 2022, i)