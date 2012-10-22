local name, Backend = ...

-- Backend.Defaults["Parent"] = "TukuiBar1" -- Use Custom Parent frame


function Backend:Install()
	StaticPopup_Show("TUKUICOOLLINE_FIRSTRUN")
	Backend.CLDB.font = self["Defaults"]["Font"]
end

Backend.OnAddOnLoaded = function(self)
	self:Skin()
	if not self.Config.Installed then
		self:Install()
		self.Config.Installed = true
	end
end