AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

online = true

function ENT:Initialize()
self.Entity:SetModel( "models/props_combine/combinethumper001a.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
self.Entity:SetUseType(SIMPLE_USE)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then

phys:Wake()
end
 self.turnon = false

end

function ENT:Use()
print("touch")
if self.turnon == true then
	self.turnon = false    ---- basicly tells if you press e and its off it turns on and if you press e and its on it turns it off
else
	self.turnon = true
end


if self.turnon == true then -----startup sound
	Entity(1):EmitSound( "ambient/machines/thumper_startup1.wav" )
end

if self.turnon == false then  ---- turnoff sound
	Entity(1):EmitSound( "ambient/machines/thumper_shutdown1.wav" )
end


timer.Create( "hit_sound", 2.5, 0, function()	-------- every 2.5 seconds it runs the hit sound
	if self.turnon == true then
	Entity(1):EmitSound( "ambient/machines/thumper_top.wav" ) 
	timer.Adjust("hit_sound", 3, 0)
	Entity(1):EmitSound( "ambient/machines/thumper_hit.wav" )  
	timer.Adjust("hit_sound", 2.5, 0)
end
end)




end



function ENT:Think()
	
if self.turnon == true then    ----- changes the sign from Online to Offline 
	self:SetNWString( "Status", "Online" ) 
	Entity(1):SetNWBool("if online", true) 
else
	self:SetNWString( "Status", "Offline" )
	Entity(1):SetNWBool("if online", false) 
 
end

end


function ENT:OnRemove()
self:SetNWBool( "if online", false )

end