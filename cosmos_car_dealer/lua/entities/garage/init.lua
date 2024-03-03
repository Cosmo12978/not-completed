AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self.Entity:SetModel( "models/gman_high.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_BBOX ) 
self.Entity:DrawShadow(false)
self.Entity:SetUseType(SIMPLE_USE)
test = self.Entity:GetCreationID()

local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
end
util.AddNetworkString("garagemenu")
util.AddNetworkString("car1_spawned")
util.AddNetworkString("car_spawn_point")


function ENT:Use(activator, ent)
net.Start("garagemenu")
net.WriteEntity(self)
net.Send(activator) 
print(id)    
end



carspawn = false

net.Receive("car1_spawned",function(ply)
if Entity(1):GetNWBool( "car1", false ) == true then
if carspawn == true then print("Cant do it") end
if carspawn == false then
	spawncar1()
carspawn = true

else
	print("You don't own this car")
end
end

end)


function spawncar1(ent)
if SetPos == nil then end
local Ent = simfphys.SpawnVehicleSimple( "sim_fphys_dukes", car_spawn_area, Angle( 0, 90, 0 ) )

end

net.Receive( "car_spawn_point", function( len )
       car_spawn_area = net.ReadVector()
       car_spawn_area:Add(Vector(0,0,50))
       print("car_spawn_area")

 
 
	end )







function ENT:Think(ent)




end














	




















