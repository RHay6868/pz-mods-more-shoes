require "Items/ItemPicker"
require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

MoreShoes = MoreShoes or {};

function MoreShoes:addDistributions(itemsAndChances, locations)
	for item, chance in pairs(itemsAndChances)
	do
		for i, location in ipairs(locations)
		do
			if ProceduralDistributions.list[location] and ProceduralDistributions.list[location].items
			then
				table.insert(ProceduralDistributions.list[location].items, item);
				table.insert(ProceduralDistributions.list[location].items, chance);
			end
		end
	end
end

local function updateDistributionsMoreShoes()

    local sVars = SandboxVars.MoreShoes or {};
    sVars.AddLoot = sVars.AddLoot or 1;
    sVars.AddRarity = sVars.AddRarity or 5;
    sVars.AddNewJordans = sVars.AddNewJordans or true;

    local Common = sVars.AddRarity * sVars.AddLoot * 1.0;
    local LowRarity = sVars.AddRarity * sVars.AddLoot * 0.1;
    local MidRarity = sVars.AddRarity * sVars.AddLoot * 0.01;
    local HighRarity = sVars.AddRarity * sVars.AddLoot * 0.001;

    if sVars.AddNewJordans then
        MoreShoes:addDistributions({
            -- New Jordans
            ["MoreShoes.Shoes_Jordan1s_2"] = HighRarity,
            ["MoreShoes.Shoes_Jordan1s_3"] = HighRarity,
            ["MoreShoes.Shoes_Jordan1s_Special"] = HighRarity,

        }, {
            "CrateFootwearRandom",
            "GymLockers",
            "LivingRoomSideTable",
            "ClothingStoresShoes",
        });

    else
        MoreShoes:addDistributions({
            -- New Jordans
            ["MoreShoes.Shoes_Jordan1s_2"] = HighRarity,
            ["MoreShoes.Shoes_Jordan1s_3"] = HighRarity,
            ["MoreShoes.Shoes_Jordan1s_Special"] = HighRarity,
        }, {
        });
    end

    MoreShoes:addDistributions({
        --General Shoes
        ["MoreShoes.Shoes_Uggs"] = LowRarity,
        ["MoreShoes.Shoes_Converse"] = LowRarity,
        ["MoreShoes.Shoes_Timberlands"] = LowRarity,
        ["MoreShoes.Shoes_HikingBoots"] = LowRarity,
        ["MoreShoes.Shoes_NewBalance"] = LowRarity,
        ["MoreShoes.Shoes_SlipOnSneakers"] = LowRarity,
        ["MoreShoes.Shoes_CalfConverse"] = LowRarity,
        ["MoreShoes.Shoes_ClothBoots"] = LowRarity,
    }, {
        "ClothingStorageFootwear",
        "ClothingStoresShoes",
        "ClothingStoresBoots",
        "SchoolLockers",
        "WardrobeWoman",
        "WardrobeMan",
        "WardrobeRedneck",
    });

    MoreShoes:addDistributions({
        --Rare Shoes
        ["MoreShoes.Shoes_WesternBoots"] = HighRarity,
        ["MoreShoes.Shoes_AnkleBoots"] = HighRarity,
        ["MoreShoes.Shoes_SpikedBoots"] = HighRarity,
        ["MoreShoes.Shoes_LacedUpBooties"] = HighRarity,
        ["MoreShoes.Shoes_SpurredBoots"] = HighRarity,
        ["MoreShoes.Shoes_SuedeLitaBoots"] = HighRarity,
        ["MoreShoes.Shoes_FurLinedCalfBoots"] = HighRarity,
        ["MoreShoes.Shoes_GucciBoots"] = HighRarity,
        ["MoreShoes.Shoes_ChampagneBoots"] = HighRarity,
        ["MoreShoes.Shoes_MarisolBoots"] = HighRarity,
        ["MoreShoes.Shoes_DiplomatBoots"] = HighRarity,
        ["MoreShoes.Shoes_WorkUniformBoots"] = HighRarity,
        ["MoreShoes.Shoes_ThighHighHeels"] = HighRarity,
        ["MoreShoes.Shoes_PirateBoots"] = HighRarity,
        ["MoreShoes.Shoes_RaverBoots"] = HighRarity,
        ["MoreShoes.Shoes_PunkBoots"] = HighRarity,
        ["MoreShoes.Shoes_SpikedHeels"] = HighRarity,
    }, {
        "CrateFootwearRandom",
        "ClothingStorageFootwear",
        "ClothingStoresShoes",
        "ClothingStoresBoots",
        "GymLockers",
        "WardrobeWoman",
        "WardrobeMan",
        "WardrobeRedneck",
    });

    MoreShoes:addDistributions({
        --Very Rare Shoes
        ["MoreShoes.Shoes_AirJordans"] = HighRarity,
        ["MoreShoes.Shoes_Jordan1s"] = HighRarity,
        ["MoreShoes.Shoes_LockhartBoots"] = HighRarity,
    }, {
        "CrateFootwearRandom",
        "GymLockers",
    });

    MoreShoes:addDistributions({
        --Bar Shoes
        ["MoreShoes.Shoes_LockhartBoots"] = MidRarity,
        ["MoreShoes.Shoes_WesternBoots"] = MidRarity,
        ["MoreShoes.Shoes_SpikedBoots"] = MidRarity,
        ["MoreShoes.Shoes_SpurredBoots"] = MidRarity,
        ["MoreShoes.Shoes_PirateBoots"] = MidRarity,
    }, {
        "BarCounterMisc",
        "GymLockers",
    });

    MoreShoes:addDistributions({
        --Camping Options
        ["MoreShoes.Shoes_HikingBoots"] = MidRarity,
        ["MoreShoes.Shoes_Uggs"] = MidRarity,
        ["MoreShoes.Shoes_ClothBoots"] = MidRarity,
        ["MoreShoes.Shoes_DiplomatBoots"] = MidRarity,
        ["MoreShoes.Shoes_FurLinedCalfBoots"] = MidRarity,
    }, {
        "CampingLockers",
        "CampingStoreClothes",
        "ClothingStorageWinter",
        "HuntingLockers",
    });

    MoreShoes:addDistributions({
        --Fashion Options
        ["MoreShoes.Shoes_AnkleBoots"] = LowRarity,
        ["MoreShoes.Shoes_LacedUpBooties"] = LowRarity,
        ["MoreShoes.Shoes_WorkUniformBoots"] = LowRarity,
        ["MoreShoes.Shoes_ThighHighHeels"] = LowRarity,
    }, {
        "StripClubDressers",
    });

    MoreShoes:addDistributions({
        --Slipper Options
        ["MoreShoes.Shoes_SlippersBunny"] = LowRarity,
        ["MoreShoes.Shoes_SlippersCat"] = LowRarity,
        ["MoreShoes.Shoes_SlippersTeddy"] = LowRarity,
    }, {
        "StripClubDressers",
        "WardrobeMan",
        "WardrobeRedneck",
        "WardrobeWoman",
    });

    MoreShoes:addDistributions({
        --Other Slipper Options
        ["MoreShoes.Shoes_SlippersBunny"] = HighRarity,
        ["MoreShoes.Shoes_SlippersCat"] = HighRarity,
        ["MoreShoes.Shoes_SlippersTeddy"] = HighRarity,
        ["MoreShoes.Shoes_ReindeerSlippers"] = HighRarity,
    }, {
        "ClothingStoresSummer",
        "PoolLockers",
    });

    MoreShoes:addDistributions({
        --Lab Boot Options
        ["MoreShoes.Shoes_LabBoots"] = HighRarity,
    }, {
        "ArmyStorageMedical",
        "DrugLabOutfit",
        "MedicalClinicOutfit",
        "MedicalStorageOutfit",
        "SafehouseMedical",
    });
end

Events.OnPreDistributionMerge.Add(updateDistributionsMoreShoes);