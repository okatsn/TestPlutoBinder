### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ f19d94b2-e51d-11ea-3d64-e16ddf41cd36
using PlutoUI

# ╔═╡ 38a2d2a0-6b2c-11eb-308a-a959ed3f8f8b
PlutoUI.TableOfContents()

# ╔═╡ 596ab880-e51d-11ea-3033-7361b9601174
md"## Using HTML"

# ╔═╡ 2a58aa12-e4ec-11ea-2e3d-118878914362
@bind yourname html"<input>"

# ╔═╡ 3804e0c0-e4ec-11ea-07d7-fb145944f927
if ~isempty(yourname) # @isdefined yourname
md"Hello, $yourname"
else
md"Please Enter your name"
end

# ╔═╡ 964efbf0-5b1d-11eb-30ff-af0a001b2a64
A = 4

# ╔═╡ 7c462cd0-e4ec-11ea-2e2c-ab49fec19db9
B = 1

# ╔═╡ 4e013c20-e4ec-11ea-02dc-d76eba256b97
if !@isdefined A
	md"variable A seems to be undefined"
else
	md"A + B = $(A+B)"
end

# ╔═╡ 45bbd060-e4ed-11ea-0a02-e19c817b8019
power_emoji = "⚡"

# ╔═╡ a2c5aca0-e4ec-11ea-33b4-634fda04e0ba
@bind power_level html"<input type=range min=1 max=10 step=2>>"


# ╔═╡ 43629e20-e4ed-11ea-0f3d-a90901fd1b42

power = repeat(power_emoji, power_level)

# ╔═╡ 5ca816ee-e522-11ea-30c6-fddfe15a129e
md"#### Resources"

# ╔═╡ 7ffeb870-e522-11ea-3f13-e3626708e85e
md"We strongly recommend that you use remote media inside Pluto notebooks!"

# ╔═╡ 57b09320-e522-11ea-1236-3fb5cd743c69
md"Here is a _dog_: ![](https://fonsp.com/img/doggoSmall.jpg)"

# ╔═╡ a8bf4ea0-e522-11ea-10bc-d3edce760547
dog_url = "https://fonsp.com/img/doggoSmall.jpg"

# ╔═╡ 9c00fa60-e522-11ea-0617-cd008f763436
md"""
$(Resource(dog_url, :width => 20))
$(Resource(dog_url, :width => 50))
$(Resource(dog_url, :width => 100))
$(Resource(dog_url, 
	:width => 100, 
	:style => "filter: grayscale(100%); border: 3px solid black;"))
"""

# ╔═╡ cb226860-e522-11ea-2ee0-8f806804196d
html"""
<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/438210156" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>

"""

# ╔═╡ 6800b2f0-e51d-11ea-1c95-3d1d27869840
md"## Using PlutoUI"

# ╔═╡ 78f0f110-e51d-11ea-223c-9575f397419e
md"""Add PlutoUI by `using Pkg`, `Pkg.add("PlutoUI")`"""

# ╔═╡ dcde2620-e51d-11ea-1220-236f3273cc8e
md"#### Slider with default value"

# ╔═╡ e7ff4520-e51d-11ea-09b7-c5f5de40d201
@bind y Slider(20:2:100, default=25, show_value = true) # 'default=25' is optional

# ╔═╡ 58684730-e51e-11ea-019a-7b92c13a53b8
md"#### Number field"

# ╔═╡ 521ad050-e51e-11ea-2f9d-dd6ae5062a0d
@bind x NumberField(0:100, default=20)

# ╔═╡ 8355a870-e51e-11ea-32f5-49547927c09a
md"x=$x"

# ╔═╡ ea514b70-e51d-11ea-1f87-6dd48ea92dc7
md"y=$y"

# ╔═╡ d0d80bc0-6a5b-11eb-2615-210ead2da726
md"#### Checkbox and multiple selection"

# ╔═╡ 45efefe0-6a5c-11eb-0d0f-77fbd272f035
md"""
checkbox AA = $(@bind AA CheckBox(default = true))

checkbox BB = $(@bind BB CheckBox())
"""

# ╔═╡ a7ae5e10-6a5c-11eb-02a2-3b6ab05763b1
AA

# ╔═╡ c38968f0-6a5c-11eb-11f8-972c110e8ddc
BB

# ╔═╡ dadf7d60-6a5b-11eb-0e44-b36ca317a898
@bind a_select Radio(["key1","key2"],default="key1")

# ╔═╡ fed78f00-6a5b-11eb-1bd7-9fedb97c3c45
begin
	AAA = Dict("key1"=> 100,"key2"=>2000)[a_select]
end

# ╔═╡ 58684730-e51e-11ea-0ac5-677a8d6c5469
md"#### Change the size of an image"

# ╔═╡ 58684730-e51e-11ea-0f0f-ad0bf1d7dfe9
Resource("https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Welsh_Springer_Spaniel.jpg/640px-Welsh_Springer_Spaniel.jpg", :width => x * 5, :height => y*5)

# ╔═╡ 4ee440f0-e51f-11ea-3d71-0b9794d031cc
md"#### Text field"

# ╔═╡ 4ee440f0-e51f-11ea-39fb-f5a3307b15ec
@bind sentence TextField(default="Hello 123")

# ╔═╡ fedfd410-e51f-11ea-3e3c-3ff6a473e5a8
@bind poem TextField((30, 3), default = "Je opent en sluit je armen,\nMaar houdt niets vast.\nHet is net zwemmen")

# ╔═╡ 752bf270-e520-11ea-134b-658aad1eea46
md"#### Select"

# ╔═╡ 704ba020-e520-11ea-037f-a330f3ff28e9
@bind vegetable Select(["potato", "carrot"])

# ╔═╡ 8c2f3680-e520-11ea-2308-15df1711bed7
@bind fruit Select(["apple" => "🍎", "melon" => "🍉"])

# ╔═╡ 8dcd2f10-e520-11ea-184f-830a018d5d85
fruit

# ╔═╡ bdea3b20-e520-11ea-0aba-6df44f819ea4
md"#### Button"

# ╔═╡ b15085e0-e520-11ea-3f61-bdc88d4bcb0e
md"any cell that references clicked will re-evaluate when you click the button"

# ╔═╡ ad706580-e520-11ea-0c37-03808079a5f4
@bind go Button("Recompute")

# ╔═╡ ac4af850-e520-11ea-1697-97eb9012e6a7
let
	go
	md"I am $(rand(1:15)) years old!"
end

# ╔═╡ 0739a040-e521-11ea-28f4-ff0b0b174435
md"#### File Picker"

# ╔═╡ 0fb25b90-e521-11ea-22f2-6d976705835b
md"Pick a file and You can then read the file using Base.read(filename, type)"

# ╔═╡ 2ec0f320-e521-11ea-1c1c-05151a944828
@bind important_document FilePicker()

# ╔═╡ 24216032-e521-11ea-2939-bfb767454e2d
important_document

# ╔═╡ 443532c0-e521-11ea-1727-8576c485745c
read(important_document["name"],important_document["type"])

# ╔═╡ f7b64320-e521-11ea-1149-856b679359d0
md"#### Download button"

# ╔═╡ fe9dfe30-e521-11ea-19c8-2990b884fa2e
DownloadButton(poem, "poem.txt")

# ╔═╡ Cell order:
# ╠═38a2d2a0-6b2c-11eb-308a-a959ed3f8f8b
# ╟─596ab880-e51d-11ea-3033-7361b9601174
# ╠═3804e0c0-e4ec-11ea-07d7-fb145944f927
# ╠═2a58aa12-e4ec-11ea-2e3d-118878914362
# ╠═964efbf0-5b1d-11eb-30ff-af0a001b2a64
# ╠═4e013c20-e4ec-11ea-02dc-d76eba256b97
# ╠═7c462cd0-e4ec-11ea-2e2c-ab49fec19db9
# ╟─45bbd060-e4ed-11ea-0a02-e19c817b8019
# ╠═a2c5aca0-e4ec-11ea-33b4-634fda04e0ba
# ╠═43629e20-e4ed-11ea-0f3d-a90901fd1b42
# ╟─5ca816ee-e522-11ea-30c6-fddfe15a129e
# ╟─7ffeb870-e522-11ea-3f13-e3626708e85e
# ╠═57b09320-e522-11ea-1236-3fb5cd743c69
# ╟─a8bf4ea0-e522-11ea-10bc-d3edce760547
# ╠═9c00fa60-e522-11ea-0617-cd008f763436
# ╠═cb226860-e522-11ea-2ee0-8f806804196d
# ╟─6800b2f0-e51d-11ea-1c95-3d1d27869840
# ╟─78f0f110-e51d-11ea-223c-9575f397419e
# ╠═f19d94b2-e51d-11ea-3d64-e16ddf41cd36
# ╟─dcde2620-e51d-11ea-1220-236f3273cc8e
# ╠═e7ff4520-e51d-11ea-09b7-c5f5de40d201
# ╟─58684730-e51e-11ea-019a-7b92c13a53b8
# ╠═521ad050-e51e-11ea-2f9d-dd6ae5062a0d
# ╟─8355a870-e51e-11ea-32f5-49547927c09a
# ╟─ea514b70-e51d-11ea-1f87-6dd48ea92dc7
# ╟─d0d80bc0-6a5b-11eb-2615-210ead2da726
# ╠═45efefe0-6a5c-11eb-0d0f-77fbd272f035
# ╠═a7ae5e10-6a5c-11eb-02a2-3b6ab05763b1
# ╠═c38968f0-6a5c-11eb-11f8-972c110e8ddc
# ╠═dadf7d60-6a5b-11eb-0e44-b36ca317a898
# ╠═fed78f00-6a5b-11eb-1bd7-9fedb97c3c45
# ╟─58684730-e51e-11ea-0ac5-677a8d6c5469
# ╠═58684730-e51e-11ea-0f0f-ad0bf1d7dfe9
# ╟─4ee440f0-e51f-11ea-3d71-0b9794d031cc
# ╠═4ee440f0-e51f-11ea-39fb-f5a3307b15ec
# ╠═fedfd410-e51f-11ea-3e3c-3ff6a473e5a8
# ╠═752bf270-e520-11ea-134b-658aad1eea46
# ╠═704ba020-e520-11ea-037f-a330f3ff28e9
# ╠═8c2f3680-e520-11ea-2308-15df1711bed7
# ╟─8dcd2f10-e520-11ea-184f-830a018d5d85
# ╟─bdea3b20-e520-11ea-0aba-6df44f819ea4
# ╟─b15085e0-e520-11ea-3f61-bdc88d4bcb0e
# ╠═ad706580-e520-11ea-0c37-03808079a5f4
# ╠═ac4af850-e520-11ea-1697-97eb9012e6a7
# ╟─0739a040-e521-11ea-28f4-ff0b0b174435
# ╟─0fb25b90-e521-11ea-22f2-6d976705835b
# ╠═2ec0f320-e521-11ea-1c1c-05151a944828
# ╠═24216032-e521-11ea-2939-bfb767454e2d
# ╠═443532c0-e521-11ea-1727-8576c485745c
# ╟─f7b64320-e521-11ea-1149-856b679359d0
# ╠═fe9dfe30-e521-11ea-19c8-2990b884fa2e
