using Plots
theme(:dark)

x₀ = 0          # Left limit (m)
step = .01      # Step
L = 1           # Right limit (m)
x = x₀:step:L   # Range
N = 15          # Maximum number of iterations
fps = 3         # Frames per second

# Fourier coefficient and function
b(n) = 8*(-1)^n/(π*(2n+1))^2
g(x, N) = sum([b(n) .* sin.((2n + 1).*x.*π/L) for n in 0:N])

# Animation function
iterations = @animate for n in 0:N-1

    plot(x, g(x,n), grid=false, framestyle=:semi,
            linewidth=2, foreground_color_legend = nothing,
            label="g(x) with N iterations = $(n)")
    xaxis!((x₀,L), 0:1:2*L)
    xlabel!("Length (m)")
    yaxis!((x₀,1), 0:1:2*L)
    ylabel!("Amplitude (m)")
end

gif(iterations, "string_iterations.gif", fps=fps)