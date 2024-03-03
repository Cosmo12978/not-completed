include("shared.lua")
surface.CreateFont( "Airdrop NPC Font", {
	font = "akbar", 
	extended = false,
	size = 50,
	weight = 700,


} )

surface.CreateFont( "Title Font", {
	font = "Default", 
	extended = true,
	size = 80,
	weight = 700,


} )

surface.CreateFont( "Describe Font", {
	font = "Default", 
	extended = true,
	size = 30,
	weight = 700,


} )

function ENT:Draw()
if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 1500 ) then return end

self:DrawModel()

if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 500 ) then return end
	
local ang = self:GetAngles()

ang:RotateAroundAxis( self:GetAngles():Right(),270 )
ang:RotateAroundAxis( self:GetAngles():Forward(),90 )

local pos = self:GetPos() + ang:Right() * -90 + ang:Up() * 0 + ang:Forward() * -17.5

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 0, 0, 43, 330,75, Color(30,30,30,255) )

	draw.SimpleText( "Airdrop Master", "Airdrop NPC Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()


 
net.Receive( "open_airdrop_menu", function()

	local airdropmaster = vgui.Create( "DFrame" ) 	
airdropmaster:SetPos(480,100)			
airdropmaster:SetSize( 900, 900 ) 				
airdropmaster:SetTitle( "" ) 		
airdropmaster:MakePopup("Airdrop NPC Font")
airdropmaster:SetDraggable(false)
airdropmaster:SetBackgroundBlur(true)
airdropmaster:ShowCloseButton(false)
airdropmaster.Paint = function()
	draw.RoundedBox( 20, 0, 0, airdropmaster:GetWide(), airdropmaster:GetTall(), Color( 38, 41, 39, 255 ) )
end


		
local ammo = vgui.Create( "DModelPanel", airdropmaster )
ammo:SetSize(180,180)
ammo:SetPos(600,100)
ammo:SetAnimSpeed(9000)
ammo:SetModel( "models/props_junk/wood_crate001a.mdl" ) 
function ammo:LayoutEntity(ent)
ent:SetAngles(Angle(0, RealTime()*30,  0)) 
ammo.DoClick = function()	
	net.Start( "ammocrate" )
	net.SendToServer()	
	airdropmaster:Close()						
end 
end
ammo:SetCamPos(Vector(0, 255, 36))




local armor = vgui.Create( "DModelPanel", airdropmaster )
armor:SetSize(180,180)
armor:SetPos(600,250)
armor:SetAnimSpeed(9000)
armor:SetModel( "models/props_junk/wood_crate001a.mdl" ) 
function armor:LayoutEntity(ent)
ent:SetAngles(Angle(0, RealTime()*30,  0)) 
armor.DoClick = function()	
	net.Start( "armorcrate" )
	net.SendToServer()	
	airdropmaster:Close()						
end 
end
armor:SetCamPos(Vector(0, 255, 36))



local medic = vgui.Create( "DModelPanel", airdropmaster )
medic:SetSize(180,180)
medic:SetPos(600,400)
medic:SetAnimSpeed(9000)
medic:SetModel( "models/props_junk/wood_crate001a.mdl" ) 
function medic:LayoutEntity(ent)
ent:SetAngles(Angle(0, RealTime()*30,  0)) 
medic.DoClick = function()	
	net.Start( "mediccrate" )
	net.SendToServer()	
	airdropmaster:Close()						
end 
end
medic:SetCamPos(Vector(0, 255, 36))


local weapon = vgui.Create( "DModelPanel", airdropmaster )
weapon:SetSize(180,180)
weapon:SetPos(600,550)
weapon:SetAnimSpeed(9000)
weapon:SetModel( "models/props_junk/wood_crate001a.mdl" ) 
function weapon:LayoutEntity(ent)
ent:SetAngles(Angle(0, RealTime()*30,  0))  
weapon.DoClick = function()	
	net.Start( "weaponcrate" )
	net.SendToServer()	
	airdropmaster:Close()						
end 
end
weapon:SetCamPos(Vector(0, 255, 36))



local title = vgui.Create( "DLabel", airdropmaster )
title:SetPos( 209, 0 )
title:SetAutoStretchVertical(true)
title:SetWrap( true )
title:SetColor(Color(255, 255, 255))
title:SetSize(1000,50)
title:SetFont("Title Font")
title:SetText("Airdrop Master")

local ammodesc = vgui.Create( "DLabel", airdropmaster )
ammodesc:SetPos( 100, 200 )
ammodesc:SetAutoStretchVertical(true)
ammodesc:SetWrap( true )
ammodesc:SetSize(1000,50)
ammodesc:SetColor(Color(255, 255, 255))
ammodesc:SetFont("Describe Font")
ammodesc:SetText( "Ammo Crate Deploy Status:")

if self:GetNWBool('ammo_color') == false then

color1 = Color(219, 35, 69)
end

if self:GetNWBool('ammo_color') == true then
color1 = Color(2, 250, 15)
end
local ammodesc = vgui.Create( "DLabel", airdropmaster )
ammodesc:SetPos( 500, 200 )
ammodesc:SetAutoStretchVertical(true)
ammodesc:SetWrap( true )
ammodesc:SetSize(1000,50)
ammodesc:SetColor(color1)
ammodesc:SetFont("Describe Font")
ammodesc:SetText(self:GetNWString('ammo_statuss'))







local armordesc = vgui.Create( "DLabel", airdropmaster )
armordesc:SetPos( 100, 350 )
armordesc:SetAutoStretchVertical(true)
armordesc:SetWrap( true )
armordesc:SetSize(1000,50)
armordesc:SetColor(Color(255, 255, 255))
armordesc:SetFont("Describe Font")
armordesc:SetText( "Armor Crate Deploy Status:")

if self:GetNWBool('armor_color') == false then

color1a = Color(219, 35, 69)
end

if self:GetNWBool('armor_color') == true then
color1a = Color(2, 250, 15)
end
local armorstat = vgui.Create( "DLabel", airdropmaster )
armorstat:SetPos( 500, 350 )
armorstat:SetAutoStretchVertical(true)
armorstat:SetWrap( true )
armorstat:SetSize(1000,50)
armorstat:SetColor(color1a)
armorstat:SetFont("Describe Font")
armorstat:SetText(self:GetNWString('armor_statuss'))




 


local medicdesc = vgui.Create( "DLabel", airdropmaster )
medicdesc:SetPos( 100, 500 )
medicdesc:SetAutoStretchVertical(true)
medicdesc:SetWrap( true )
medicdesc:SetSize(1000,50)
medicdesc:SetColor(Color(255, 255, 255))
medicdesc:SetFont("Describe Font")
medicdesc:SetText( "Medic Crate Deploy Status:")

if self:GetNWBool('medic_color') == false then

color1aa = Color(219, 35, 69)
end

if self:GetNWBool('medic_color') == true then
color1aa = Color(2, 250, 15)
end
local medicstat = vgui.Create( "DLabel", airdropmaster )
medicstat:SetPos( 500, 500 )
medicstat:SetAutoStretchVertical(true)
medicstat:SetWrap( true )
medicstat:SetSize(1000,50)
medicstat:SetColor(color1aa)
medicstat:SetFont("Describe Font")
medicstat:SetText(self:GetNWString('medic_statuss'))









local weapondesc = vgui.Create( "DLabel", airdropmaster )
weapondesc:SetPos( 100, 650 )
weapondesc:SetAutoStretchVertical(true)
weapondesc:SetWrap( true )
weapondesc:SetSize(1000,50)
weapondesc:SetColor(Color(255, 255, 255))
weapondesc:SetFont("Describe Font")
weapondesc:SetText( "Weapon Crate Deploy Status:")

if self:GetNWBool('weapon_color') == false then

color1aaa = Color(219, 35, 69)
end

if self:GetNWBool('weapon_color') == true then
color1aaa = Color(2, 250, 15)
end
local weaponstat = vgui.Create( "DLabel", airdropmaster )
weaponstat:SetPos( 500, 650 )
weaponstat:SetAutoStretchVertical(true)
weaponstat:SetWrap( true )
weaponstat:SetSize(1000,50)
weaponstat:SetColor(color1aaa)
weaponstat:SetFont("Describe Font")
weaponstat:SetText(self:GetNWString('weapon_statuss'))











local car2button = vgui.Create( "DButton", airdropmaster ) 
car2button:SetText( "Exit" )					
car2button:SetPos( 400, 800 )					
car2button:SetSize( 150, 40 )
car2button:Paint( 100, 30 )		
car2button.Paint = function() 
    surface.SetDrawColor( 255, 0, 0,1000 ) 
    surface.DrawRect( 0, 0, car2button:GetWide(), car2button:GetTall())

  	end
car2button.DoClick = function()	
	airdropmaster:Close()						
end 



 	







end)
  


 








end















