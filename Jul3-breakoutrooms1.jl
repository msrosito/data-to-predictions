### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ 924b6ee0-18ed-11ee-32df-f726e418d6be
md"""
## Solve the following excersices translating sigma notation to code
"""

# ╔═╡ 0e1dd9f5-f937-473d-b3aa-988b72922aeb
md"""
###### Task 1: For $A \in \mathbb{R}^{m \times n}$ and $B \in \mathbb{R}^{n \times l}$, complete the function **mat_mul** that computes $A B$ from scratch. You should check first that the multplication is possible.
$C = AB \iff c_{ij} = \sum_{k=1}^n a_{ik} b_{kj}$
"""

# ╔═╡ 210a848c-6556-4f7d-8d34-06ba0573f0b4
function mat_mul(A, B) 
	nrowA, ncolA = size(A)
	nrowB, ncolB = size(B)
	if ncolA != nrowB 
		error("the number of columns of A should be equal to the number of rows of B")
	end
	nrowC = nrowA
	ncolC = ncolB
	n = nrowA
	C = zeros(nrowA, ncolB) # dimensions of C
 	# COMPLETE ##################
	# Hint: You can use a triple for loop
	return C		
end		

# ╔═╡ bbd80e47-a33a-46fa-a7fc-001c2ae8a93f
md"""
###### Use **mat_mul** to compute the multiplication of the following matrices
"""

# ╔═╡ 1e634e4d-d3ee-413d-a1bb-40fad0932a10
begin
	A = rand(2, 2) # returns a 2 x 2 array of random numbers between 0 and 1
	B = rand(2, 3) # returns a 2 x 3 array of random numbers between 0 and 1
	mat_mul(A, B)
end

# ╔═╡ 4d9591ce-cf7c-4be8-b36b-5201e390d814
md"""
###### Observe that **mat_mul** displays an error message in the following case 
"""

# ╔═╡ a9b93f3f-1829-41f0-bc5c-9e444b8808c9
mat_mul(B, A)

# ╔═╡ c1a7eb53-01c4-47c8-81a6-9a1f76b98033
md"""
###### Task 2: Let $X$ and $Y$ be two discrete random variables with joint probability $p_{XY}$. Complete the function **marginalX** to obtain the marginal probability distribution $p_X$. 
###### $p_{XY}$ is given as a matrix $P \in \mathbb{R}^{m \times n}$; $m$ and $n$ are the number of possible values can $X$ and $Y$ take, respectively.

$p_{XY}(x_i, y_j) = P_{i, j}$

###### For each $x_i$, $p_X(x_i)$ is defined as

$p_X(x_i) = \sum_{j = 1}^n p_{XY}(x_i, y_j) = \sum_{j = 1}^n P_{i, j}$

"""

# ╔═╡ b49316b3-0fad-463f-8f9e-8d14b6f4909f
function marginalX(P)
	m, n = size(P)
	pX = zeros(m)
 	# COMPLETE ##################	
	return pX
end

# ╔═╡ 6ccbb17d-52b3-4edc-8fcc-2eaba8f666a3
md"""
###### Write a similar function to obtain $p_Y$
"""

# ╔═╡ 3ed1e7b3-49c1-4081-a1ad-0f4cc62d2ef1
function marginalY(P)
 	# COMPLETE ##################	
end

# ╔═╡ 07f76642-2be5-4306-b10b-4e57b601877d
md"""
###### Apply your functions to obtain the marginal probabilities of $X$ and $Y$ when the joint probability distribution is given by the following matrices
"""

# ╔═╡ 82f69782-b918-41a6-b8a2-0efa0cebe9b8
begin
	P1 = [ 1/8 1/8 0
	      1/8 1/4 1/8
          0 1/8 1/8]
	pX1 = marginalX(P1)
	pY1 = marginalY(P1)
	pX1, pY1
end

# ╔═╡ 5294f160-b248-476f-976c-3c04512a3772
begin
	P2 = [1/8 1/4 1/8
		  1/8 1/4 1/8]
	pX2 = marginalX(P2)
	pY2 = marginalY(P2)
	pX2, pY2
end

# ╔═╡ c4f7a0d7-bd2a-4681-8897-66254ba2d07c
md"""
###### Task 3: Rewrite the function **covariance** in the notebook VerySimpleExample.jl
###### The new function should not require pX and pY
"""

# ╔═╡ 22ab00dc-f2fa-448a-8ab1-d525541034d5
begin
	function expected_value(X, pX) 
		# Computes the expected value of X with distribution pX
		n = length(X)
		EX = 0
		for i = 1:n
			EX += X[i] * pX[i]
		end
		return EX
	end

## Reimplement (only) the function below #################################	
	# function covariance(X, Y, pXY, pX, pY)
	# 	# Computes the covariance of X and Y given pXY, pX, and pY
	# 	CXY = 0
	# 	n = length(X)
	# 	m = length(Y)
	# 	EX = expected_value(X, pX)
	# 	EY = expected_value(Y, pY)
	# 	for i = 1:n
	# 		for j= 1:m
	# 			CXY += X[i] * Y[j] * pXY[i, j]
	# 		end
	# 	end
	# 	CXY = CXY - EX * EY
	# end
	
end

# ╔═╡ 922d01be-f0d7-45d4-bdb7-3138928990d4
function covariance(X, Y, pXY)
	return 0
end

# ╔═╡ Cell order:
# ╟─924b6ee0-18ed-11ee-32df-f726e418d6be
# ╟─0e1dd9f5-f937-473d-b3aa-988b72922aeb
# ╠═210a848c-6556-4f7d-8d34-06ba0573f0b4
# ╟─bbd80e47-a33a-46fa-a7fc-001c2ae8a93f
# ╠═1e634e4d-d3ee-413d-a1bb-40fad0932a10
# ╟─4d9591ce-cf7c-4be8-b36b-5201e390d814
# ╠═a9b93f3f-1829-41f0-bc5c-9e444b8808c9
# ╟─c1a7eb53-01c4-47c8-81a6-9a1f76b98033
# ╠═b49316b3-0fad-463f-8f9e-8d14b6f4909f
# ╟─6ccbb17d-52b3-4edc-8fcc-2eaba8f666a3
# ╠═3ed1e7b3-49c1-4081-a1ad-0f4cc62d2ef1
# ╟─07f76642-2be5-4306-b10b-4e57b601877d
# ╠═82f69782-b918-41a6-b8a2-0efa0cebe9b8
# ╠═5294f160-b248-476f-976c-3c04512a3772
# ╟─c4f7a0d7-bd2a-4681-8897-66254ba2d07c
# ╠═22ab00dc-f2fa-448a-8ab1-d525541034d5
# ╠═922d01be-f0d7-45d4-bdb7-3138928990d4
