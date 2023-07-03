### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ afd6e97a-19b1-11ee-0280-6f54b024d082
md"""
## Solve the following excersices translating sigma notation to code
"""

# ╔═╡ 39c10426-8d3c-4e1e-8b59-389de5589676
md"""
###### Task 1: For $A \in \mathbb{R}^{m \times n}$ and $B \in \mathbb{R}^{n \times l}$, complete the function **mat_mul** that computes $A B$ from scratch. You should check first that the multplication is possible.
$C = AB \iff c_{ij} = \sum_{k=1}^n a_{ik} b_{kj}$
"""

# ╔═╡ f729df70-9b7d-4404-9fec-a99694f1a89e
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
	for i = 1:nrowC
		for j = 1:ncolC
			for k = 1:n
				C[i,j] += A[i, k] * B[k, j]
			end
		end
	end
	return C		
end	

# ╔═╡ 305f1ba8-72cd-4644-958d-a9e9bafb9245
md"""
###### Use **mat_mul** to compute the multiplication of the following matrices
"""

# ╔═╡ 3aa71e50-5353-4423-b6a2-38ac61a70c22
begin
	A = rand(2, 2) # returns a 2 x 2 array of random numbers between 0 and 1
	B = rand(2, 3) # returns a 2 x 3 array of random numbers between 0 and 1
	mat_mul(A, B)
end

# ╔═╡ c0465105-dc3c-4e02-befe-a8292ad791d7
md"""
###### Observe that **mat_mul** displays an error message in the following case 
"""

# ╔═╡ 2a94a2d9-70e7-4cb7-8766-1d784819d42f
mat_mul(B, A)

# ╔═╡ 6e6a19e6-5b6c-401f-99ee-823a5012dc36
md"""
###### Task 2: Let $X$ and $Y$ be two discrete random variables with joint probability $p_{XY}$. Complete the function **marginalX** to obtain the marginal probability distribution $p_X$. 
###### $p_{XY}$ is given as a matrix $P \in \mathbb{R}^{m \times n}$; $m$ and $n$ are the number of possible values can $X$ and $Y$ take, respectively.

$p_{XY}(x_i, y_j) = P_{i, j}$

###### For each $x_i$, $p_X(x_i)$ is defined as

$p_X(x_i) = \sum_{j = 1}^n p_{XY}(x_i, y_j) = \sum_{j = 1}^n P_{i, j}$

"""

# ╔═╡ a80258ad-f763-4504-801a-d9ddf62fe21d
function marginalX(P)
	m, n = size(P)
	pX = zeros(m)
	for i = 1:m
		for j = 1:n
			pX[i] += P[i, j]
		end
	end
	return pX
end

# ╔═╡ 3396cd2d-facd-4dd2-be3b-7fd940594d21
md"""
###### Write a similar function to obtain $p_Y$
"""

# ╔═╡ e4dd798f-cb49-47cf-bb11-eba6bf86bb28
function marginalY(P)
	m, n = size(P)
	pY = zeros(n)
	for j = 1:n
		for i = 1:m
			pY[j] += P[i, j]
		end
	end
	return pY
end

# ╔═╡ 6720d9b4-4a00-4241-9163-dcace8425763
md"""
###### Apply your functions to obtain the marginal probabilities of $X$ and $Y$ when the joint probability distribution is given by the following matrices
"""

# ╔═╡ 6fde0db6-702d-42e0-8e96-d4fc1c558f0e
begin
	P1 = [ 1/8 1/8 0
	      1/8 1/4 1/8
          0 1/8 1/8]
	pX1 = marginalX(P1)
	pY1 = marginalY(P1)
	pX1, pY1
end

# ╔═╡ 1261eee6-70f4-4810-9c65-064e55db8769
begin
	P2 = [1/8 1/4 1/8
		  1/8 1/4 1/8]
	pX2 = marginalX(P2)
	pY2 = marginalY(P2)
	pX2, pY2
end

# ╔═╡ 960f0a20-84ab-413d-b85d-47e9ff1487f8
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

# ╔═╡ 41e1f89e-c253-4710-a28c-7dad9220b81b
function covariance(X, Y, pXY)
	CXY = 0
	n = length(X)
	m = length(Y)	
	pX = marginalX(pXY)
	pY = marginalY(pXY)
	EX = expected_value(X, pX)
	EY = expected_value(Y, pY)
	for i = 1:n
		for j= 1:m
			CXY += X[i] * Y[j] * pXY[i, j]
		end
	end
	CXY = CXY - EX * EY	
	return CXY
end

# ╔═╡ c13d397d-aed8-410e-950d-6d734b41b6d1
begin
	X = [0, 1, 2]
	Y = [0, 1, 2]
	Z = [0, 1]
	covariance(X, Y, P1), covariance(Z, Y, P2)
end


# ╔═╡ Cell order:
# ╟─afd6e97a-19b1-11ee-0280-6f54b024d082
# ╟─39c10426-8d3c-4e1e-8b59-389de5589676
# ╠═f729df70-9b7d-4404-9fec-a99694f1a89e
# ╟─305f1ba8-72cd-4644-958d-a9e9bafb9245
# ╠═3aa71e50-5353-4423-b6a2-38ac61a70c22
# ╟─c0465105-dc3c-4e02-befe-a8292ad791d7
# ╠═2a94a2d9-70e7-4cb7-8766-1d784819d42f
# ╟─6e6a19e6-5b6c-401f-99ee-823a5012dc36
# ╠═a80258ad-f763-4504-801a-d9ddf62fe21d
# ╟─3396cd2d-facd-4dd2-be3b-7fd940594d21
# ╠═e4dd798f-cb49-47cf-bb11-eba6bf86bb28
# ╟─6720d9b4-4a00-4241-9163-dcace8425763
# ╠═6fde0db6-702d-42e0-8e96-d4fc1c558f0e
# ╠═1261eee6-70f4-4810-9c65-064e55db8769
# ╠═960f0a20-84ab-413d-b85d-47e9ff1487f8
# ╠═41e1f89e-c253-4710-a28c-7dad9220b81b
# ╠═c13d397d-aed8-410e-950d-6d734b41b6d1
