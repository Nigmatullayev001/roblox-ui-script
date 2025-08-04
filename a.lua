-- Glass vision (to‘g‘ri oynani ko‘rsatish)
for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
	if v:IsA("Part") and v.Name == "GlassPanel" then
		if v.Material == Enum.Material.Glass then
			v.BrickColor = BrickColor.new("Lime green") -- To‘g‘ri oynani yashil qiladi
		else
			v.BrickColor = BrickColor.new("Really red") -- Soxta oyna
		end
	end
end
