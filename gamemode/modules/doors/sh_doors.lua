local ENTITY = FindMetaTable("Entity")

function ENTITY:isKeysOwnable()
    if not IsValid(self) then return false end
    local class = self:GetClass()

    if (class == "func_door" or class == "func_door_rotating" or class == "prop_door_rotating") then
            return true
        end
    return false
end

function ENTITY:isDoor()
    if not IsValid(self) then return false end
    local class = self:GetClass()

    if class == "func_door" or
        class == "func_door_rotating" or
        class == "prop_door_rotating" or
        class == "func_movelinear" or
        class == "prop_dynamic" then
        return true
    end
    return false
end