### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ 88a78b56-1847-11ee-0ad6-25617a695f5f
md"""
# Vectors and Matrices
"""

# ╔═╡ 4b1128c8-da94-4987-a880-2a5f83187091
md"""
## Vectors
"""

# ╔═╡ 5d34863a-5c04-4979-81c8-77d3d2bf4aa5
begin
	x = [1, 2, 4, 7, 9.3]
	zero = zeros(5)
	one = ones(5)
	x, zero, one, length(x)
end


# ╔═╡ fbc8a6fa-2732-44ea-a655-7ba5b1576661
md"""
##### Ex 1: Write a function to compute the ith element of the canonical basis in $\mathbb{R}^n$
"""

# ╔═╡ d2baf075-10b2-48ee-a818-f7353d2aabd7
function canonical_basis(i, n)
	ei = zeros(n)
	ei[i] = 1
	return ei
end

# ╔═╡ b517b7f9-c8dd-4a57-91c4-2b89c7d759a5
canonical_basis(2, 5)

# ╔═╡ 18353058-ec0d-4ed3-9d56-199359e3f429
md"""
#### Operation with vectors
##### Addition, substraction, and scaling
"""

# ╔═╡ fecb512e-af45-4b03-805d-d858a6ed20a1
begin
	v = [1, 2, 5]
	w = [-6, 3.9, 8]
	α = 2
	
	add = v + w # addition
	sub = v - w # subtraction
	sc1 = α * v # scaling
	sc2 = 1/α *v

	add, sub, sc1, sc2
end	


# ╔═╡ 9b0a8ec8-99f7-45c6-9e18-faf576be12a5
md"""
##### Dot (inner) product
"""

# ╔═╡ 1fd5152a-b739-499b-bc17-2d0736cbd2ce
dp1 = v'* w # means v(transpose) * w

# ╔═╡ ba999551-50a3-4448-a9af-3d237b816189
md"""
##### Dot product using sigma notation
$v, w \in \mathbb{R}^n$ 
$v \cdot w = \Sigma_{i = 1}^n v_i w_i$

"""

# ╔═╡ 7a1a73e0-af65-4f54-ba49-fb98acf516aa
md"""
##### Ex 2: Write a function to compute the dot product of two vectors using for loops
"""

# ╔═╡ ce31354f-8ed4-43ee-9fe6-2a7b4a1043a5
function dot_sigma(v, w)
	dot = 0
	n = length(v)
	for i = 1:n
		dot += v[i] * w[i]
	end
	return dot
end

# ╔═╡ b6550d34-8d16-4c49-bd74-bcb8a1663eea
dot_sigma(v, w)

# ╔═╡ 4fa6eba1-bd7a-4590-ba62-f178f64613c4
md"""
##### Elementwise operations
"""

# ╔═╡ cecc5829-8fbf-4530-98e4-7ed4b92b03fb
begin
	v1 = [ 22.15, 89.32, 56.77 ]
	v2 = [ 23.05, 87.32, 57.13 ]
	r = (v2 -v1) ./ v1
end

# ╔═╡ d7adea7a-1cac-40ec-86db-64ebc2818a49
r[1] == (v2[1] - v1[1])/v1[1]

# ╔═╡ 68b78d92-27a1-42e8-8e23-1d9af0cc9eb2
begin
	g(x) = x^2
	g.(v1), 22.15^2
end

# ╔═╡ d19b6bb5-ec8e-4644-a15f-6aebb873adff
md"""
## Matrices
"""

# ╔═╡ 4a49c830-b062-4302-bc7e-5c440d9245c1
begin
	A = [1 2 3
		 2 0 5]
	B = zeros(2, 3)
	C = ones(3, 2)
	D = ones(2, 3)
	A, B, C, D, size(A)
end

# ╔═╡ 5f78776c-eddc-46de-a3b0-1d79b5b460eb
md"""
#### Operations with matrices
##### Addition, substraction, and scalar multiplication
"""

# ╔═╡ 5b3ce9d1-a33c-4c84-b92e-cea4f7c54993
A + D, A - D, α * A  

# ╔═╡ e7e972e8-f63f-4c78-94c4-dbf5cee5304a
md"""
##### Multiplication
"""

# ╔═╡ 7b2cd387-3952-469b-b7d8-8d30217841fb
A * C

# ╔═╡ 8fd3ffb6-1894-4efe-8e86-8053bf6b6aa1
md"""
##### Transpose
"""

# ╔═╡ b2970f7b-705c-4adc-9bc3-78371174956d
A'

# ╔═╡ Cell order:
# ╟─88a78b56-1847-11ee-0ad6-25617a695f5f
# ╟─4b1128c8-da94-4987-a880-2a5f83187091
# ╠═5d34863a-5c04-4979-81c8-77d3d2bf4aa5
# ╟─fbc8a6fa-2732-44ea-a655-7ba5b1576661
# ╠═d2baf075-10b2-48ee-a818-f7353d2aabd7
# ╠═b517b7f9-c8dd-4a57-91c4-2b89c7d759a5
# ╟─18353058-ec0d-4ed3-9d56-199359e3f429
# ╠═fecb512e-af45-4b03-805d-d858a6ed20a1
# ╟─9b0a8ec8-99f7-45c6-9e18-faf576be12a5
# ╠═1fd5152a-b739-499b-bc17-2d0736cbd2ce
# ╟─ba999551-50a3-4448-a9af-3d237b816189
# ╟─7a1a73e0-af65-4f54-ba49-fb98acf516aa
# ╠═ce31354f-8ed4-43ee-9fe6-2a7b4a1043a5
# ╠═b6550d34-8d16-4c49-bd74-bcb8a1663eea
# ╟─4fa6eba1-bd7a-4590-ba62-f178f64613c4
# ╠═cecc5829-8fbf-4530-98e4-7ed4b92b03fb
# ╠═d7adea7a-1cac-40ec-86db-64ebc2818a49
# ╠═68b78d92-27a1-42e8-8e23-1d9af0cc9eb2
# ╟─d19b6bb5-ec8e-4644-a15f-6aebb873adff
# ╠═4a49c830-b062-4302-bc7e-5c440d9245c1
# ╟─5f78776c-eddc-46de-a3b0-1d79b5b460eb
# ╠═5b3ce9d1-a33c-4c84-b92e-cea4f7c54993
# ╟─e7e972e8-f63f-4c78-94c4-dbf5cee5304a
# ╠═7b2cd387-3952-469b-b7d8-8d30217841fb
# ╟─8fd3ffb6-1894-4efe-8e86-8053bf6b6aa1
# ╠═b2970f7b-705c-4adc-9bc3-78371174956d
