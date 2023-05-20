using SymPy
using Plots
theme(:dark)

x₀ = 0          # Left limit (m)
step = .01      # Step
L = 1           # Right limit (m)
x = x₀:step:L   # Range
N = 15          # Maximum number of iterations
fps = 3         # Frames per second

# Fourier coefficient and function
@syms n, x
b = 8 / sympy.pi^2 * (-1)^n / (2n + 1)^2
g = b * sympy.sin((2n + 1) * sympy.pi * x / L)

display(g)

# Animation function
iterations = @animate for iteration in 0:N-1
    plot(summation(g, (n, 0, iteration)), grid=false, framestyle=:semi,
        linewidth=2, foreground_color_legend=nothing,
        label="g(x) with N iterations = $iteration")
    xaxis!((x₀, L), 0:1:2*L)
    xlabel!("Length (m)")
    yaxis!((x₀, 1), 0:1:2*L)
    ylabel!("Amplitude (m)")
end

gif(iterations, "gifs/string_iterations.gif", fps=fps)