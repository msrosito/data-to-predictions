using Plots

function gen_road_angle(n, m)
    xs, ys = range(0, 1, n), range(-1, 1, m)
    road, angle = rand(n, m), rand(-1:0.01:1)
    width = round(Int, 0.35m) 
    f(x) = angle * x^2
    for (i, x) in enumerate(xs)
        j = round(Int, (1-m)/(-1-1) * (f(x) - (-1)) + 1 )
        w = width - round(Int, i/5) 
        for k in j-w:j+w
            if 1 <= k <= n
                road[i, k] = 0.5road[i, k]
            end
        end
    end
    return road, angle
end

anim = @animate for _ in 1:50
    road, angle = gen_road_angle(100, 100)
    heatmap(road, legend = false, title = "Norm. angle: $angle", c = :grayC)
end

gif(anim, "lanes.gif", fps = 3)
