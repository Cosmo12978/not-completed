include("shared.lua")
include("carlist_config.lua")
surface.CreateFont( "Vehicle NPC Font", {
	font = "akbar", 
	extended = false,
	size = 50,
	weight = 700,
	blursize = 0,
	scanlines = 0,

} )

surface.CreateFont( "Vehicle Title Font", {
	font = "Default", 
	extended = true,
	size = 80,
	weight = 700,
	blursize = 0,
	scanlines = 0,
	italic = true,

} )

surface.CreateFont( "Describe Title Font", {
	font = "Default", 
	extended = true,
	size = 30,
	weight = 700,
	blursize = 0,
	scanlines = 0,
	italic = false,

} )

surface.CreateFont( "Describe Car Font", {
	font = "Default", 
	extended = true,
	size = 20,
	weight = 700,
	blursize = 0,
	scanlines = 0,
	italic = false,

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

	draw.SimpleText( "Vehicle NPC", "Vehicle NPC Font", 163, 80, Color(255,255,255), 1, 1 )

cam.End3D2D()


 
net.Receive( "shop_open", function()

	local Cardealer = vgui.Create( "DFrame" ) 	
Cardealer:SetPos(430,100)			
Cardealer:SetSize( 1000, 800 ) 				
Cardealer:SetTitle( "" ) 		
Cardealer:MakePopup("Vehicle Title Font")
Cardealer:SetDraggable(false)
Cardealer:SetBackgroundBlur(true)
Cardealer:ShowCloseButton(false)

local background = vgui.Create("DImage", Cardealer)
background:SetPos(0, 0)	
background:SetSize(1000, 800)	
background:SetImage("materials/pngs/showroom.png")








 





--------------------------CAR--------------------------

local cartitle = vgui.Create( "DLabel", Cardealer )
cartitle:SetPos( 400, 100 )
cartitle:SetAutoStretchVertical(true)
cartitle:SetWrap( true )
cartitle:SetSize(1000,50)
cartitle:SetColor(Color(250, 250, 250))
cartitle:SetFont("Vehicle Title Font")
cartitle:SetText("Dukes")



local carcost = vgui.Create( "DLabel", Cardealer )
carcost:SetPos( 370, 500 )
carcost:SetAutoStretchVertical(true)
carcost:SetWrap( true )
carcost:SetSize(1000,50)
carcost:SetColor(Color(250, 250, 250))
carcost:SetFont("Describe Title Font")
carcost:SetText( "Car Cost:")

local carcostcolor = vgui.Create( "DLabel", Cardealer )
carcostcolor:SetPos( 490, 500 )
carcostcolor:SetAutoStretchVertical(true)
carcostcolor:SetWrap( true )
carcostcolor:SetSize(1000,50)
carcostcolor:SetColor(Color(4, 255, 0))
carcostcolor:SetFont("Describe Title Font")
carcostcolor:SetText( "$100,000")

local carbreifdesc = vgui.Create( "DLabel", Cardealer )
carbreifdesc:SetPos( 370, 530 )
carbreifdesc:SetAutoStretchVertical(true)
carbreifdesc:SetWrap( true )
carbreifdesc:SetSize(1000,50)
carbreifdesc:SetColor(Color(250, 250, 250))
carbreifdesc:SetFont("Describe Car Font")
carbreifdesc:SetText( "The Imponte Dukes is a two-door muscle car.")

local carspeedratio = vgui.Create( "DLabel", Cardealer )
carspeedratio:SetPos( 370, 560 )
carspeedratio:SetAutoStretchVertical(true)
carspeedratio:SetWrap( true )
carspeedratio:SetSize(1000,50)
carspeedratio:SetColor(Color(250, 250, 250))
carspeedratio:SetFont("Describe Car Font")
carspeedratio:SetText( "Car goes 0-60 MPH in 4.90 seconds.")

local carspeed = vgui.Create( "DLabel", Cardealer )
carspeed:SetPos( 370, 590 )
carspeed:SetAutoStretchVertical(true)
carspeed:SetWrap( true )
carspeed:SetSize(1000,50)
carspeed:SetColor(Color(250, 250, 250))
carspeed:SetFont("Describe Car Font")
carspeed:SetText( "Top Speed: 130 MPH.")

local carspeed = vgui.Create( "DLabel", Cardealer )
carspeed:SetPos( 370, 620 )
carspeed:SetAutoStretchVertical(true)
carspeed:SetWrap( true )
carspeed:SetSize(1000,50)
carspeed:SetColor(Color(250, 250, 250))
carspeed:SetFont("Describe Car Font")
carspeed:SetText( "Horse Power: 200")

local carhealth = vgui.Create( "DLabel", Cardealer )
carhealth:SetPos( 370, 650 )
carhealth:SetAutoStretchVertical(true)
carhealth:SetWrap( true )
carhealth:SetSize(1000,50)
carhealth:SetColor(Color(250, 250, 250))
carhealth:SetFont("Describe Car Font")
carhealth:SetText( "Car Health: 10,000")

		
local car1 = vgui.Create( "DModelPanel", Cardealer )
car1:SetSize(700,700)
car1:SetPos(120,-100)
car1:SetAnimSpeed(9000)
car1:SetModel( "models/blu/gtav/dukes/dukes.mdl" ) ------- Set the icon model
function car1:LayoutEntity(ent)
ent:SetAngles(Angle(0, RealTime()*30,  0)) ---- a just rotate speed 

end
car1:SetCamPos(Vector(0, 225, 36)) ------ Move the camera back and forth with 200 value place depending on how big the car is


local car1button = vgui.Create( "DButton", Cardealer ) 
car1button:SetText( "Buy" )					
car1button:SetPos( 340, 700 )					
car1button:SetSize( 150, 40 )
car1button:Paint( 100, 30 )		
car1button.Paint = function() -- The paint function
    surface.SetDrawColor( 4, 255, 0,1000 ) -- What color do You want to paint the button (R, B, G, A)	
    surface.DrawRect( 0, 0, car1button:GetWide(), car1button:GetTall())
  	end					
car1button.DoClick = function()	
	Cardealer:Close()						
	net.Start( "checkcar1" )
	net.SendToServer()	
end 

--------------------------CAR END--------------------------


nexts = nil

local nextbutton = vgui.Create( "DButton", Cardealer ) 
nextbutton:SetText( ">" )					
nextbutton:SetPos( 900, 300 )					
nextbutton:SetSize( 50, 40 )
nextbutton:Paint( 100, 30 )		
nextbutton.DoClick = function()	
 


 cartitle:SetText(carname)
 carcostcolor:SetText( cost)
 carbreifdesc:SetText( desc)
 carspeedratio:SetText( ratio)
 carspeed:SetText( speed)
 carspeed:SetText( horsepower)
 carhealth:SetText(hp)


end 


local car2button = vgui.Create( "DButton", Cardealer ) 
car2button:SetText( "Close" )					
car2button:SetPos( 540, 700 )					
car2button:SetSize( 150, 40 )
car2button:Paint( 100, 30 )		
car2button.Paint = function() -- The paint function
    surface.SetDrawColor( 255, 0, 0,1000 ) -- What color do You want to paint the button (R, B, G, A)	
    surface.DrawRect( 0, 0, car2button:GetWide(), car2button:GetTall())

  	end
car2button.DoClick = function()	
	Cardealer:Close()						
end 



 	







end)
  


 








end















