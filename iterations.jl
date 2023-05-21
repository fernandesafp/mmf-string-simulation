println("gₙ(x) = ")
display(g)

g_function = lambdify(g, [x, n])

# Iterations animation function
println("Calculating plotting frames...")
@time iterations = @animate for iteration = 0:N_max-1
    print("\r")
    print("Frame: $(iteration+1)/$(N_max)")
    wave = zeros(length(range))
    for i = 0:iteration
        wave += g_function.(range, i)
    end
    plot(
        range,
        wave,
        grid = false,
        framestyle = :semi,
        linewidth = 2,
        foreground_color_legend = nothing,
        label = "g(x) with N iterations = $iteration",
    )
    xaxis!((x₀, L), 0:1:2*L)
    xlabel!("Length (m)")
    yaxis!((0, 1), 0:1:2*L)
    ylabel!("Amplitude (m)")
end
println("Finished.")

# Save as gif
println("Saving GIF...")
gif(iterations, "gifs/string_iterations.gif", fps = iter_fps)
println("Iterations script completed!")
