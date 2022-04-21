using Plots
theme(:dark)

# Parameters
x₀ = 0          # Left limit (m)
step = .001     # Step
L = 1           # Right limit (m)
x = x₀:step:L   # Range
N = 0           # Maximum number of iterations
fps = 30        # Frames per second
Δt = 10          # seconds
k = 1           # Damping
v = 1           # Velocity (m/s)

# Fourier coefficient and function
b(n) = 8*(-1)^n/(π*(2n+1))^2
g(x, N) = sum([b(n) .* sin.((2n + 1).*x.*π/L) for n in 0:N])

root(n) = k + sqrt(Complex(k^2 - 4*((1 + 2*n)*π*v)^2))
d(t, N) = sum([(exp(-.5*root(n)*t)*(1 + (-1 + exp(root(n)*t - k*t)*(1 + .5*(root(n))))/(root(n) - k))) for n in 0:N])

Y(x, t) = g(x, N)*d(t, N)

# Animation function
wave = @animate for t in 0:1/fps:Δt

    plot(x, real(Y(x, t)) .+ imag(Y(x,t)), grid=false, framestyle=:semi,
            linewidth=2, foreground_color_legend = nothing,
            label="k = $(k); t = $(round(t; digits=1)) s")
    xaxis!((x₀,L), 0:1:2*L)
    xlabel!("Length (m)")
    yaxis!((-1.5,1.5), -2*L:1:2*L)
    ylabel!("Amplitude (m)")
end

gif(wave, "string_animation.gif", fps=fps)