function test1()
    l = Int64[]
    for i in 0:999
        l = [l, i]
    end
end

function test2()
    l = Int64[]
    for i in 0:999
        push!(l,i)
    end
end

function test3()
    l = [i for i in 0:999]
end

function test4()
    l = [0:999]
end

println("concat")
@time test1()
println("\nappend")
@time test2()
println("\ncomprehension")
@time test3()
println("\nlist range")
@time test4()
