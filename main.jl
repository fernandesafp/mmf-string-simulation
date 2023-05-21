using SymPy
using Plots
theme(:dark)

# Parameters
x₀ = 0             # Left limit (m)
L = 1              # Right limit (m)
step = 0.01        # Step
range = x₀:step:L  # Range
k = 2              # Damping
v = 2              # Velocity (m/s)
N_max = 15         # Maximum number of iterations
N_wave = 1         # Number of wave iterations
iter_fps = 3       # Frames per second for iterations
wave_fps = 30      # Frames per second for the wave
Δt = 6             # seconds

# Fourier coefficient and function
@syms n::(integer, positive), x::(real, positive), N::(integer, positive)
b = 8 / sympy.pi^2 * (-1)^n / (2n + 1)^2
g = b * sympy.sin((2n + 1) * sympy.pi * x / L)

println("Running iterations...")
include("iterations.jl")

println("Running animation...")
include("animation.jl")
