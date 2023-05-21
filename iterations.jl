println("gₙ(x) = ")
display(g)

# Iterations animation function
println("Calculating plotting frames...")
iterations = @animate for iteration = 0:N_max-1
    print("\r")
    print("Frame: $(iteration+1)/$(N_max)")
    plot(
        summation(g, (n, 0, iteration)),
        x₀,
        L,
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
println("\nFinished.")

# Save as gif
println("Saving GIF...")
gif(iterations, "gifs/string_iterations.gif", fps = iter_fps)
println("GIF saved. Iterations script completed!")