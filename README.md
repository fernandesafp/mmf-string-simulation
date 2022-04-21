# Damped string simulation

This is a standing wave simulation as a damp string project written in Julia.

## Oscillation of a stretched string

A stretched string oscillation is described by the partial differential equation (PDE):

$$\frac{\partial^2 y(x,t)}{\partial t^2} = v^2 \frac{\partial^2 y(x,t)}{\partial x^2} - k \frac{\partial y(x,t)}{\partial t}$$

Where $y(x,t)$ represents the y-axis position of a given x coordinate in the string, $v$ the velocity of the string and $k$ the dampening of the string.

Both string extremities are fixed with the initial conditions as:

$$\begin{cases}
y(x,0) = f(x)\\
\frac{\partial y(x,0)}{\partial t} = g(x)
\end{cases}$$

For demonstration purposes, the following will be used:

$$\begin{cases}
L = 1~(m)\\
v = 1~(ms^{-1})\\
g(x) = \sum_{n}^{N} b_n \sin(\frac{(2n + 1)x\pi}{L})
\end{cases}$$

where $L$ represents the length of the string and, as an integer, will act as the harmonic number, $g(x) = f(x)$, $N$ the maximum number of iterations, and $b_n$ the Fourier coefficient defined as:

$$b_n = \frac{8}{\pi^2}\frac{(-1)^n}{(2n + 1)^2}$$

The following animation displays the effect of the number of iterations $N$ over the function $g(x)$ where $t = 0$.

<img src="string_iterations.gif">

Adding the time component, the amplitude function is defined as:

$$Y_n(x, t) = g_n(x) \times d_n(t)$$

where

$$\frac{\partial^2 Y_n(x,t)}{\partial t^2} = v^2 \frac{\partial^2 Y_n(x,t)}{\partial x^2} - k \frac{\partial Y_n(x,t)}{\partial t}$$

is solved for $d_n(t)$ taking into account the initial conditions.

Finally, for heavy damping ($k = 4$), the resulting string oscillation is as follows:

<img src="string_animation.gif">