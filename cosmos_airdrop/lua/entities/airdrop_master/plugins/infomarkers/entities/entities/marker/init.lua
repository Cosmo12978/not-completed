include("shared.lua")
AddCSLuaFile("cl_init.lua")

function ENT:Initialize()
    self:SetRenderMode(RENDERMODE_TRANSALPHA)
    self:DrawShadow(false)
    self:SetModel("models/squad/sf_plates/sf_plate1x1.mdl")
    self:SetMaterial("models/effects/vol_light001")
    self:SetSolid(SOLID_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_WORLD)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:EnableMotion(false)
    end
end

util.AddNetworkString("openmarkereditor")


function ENT:Use(ply, activator, Entity)
if activator == self:GetOwner() then
net.Start("openmarkereditor")
net.WriteEntity(self)
net.Send(activator) 
end
end

