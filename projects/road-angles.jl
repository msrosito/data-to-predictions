using Plots

function gen_road_angle(n, m)
    xs, ys = range(0, 1, n), range(-1, 1, m)
    road, angle = rand(n, m), rand(-1:0.01:1)
    width = round(Int, 0.1m)
    f(x) = angle * x^2
    for (i, x) in enumerate(xs)
        j = round(Int, (1-m)/(-1-1) * (f(x) - (-1)) + 1 )
        for k in j-width:j+width
            if 1 <= k <= n
                road[i, k] = 1
            end
        end
    end
    return road, angle
end

road, angle = gen_road_angle(30, 30)
heatmap(road)
