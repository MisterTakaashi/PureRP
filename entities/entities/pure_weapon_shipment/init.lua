AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function ENT:Initialize()
	self.damage = 100

	self:SetModel("models/props_junk/wood_crate001a.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
 
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:OnTakeDamage(dmg)
    self:TakePhysicsDamage(dmg)
    if not self.locked then
        self.damage = self.damage - 20

        if self.damage <= 0 then
            self:Destruct()
        end
    end
end

function ENT:Destruct()
    local vPoint = self:GetPos()

    for i = 1, self.nbr do
        local weapon = ents.Create(self.weaponClass)
        weapon:SetPos(vPoint + Vector(0, 0, i * 10))
        weapon:Spawn()
    end

    self:Remove()
end

function ENT:SetClassWeapon(class)
	self.weaponClass = class
end

function ENT:SetNumber(nbr)
    self.nbr = nbr
end
 
function ENT:Think()
    -- We don't need to think, we are just a prop after all!
end