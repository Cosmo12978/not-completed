AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )


util.AddNetworkString("Pick")
util.AddNetworkString("indus_smelt")
util.AddNetworkString("prosseser")

function ENT:Initialize()
self.Entity:SetModel( "models/props_lab/workspace004.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )   
self.Entity:SetUseType(SIMPLE_USE)      
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end

self.crafting = false
self:SetNWBool( "open/close", false) 
self:SetNWBool("Pick", false)

copperinbench = 0
silverinbench = 0
ironinbench = 0
titaniuminbench = 0


end


function ENT:Use()

if self:GetNWBool( "open/close") == false then 

	self:SetNWBool( "open/close",true) 
else
	self:SetNWBool( "open/close",false) 

end

 end




 function ENT:StartTouch(ent)

if ent:GetClass() == "copper" then
	ent:Remove()
copperinbench = copperinbench + 1 

	end	

if ent:GetClass() == "silver" then
	ent:Remove()
silverinbench = silverinbench + 1 

	end	
if ent:GetClass() == "iron" then
	ent:Remove()
ironinbench = ironinbench + 1 

	end	

	if ent:GetClass() == "titanium" then
	ent:Remove()
titaniuminbench = titaniuminbench + 1 

	end	

 end

net.Receive("Pick", function(entity,ply)  Entity(1).pickaxe = true   DarkRP.notify(ply, 2, 3, "Attempting to craft")   end)
net.Receive("indus_smelt", function(entity,ply)  Entity(1).industrial_smelter = true   DarkRP.notify(ply, 2, 3, "Attempting to craft")   end)
net.Receive("prosseser", function(entity,ply)  Entity(1).prosseser_crafting = true   DarkRP.notify(ply, 2, 3, "Attempting to craft")   end)

 function ENT:Think()



if Entity(1).pickaxe == true and ironinbench >= 3 then
	Entity(1).pickaxe = false
	ironinbench = ironinbench -3
	Entity( 1 ):Give( "pickaxe" )
end


if Entity(1).industrial_smelter == true and titaniuminbench >= 6 and copperinbench >= 3 then
	Entity(1).industrial_smelter = false
	titaniuminbench = titaniuminbench -6
	copperinbench = copperinbench -3
	local smelter = ents.Create("industrial_smelter")
			smelter:SetPos(self:GetPos() + Vector(0, 0, 70))
			smelter:Spawn()
end


if Entity(1).prosseser_crafting == true and titaniuminbench >= 4 and ironinbench >= 6 then
	Entity(1).prosseser_crafting = false
	titaniuminbench = titaniuminbench -4
	ironinbench = ironinbench -6
	Entity( 1 ):Give( "prosseser" )
end


if Entity(1).pickaxe == true or Entity(1).industrial_smelter == true or Entity(1).prosseser_crafting == true then
	Entity(1).pickaxe = false 
	Entity(1).industrial_smelter = false
	Entity(1).prosseser_crafting = false
end








self:SetNWString('copperamount', copperinbench .. " Copper")
self:SetNWString('silveramount', silverinbench .. " Silver")
self:SetNWString('ironamount', ironinbench .. " Iron")
self:SetNWString('titanamount', titaniuminbench .. " Titanium")

if copperinbench == nil then
	copperinbench = 0
end

if silverinbench == nil then
	silverinbench = 0 
end

if ironinbench == nil then 
	ironinbench = 0
end
if titaniuminbench == nil then
	titaniuminbench = 0
end



 end


 function ENT:OnRemove()
copperinbench = 0
silverinbench = 0
ironinbench = 0
titaniuminbench = 0
 end
