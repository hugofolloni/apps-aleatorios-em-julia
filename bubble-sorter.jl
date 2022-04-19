function bubbleSorter(array)
    tamanho = length(array)
    for i in 1:tamanho-1
        for j in 1:tamanho-i
            if array[j] > array[j+1]
                aux = array[j]
                array[j] = array[j+1]
                array[j+1] = aux
            end
        end
    end
    print(array)
end

bubbleSorter([123, 21, 312, 12, 14, 41])