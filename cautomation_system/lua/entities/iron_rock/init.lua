AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self.Entity:SetModel( "models/props_wasteland/rockgranite02a.mdl" )
self.Entity:SetMaterial("phoenix_storms/concrete0")
self.Entity:SetColor(Color(161, 157, 148,255))
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )         
self.Entity:SetUseType(SIMPLE_USE)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.mined = false

 self.hitsneeded = math.random( 10,20 ) 
end






function ENT:OnTakeDamage(dmg)

	local player = dmg:GetAttacker()


if( player:IsPlayer() and self.mined == false and IsValid(player:GetActiveWeapon()) and player:GetActiveWeapon():GetClass() == "basic_pickaxe"  or player:GetActiveWeapon():GetClass() == "pickaxe" ) then

if(self.hitsneeded <= 0) then return; end 
 
	self.hitsneeded = self.hitsneeded - dmg:GetDamage(); 
 
	if(self.hitsneeded <= 0) then 
		self.mined = true
		local oremine = ents.Create("ironore")
			oremine:SetPos(self:GetPos() + Vector(0, 0, 50))
			oremine:Spawn()
			until_restore = CurTime() + 5
end

else
	---darkrp effect
end

end


function ENT:Think()


local precents = self.hitsneeded / 20 * 100 ---- it takes the hits needed and does the % formula to get precent hit


self:SetNWString('minedprecent',precents.. "% Of Iron Left to Mine")
if self.mined == true then
if CurTime() < until_restore then return end
self.hitsneeded = math.random( 10,20  )
self.mined = false
end 

end

	