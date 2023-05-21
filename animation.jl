# y component
@syms t::(real, poitive), d()
y = g * d(t)
println("y(x, 0) = ")
display(y)

# Wave function
wave_function = Eq(diff(y, (t, 2)) - v^2 * diff(y, (x, 2)) + k * diff(y, t), 0)
println("Wave function")
display(wave_function)

# Differential solve
solution = dsolve(wave_function, d(t), ics = Dict(d(0) => 1, diff(d(t), t)(0) => 1))
y = sympy.Sum(subs(y, d(t), solution.rhs), (n, 0, N_wave)).doit()
println("y(x, t) = ")
display(y)

# Extract the real part of the wave function
y_function = lambdify(sympy.re(y), [x, t])

# Wave animation function
println("Calculating plotting frames at $wave_fps fps...")
@time wave = @animate for current_t = 0:1/wave_fps:Δt
    print("\r")
    print("Completed: $(Int(round(current_t*100/Δt)))%")
    plot(
        range,
        y_function.(range, current_t),
        grid = false,
        framestyle = :semi,
        linewidth = 2,
        foreground_color_legend = nothing,
        label = "N = $N_wave; v = $v m/s; k = $k N/m; t = $(round(current_t; digits=1)) s",
    )
    xaxis!((x₀, L), 0:1:2*L)
    xlabel!("Length (m)")
    yaxis!((-1.5, 1.5), -2*L:1:2*L)
    ylabel!("Amplitude (m)")
end
println("Finished.")

# Save as gif
println("Saving GIF...")
gif(wave, "gifs/string_animation.gif", fps = wave_fps)
println("Animation script completed!")
