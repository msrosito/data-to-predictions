### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# ╔═╡ fb1cddf6-1ed0-11ee-2751-c92b157f5013
md"""
# Revisiting Julia
"""

# ╔═╡ f9417982-94d0-4790-bf26-f353efe608fd
md"""
## Single summation
"""

# ╔═╡ 754360d6-8b3e-432a-b505-367abeb556e2
md"""
Given the following summation:
"""

# ╔═╡ c86a2993-29bf-453f-8aca-cfddf64a991c
md"""
$\sum_{i=1}^{N} i^2$ where N = 5
"""

# ╔═╡ 89989c0b-8afc-41ed-b917-91720dc89e61
md"""
How can we calculate the summation? We can start by creating an array with the elements of the summation using a for loop as follows.
"""

# ╔═╡ 623e469d-9ef5-4827-9c7d-9f84ecccdb93
md"""
First we define the array and initialize it with zeros.
"""

# ╔═╡ d3ec0eaf-f490-43c5-9fd6-e8e1358ac7f5
begin
	N = 5
	arr = zeros(N)
end

# ╔═╡ 952036a5-2ec9-41d6-8ace-20e7cb4235b7
md"""
Then, we can compute each element of the summation by accessing each position of the array with a for loop:
"""

# ╔═╡ 2b7294d3-bc77-4d74-9489-1f80b130d8c1
begin
	for i in 1:N
		arr[i] = i^2
	end
	arr
end

# ╔═╡ fc053948-b1e5-4efa-93d0-47162217393d
md"""
Using the function sum we can compute the summation of the elements in arr:
"""

# ╔═╡ 37a537ea-31fb-4ca7-8824-eaf7682ccdef
sum(arr)

# ╔═╡ ecbf637c-2d90-4b0e-a1a2-26f50dd3c6ad
md"""
In case we want to calculate the result of the previous sum using a for loop but avoiding the creation of the array, we can write the following code:
"""

# ╔═╡ 094e04ae-fb71-471e-b0c8-b39f2de0fe9c
begin
	acc_0 = 0.0
	println("i, i^2, acc_0")
	for i in 1:N
		acc_0 = acc_0 + i^2 
		println("$i, $(i^2), $acc_0")
	end
	acc_0
end

# ╔═╡ 0cbca06f-2293-48ae-87c7-c4afaba5cca5
md"""
A clean version, without the println would be:
"""

# ╔═╡ 9a280f58-60f7-47f0-a6d3-467f61590e67
begin
	acc_1 = 0.0
	for i in 1:N
		acc_1 = acc_1 + i^2
	end
	acc_1
end

# ╔═╡ bbede3ac-8d31-44e8-9321-f0bce5124365
md"""
Another alternative is to write the for loop using the following comprehension syntax:
"""

# ╔═╡ aa13a9ee-ae07-43d2-b80b-62ee8bf65647
sum([ i^2 for i in 1:N ])

# ╔═╡ 3f891531-99ef-4239-a59d-80b560defc97
md"""
Observe that the for loop with comprehensions syntax computes an array with the elements of the summation:
"""

# ╔═╡ 92701d70-f680-4cd7-808c-0ed294a548b2
[ i^2 for i in 1:N ]

# ╔═╡ 22d59e10-3409-4224-b763-1a87cd558bac
md"""
## Double summation
"""

# ╔═╡ 0c9be490-b3cc-45ad-9a88-51e104fe6ff9
md"""
Now we can extend these calculations to double summations:

$\sum_{i=1}^{N} \sum_{j=1}^{M} (i+j)^2$ where N = 5, and M = 3

"""

# ╔═╡ 0c61261b-1b84-448c-b571-e76141bb089e
md"""
We need to define M first (N was already defined)
"""

# ╔═╡ a43d4b9c-c300-45f6-b656-e6ce20d80dea
M = 3

# ╔═╡ 231244ba-a6b5-4347-b480-6ff284c18904
md"""
The following compact form can compute the elements of the summation
"""

# ╔═╡ a9d98de7-93e6-46af-8601-591dfa2b0a9f
[ (i+j)^2 for i in 1:N for j in 1:M ]

# ╔═╡ 79f6b1c9-7b6e-4133-b832-631ad78df985
md"""
Then, if we want to compute the summation results, we can use sum, as before:
"""

# ╔═╡ 2384d91b-f743-4fdb-ba2e-fab265ca01ad
sum([ (i+j)^2 for i in 1:N for j in 1:M ])

# ╔═╡ 8c9ac3cf-1e3d-4708-af94-5a26277a54b6
md"""
The last compact code respond to a more Julia-like style
"""

# ╔═╡ 31a3c85f-5371-4ecc-8a1a-e8e4ce953885
md"""
Task: Compute the summation using for loops
"""

# ╔═╡ 1a753c8d-370a-4c3d-aef3-0a5fb4e00e57
begin
	acc_2 = 0.0
	### COMPLETE ##########
end

# ╔═╡ Cell order:
# ╟─fb1cddf6-1ed0-11ee-2751-c92b157f5013
# ╟─f9417982-94d0-4790-bf26-f353efe608fd
# ╟─754360d6-8b3e-432a-b505-367abeb556e2
# ╟─c86a2993-29bf-453f-8aca-cfddf64a991c
# ╟─89989c0b-8afc-41ed-b917-91720dc89e61
# ╟─623e469d-9ef5-4827-9c7d-9f84ecccdb93
# ╠═d3ec0eaf-f490-43c5-9fd6-e8e1358ac7f5
# ╟─952036a5-2ec9-41d6-8ace-20e7cb4235b7
# ╠═2b7294d3-bc77-4d74-9489-1f80b130d8c1
# ╟─fc053948-b1e5-4efa-93d0-47162217393d
# ╠═37a537ea-31fb-4ca7-8824-eaf7682ccdef
# ╟─ecbf637c-2d90-4b0e-a1a2-26f50dd3c6ad
# ╠═094e04ae-fb71-471e-b0c8-b39f2de0fe9c
# ╟─0cbca06f-2293-48ae-87c7-c4afaba5cca5
# ╠═9a280f58-60f7-47f0-a6d3-467f61590e67
# ╟─bbede3ac-8d31-44e8-9321-f0bce5124365
# ╠═aa13a9ee-ae07-43d2-b80b-62ee8bf65647
# ╟─3f891531-99ef-4239-a59d-80b560defc97
# ╠═92701d70-f680-4cd7-808c-0ed294a548b2
# ╟─22d59e10-3409-4224-b763-1a87cd558bac
# ╟─0c9be490-b3cc-45ad-9a88-51e104fe6ff9
# ╟─0c61261b-1b84-448c-b571-e76141bb089e
# ╠═a43d4b9c-c300-45f6-b656-e6ce20d80dea
# ╟─231244ba-a6b5-4347-b480-6ff284c18904
# ╠═a9d98de7-93e6-46af-8601-591dfa2b0a9f
# ╟─79f6b1c9-7b6e-4133-b832-631ad78df985
# ╠═2384d91b-f743-4fdb-ba2e-fab265ca01ad
# ╟─8c9ac3cf-1e3d-4708-af94-5a26277a54b6
# ╟─31a3c85f-5371-4ecc-8a1a-e8e4ce953885
# ╠═1a753c8d-370a-4c3d-aef3-0a5fb4e00e57
