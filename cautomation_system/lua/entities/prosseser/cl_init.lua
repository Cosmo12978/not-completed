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

surface.CreateFont( "Status Font", {
	font = "Roboto", 
	extended = false,
	size = 50,
	weight = 700,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = true,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function ENT:Draw()
status = "Offline"
if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 1500 ) then return end

self:DrawModel()

if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 500 ) then return end
	
local ang = self:GetAngles()

ang:RotateAroundAxis( self:GetAngles():Right(),180 )
ang:RotateAroundAxis( self:GetAngles():Forward(),90 )

local pos = self:GetPos() + ang:Right() * -30 + ang:Up() * 30 + ang:Forward() * -20

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 0, 0, 43, 330,75, Color(30,30,30,255) )

	draw.SimpleText( "Processor Status", "Main Machine Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()






local pos = self:GetPos() + ang:Right() * -20 + ang:Up() * 30 + ang:Forward() * -15

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 0, -50, 43, 330,75, Color(30,30,30,255) )

	draw.SimpleText( self:GetNWString('attach'), "Status Font", 100, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()


local pos = self:GetPos() + ang:Right() * -10 + ang:Up() * 30 + ang:Forward() * -20

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 0, 0, 43, 330,75, Color(30,30,30,255) )

	draw.SimpleText( self:GetNWString('running'), "Status Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()





end