### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ f9cff580-177c-11ee-3009-f10716eaaa7c
X1 = [1, 2, 3, 4, 5, 6] # possible outcomes

# ╔═╡ 3603b029-a560-4c6a-ae6c-78483ddfab43
X2 = [1:1:6;] # possible outcomes

# ╔═╡ fd392cc8-1fb4-4b2b-b250-fc8f12961931
X1 == X2 # X1 and X2 represent the same vector

# ╔═╡ c4516d02-97d1-4569-9ca8-643840aad9e5
pX1 = [1/6, 1/6, 1/6, 1/6, 1/6, 1/6]

# ╔═╡ d4996053-eb33-413c-b5e4-4e94828c2b13
begin
	EX1 = 0
	for i = 1:6
		EX1 += X1[i] * pX1[i]
	end
	EX1
end

# ╔═╡ 31f54046-f5f8-477b-84dc-91da3b7922d9
function expected_value(X, pX) 
	# Computes the expected value of X with distribution pX
	n = length(X)
	EX = 0
	for i = 1:n
		EX += X[i] * pX[i]
	end
	return EX
end

# ╔═╡ 4e74c3e0-bbaf-4be2-bf31-012bd561ad59
expected_value(X1, pX1)

# ╔═╡ 05a78841-e250-4a3c-b3c1-d1727c0f57b0
begin 
	# X and Y independent coins
	X = [0, 1]
	Y = [0, 1]
	pXY = [1/4 1/4
		   1/4 1/4] # joint
	pX = [1/2, 1/2] # marginal
	pY = [1/2, 1/2] # marginal
end

# ╔═╡ cfbb6cf0-5ab3-40e5-aca0-c6435328df5e
function covariance(X, Y, pXY, pX, pY)
	# Computes the covariance of X and Y given pXY, pX, and pY
	CXY = 0
	n = length(X)
	m = length(Y)
	EX = expected_value(X, pX)
	EY = expected_value(Y, pY)
	for i = 1:n
		for j= 1:m
			CXY += X[i] * Y[j] * pXY[i, j]
		end
	end
	CXY = CXY - EX * EY
end

# ╔═╡ ceb98286-31e5-4c5f-bfa5-c969672f5987
covariance(X, Y, pXY, pX, pY)

# ╔═╡ Cell order:
# ╠═f9cff580-177c-11ee-3009-f10716eaaa7c
# ╠═3603b029-a560-4c6a-ae6c-78483ddfab43
# ╠═fd392cc8-1fb4-4b2b-b250-fc8f12961931
# ╠═c4516d02-97d1-4569-9ca8-643840aad9e5
# ╠═d4996053-eb33-413c-b5e4-4e94828c2b13
# ╠═31f54046-f5f8-477b-84dc-91da3b7922d9
# ╠═4e74c3e0-bbaf-4be2-bf31-012bd561ad59
# ╠═05a78841-e250-4a3c-b3c1-d1727c0f57b0
# ╠═cfbb6cf0-5ab3-40e5-aca0-c6435328df5e
# ╠═ceb98286-31e5-4c5f-bfa5-c969672f5987
