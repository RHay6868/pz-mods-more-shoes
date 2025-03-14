local MoreShoes = MoreShoes or {};

local sVars = SandboxVars.MoreShoes or {};
sVars.VanillaStandaloneConditions = sVars.VanillaStandaloneConditions or false
sVars.VanillaStandalonePatched = sVars.VanillaStandalonePatched or false
sVars.VanillaStandaloneRunSpeedModifier = sVars.VanillaStandaloneRunSpeedModifier or false;
sVars.VanillaStandaloneCombatSpeedModifier = sVars.VanillaStandaloneCombatSpeedModifier or false;

local defaultParams = {
    CanHaveHoles = true,
    ConditionLowerChanceOneIn = 20,
    RunSpeedModifier = 1,
    CombatSpeedModifier = 1
}

local vanillaStandaloneShoes = {
    "ArmyBoots", "ArmyBootsDesert", "ArmyBootsOlive", "ArmyBootsWoodland", "Black", "BlackBoots", 
    "BlueTrainers", "Brown", "Random", "RedTrainers", "RidingBoots", 
    "Slippers", "TrainerTINT", "Wellies", "FlipFlop", "Bowling", 
    "Fancy", "Sandals", "Strapped"
}


local function VanillaAdditionsStats()
    for _, shoe in ipairs(vanillaStandaloneShoes) do
        local itemName = "MoreShoes.Shoes_" .. shoe
        local item = ScriptManager.instance:getItem(itemName)
        if item then
            -- Apply condition-related parameters only if VanillaStandaloneConditions is true
            if sVars.VanillaStandaloneConditions then 
                item:DoParam("CanHaveHoles = " .. tostring(defaultParams.CanHaveHoles))
                item:DoParam("ConditionLowerChanceOneIn = " .. defaultParams.ConditionLowerChanceOneIn)
            end

            -- Apply patched fabric type if necessary
            if sVars.VanillaStandalonePatched then
                item:DoParam("FabricType = Leather")
            end

            -- Handle Run Speed Modifier
            if sVars.VanillaStandaloneRunSpeedModifier then
                item:DoParam("RunSpeedModifier = 1")
            end

            -- Handle Combat Speed Modifier
            if sVars.VanillaStandaloneCombatSpeedModifier then
                item:DoParam("CombatSpeedModifier = 1")
            end
        end
    end
end

Events.OnGameStart.Add(VanillaAdditionsStats)