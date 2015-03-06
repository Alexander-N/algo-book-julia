function shortBubbleSort(alist)
    exchanges = true
    passnum = length(alist)-1
    while passnum > 0 && exchanges==true
        exchanges = false
        for i in 1:passnum
            if alist[i] > alist[i+1]
                alist[i], alist[i+1] = alist[i+1], alist[i]
                exchanges = true
            end
        end
        passnum -= 1
    end
    return alist
end

alist = [20,30,40,90,50,60,70,80,100,110]
shortBubbleSort(alist)
println(alist)
