require("fusion-construction-robot") 

data:extend(
{	
	{
		type = "item",
		name = "fusion-construction-robot",
		icon = "__ReasonableFasterStart__/graphics/icons/fusion-construction-robot.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = "logistic-network",
		order = "a[robot]-b[construction-robot]-a[fusion-construction-robot]",
		place_result = "fusion-construction-robot",
		stack_size = 50
	},
})