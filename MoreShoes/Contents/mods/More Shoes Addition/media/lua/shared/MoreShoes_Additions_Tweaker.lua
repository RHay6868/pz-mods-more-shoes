local MoreShoes = MoreShoes or {};

local sVars = SandboxVars.MoreShoes or {};
sVars.AdditionsConditions = sVars.AdditionsConditions or false;
sVars.AdditionsPatched = sVars.AdditionsPatched or false;
sVars.RemoveRunSpeedModifier = sVars.RemoveRunSpeedModifier or false;
sVars.RemoveCombatSpeedModifier = sVars.RemoveCombatSpeedModifier or false;

local defaultParams = {
    CanHaveHoles = true,
    ConditionLowerChanceOneIn = 20,
    RunSpeedModifier = 1,
    CombatSpeedModifier = 1
}

local shoes = {
    "AirJordans", "Converse", "Jordan1s", "Jordan1s_2", "Jordan1s_3", "Jordan1s_Special", 
    "Jordan1Original", "Timberlands", "LockhartBoots", "WesternBoots", "Uggs", 
    "AnkleBoots", "HikingBoots", "SpikedBoots", "LacedUpBooties", "LabBoots", 
    "SlippersBunny", "SlippersCat", "SlippersTeddy", "ZoidbergSlippers", "PASneakers",
    "RaverBoots", "NewBalance", "SuedeLitaBoots", "PunkBoots", "ReindeerSlippers",
    "FurLinedCalfBoots", "GucciBoots", "ChampagneBoots", "MarisolBoots", "SlipOnSneakers",
    "DiplomatBoots", "SpurredBoots", "PirateBoots", "ClothBoots", "SpikedHeels",
    "WorkUniformBoots", "CalfConverse", "ThighHighHeels"
}

local function AdditionsStats()
    for _, shoe in ipairs(shoes) do
        local itemName = "MoreShoes.Shoes_" .. shoe
        local item = ScriptManager.instance:getItem(itemName)
        if item then
            -- Apply condition-related parameters only if AdditionsConditions is true
            if sVars.AdditionsConditions then 
                item:DoParam("CanHaveHoles = " .. tostring(defaultParams.CanHaveHoles))
                item:DoParam("ConditionLowerChanceOneIn = " .. defaultParams.ConditionLowerChanceOneIn)
            end

            -- Apply patched fabric type if necessary
            if sVars.AdditionsPatched then
                item:DoParam("FabricType = Leather")
            end

            -- Handle Run Speed Modifier
            if sVars.RemoveRunSpeedModifier then
                item:DoParam("RunSpeedModifier = 1")
            end

            -- Handle Combat Speed Modifier
            if sVars.RemoveCombatSpeedModifier then
                item:DoParam("CombatSpeedModifier = 1")
            end
        end
    end
end

Events.OnGameStart.Add(AdditionsStats)