include("shared.lua")

surface.CreateFont( "Main Machine Font", {
	font = "Roboto", 
	extended = false,
	size = 50,
	weight = 700,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

 

surface.CreateFont( "CraftingMenuFont", {
	font = "Arial", 
	extended = true,
	size = 20,
	weight = 100,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


function ENT:Draw(ent)
	self:DrawModel()
self:SetNWBool("Pick", false)




if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 1500 ) then return end

self:DrawModel()

if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 500 ) then return end
	
local ang = self:GetAngles()

ang:RotateAroundAxis( self:GetAngles():Right(),0 )
ang:RotateAroundAxis( self:GetAngles():Forward(),90 )

local pos = self:GetPos() + ang:Right() * -35 + ang:Up() * 21 + ang:Forward() * 30

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 0, 0, 43, 330,75, Color(30,30,30,255) )

	draw.SimpleText( "Workbench", "Main Machine Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()

-----------------------------------ores down -----


local pos = self:GetPos() + ang:Right() * -65 + ang:Up() * 15 + ang:Forward() * -45

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 0, 0, 43, 330,75, Color(30,30,30,255) )

	draw.SimpleText( self:GetNWString('copperamount'), "Main Machine Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()


local pos = self:GetPos() + ang:Right() * -55 + ang:Up() * 15 + ang:Forward() * -45

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 0, 0, 43, 330,75, Color(30,30,30,255) )

	draw.SimpleText( self:GetNWString('silveramount'), "Main Machine Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()


local pos = self:GetPos() + ang:Right() * -45 + ang:Up() * 15 + ang:Forward() * -45

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 0, 0, 43, 330,75, Color(30,30,30,255) )

	draw.SimpleText( self:GetNWString('ironamount'), "Main Machine Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()

local pos = self:GetPos() + ang:Right() * -35 + ang:Up() * 15 + ang:Forward() * -45

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 0, 0, 43, 330,75, Color(30,30,30,255) )

	draw.SimpleText( self:GetNWString('titanamount'), "Main Machine Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()










if self:GetNWBool( "open/close") == true then
	local Craftingframe = vgui.Create( "DFrame" ) 	-- The name of the panel we don't have to parent it.
Craftingframe:SetPos(300,100)			-- Set the position to 100x by 100y. 
Craftingframe:SetSize( 1000, 800 ) 				-- Set the size to 300x by 200y.
Craftingframe:SetTitle( "Crafting Menu" ) 		-- Set the title in the top left to "Derma Frame".
Craftingframe:MakePopup() 
Craftingframe:SetDraggable(false)
Craftingframe:SetBackgroundBlur(true)	
 -- Model we want for this spawn icon






local icon = vgui.Create( "ContentIcon", Craftingframe )
icon:SetPos( 0, 60 )	
icon:SetMaterial( "materials/pngs/cfactory/v_pickaxe.png" )
icon:SetName( "Pickaxe" )
icon.OpenMenu = function()
	local menu = DermaMenu()
	menu:AddOption( "Craft!", function() net.Start("Pick") net.SendToServer()   end )
	menu:AddOption( "Info", function() 

local pickdo = vgui.Create( "DFrame" ) 	
pickdo:SetPos( 100, 100 ) 				
pickdo:SetSize( 300, 200 ) 				
pickdo:SetTitle( "What does the pickaxe do?" ) 	
pickdo:ShowCloseButton(false)	
pickdo:MakePopup() 		

local DLabel = vgui.Create( "DLabel", pickdo )
DLabel:SetPos( 10,50  )
DLabel:SetSize( 300, 100 ) 
DLabel:SetText( "Used to mine ores. Better than the basic pickaxe" )


timer.Simple( 3, function() pickdo:Close() end )
  end )

menu:Open()

end

local DLabel = vgui.Create( "DLabel", Craftingframe )
DLabel:SetPos( 150, 70 )
DLabel:SetSize( 100, 100 ) 
DLabel:SetFont("CraftingMenuFont")
DLabel:SetText( "3 iron to craft" )




local icon = vgui.Create( "ContentIcon", Craftingframe )
icon:SetPos( 0, 200 )	
icon:SetMaterial( "materials/pngs/cfactory/laundry_washer001a.png" )
icon:SetName( "Industrial Smelter" )
icon.OpenMenu = function()
	local menu = DermaMenu()
	menu:AddOption( "Craft!", function() net.Start("indus_smelt") net.SendToServer()   end )
	menu:AddOption( "Info", function() 

local pickdo = vgui.Create( "DFrame" ) 	
pickdo:SetPos( 100, 100 ) 				
pickdo:SetSize( 300, 200 ) 				
pickdo:SetTitle( "What does the Industrial Smelter do?" ) 	
pickdo:ShowCloseButton(false)	
pickdo:MakePopup() 		

local DLabel = vgui.Create( "DLabel", pickdo )
DLabel:SetPos( 10,50  )
DLabel:SetSize( 300, 100 ) 
DLabel:SetText( "Used to smelt ores faster." )


timer.Simple( 3, function() pickdo:Close() end )
  end )

menu:Open()

end

local DLabel = vgui.Create( "DLabel", Craftingframe )
DLabel:SetPos( 150, 220 )
DLabel:SetSize( 300, 100 ) 
DLabel:SetFont("CraftingMenuFont")
DLabel:SetText( "6 Titanum, 3 Copper To Craft." )



------------------------------------------------------------

local icon = vgui.Create( "ContentIcon", Craftingframe )
icon:SetPos( 0, 340 )	
icon:SetMaterial( "materials/pngs/cfactory/laundry_washer003.png" )
icon:SetName( "Prosseser" )
icon.OpenMenu = function()
	local menu = DermaMenu()
	menu:AddOption( "Craft!", function() net.Start("prosseser") net.SendToServer()   end )
	menu:AddOption( "Info", function() 

local pickdo = vgui.Create( "DFrame" ) 	
pickdo:SetPos( 100, 100 ) 				
pickdo:SetSize( 300, 200 ) 				
pickdo:SetTitle( "What does the prosseser do?" ) 	
pickdo:ShowCloseButton(false)	
pickdo:MakePopup() 		

local DLabel = vgui.Create( "DLabel", pickdo )
DLabel:SetPos( 10,50  )
DLabel:SetSize( 300, 100 ) 
DLabel:SetText( "Used to crush ores with drill." )


timer.Simple( 3, function() pickdo:Close() end )
  end )

menu:Open()

end

local DLabel = vgui.Create( "DLabel", Craftingframe )
DLabel:SetPos( 150, 360 )
DLabel:SetSize( 300, 100 ) 
DLabel:SetFont("CraftingMenuFont")
DLabel:SetText( "4 Titanum, 6 Iron To Craft." )







end
self:SetNWBool( "open/close",false) 
end



