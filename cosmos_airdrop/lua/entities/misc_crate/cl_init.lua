include("shared.lua")

surface.CreateFont( "Crate Font", {
	font = "Roboto", 
	extended = false,
	size = 50,
	weight = 700,

} )

function ENT:Draw()
if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 1500 ) then return end

self:DrawModel()

if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 500 ) then return end
	
local ang = self:GetAngles()

ang:RotateAroundAxis( self:GetAngles():Right(),0 )
ang:RotateAroundAxis( self:GetAngles():Forward(),90 )

local pos = self:GetPos() + ang:Right() * -20 + ang:Up() * 20 + ang:Forward() * -16

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 60, -5, 43, 340,75, Color(30,30,30,255) )

	draw.SimpleText( "Misc Crate", "Crate Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()














end


