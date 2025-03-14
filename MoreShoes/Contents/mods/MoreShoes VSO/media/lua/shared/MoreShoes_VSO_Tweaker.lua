local MoreShoes = MoreShoes or {};

local sVars = SandboxVars.MoreShoes or {};
sVars.VanillaConditions = sVars.VanillaConditions or false
sVars.VanillaPatched = sVars.VanillaPatched or false
sVars.VanillaRunSpeedModifier = sVars.VanillaRunSpeedModifier or false;
sVars.VanillaCombatSpeedModifier = sVars.VanillaCombatSpeedModifier or false;

local defaultParams = {
    CanHaveHoles = true,
    ConditionLowerChanceOneIn = 20,
    RunSpeedModifier = 1,
    CombatSpeedModifier = 1
}

local vanillaShoes = {
    "ArmyBoots", "ArmyBootsDesert", "ArmyBootsOlive", "ArmyBootsWoodland", "Black", "BlackBoots", 
    "BlueTrainers", "Brown", "Random", "RedTrainers", "RidingBoots", 
    "Slippers", "TrainerTINT", "Wellies", "FlipFlop", "Bowling", 
    "Fancy", "Sandals", "Strapped"
}


local function VanillaAdditionsStats()
    for _, shoe in ipairs(vanillaShoes) do
        local itemName = "Base.Shoes_" .. shoe
        local item = ScriptManager.instance:getItem(itemName)
        if item then
            -- Apply condition-related parameters only if VanillaConditions is true
            if sVars.VanillaConditions then 
                item:DoParam("CanHaveHoles = " .. tostring(defaultParams.CanHaveHoles))
                item:DoParam("ConditionLowerChanceOneIn = " .. defaultParams.ConditionLowerChanceOneIn)
            end

            -- Apply patched fabric type if necessary
            if sVars.VanillaPatched then
                item:DoParam("FabricType = Leather")
            end

            -- Handle Run Speed Modifier
            if sVars.VanillaRunSpeedModifier then
                item:DoParam("RunSpeedModifier = 1")
            end

            -- Handle Combat Speed Modifier
            if sVars.VanillaCombatSpeedModifier then
                item:DoParam("CombatSpeedModifier = 1")
            end
        end
    end
end

Events.OnGameStart.Add(VanillaAdditionsStats)