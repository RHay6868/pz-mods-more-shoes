require "Items/ItemPicker"
require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

MoreShoesStandalone = MoreShoesStandalone or {};

function MoreShoesStandalone:addDistributions(itemsAndChances, locations)
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

local function updateDistributionsStandaloneMoreShoes()

    local sVars = SandboxVars.MoreShoes or {};
    sVars.Rarity = sVars.Rarity or 5;
    sVars.Loot = sVars.Loot or 1;
    sVars.SpawnVanillaVariants = sVars.SpawnVanillaVariants or true;

    local Common = sVars.Rarity * sVars.Loot * 1.0;
    local LowRarity = sVars.Rarity * sVars.Loot * 0.1;
    local MidRarity = sVars.Rarity * sVars.Loot * 0.01;
    local HighRarity = sVars.Rarity * sVars.Loot * 0.001;

    if sVars.SpawnVanillaVariants then
        MoreShoesStandalone:addDistributions({
            -- Military Boot Variants
            ["MoreShoes.Shoes_ArmyBoots"] = MidRarity,
            ["MoreShoes.Shoes_ArmyBootsDesert"] = MidRarity,
            ["MoreShoes.Shoes_ArmyBootsOlive"] = MidRarity,
            ["MoreShoes.Shoes_ArmyBootsWoodland"] = MidRarity,
        }, {
            "ArmyStorageOutfit",
            "ArmySurplusFootwear",
            "BandMerchShelves",
            "CampingLockers",
            "ClothingStoresBoots",
            "HuntingLockers",
            "LockerArmyBedroom",
        });

        MoreShoesStandalone:addDistributions({
            -- Shoe Variants
            ["MoreShoes.Shoes_Black"] = Common,
            ["MoreShoes.Shoes_Brown"] = Common,
            ["MoreShoes.Shoes_Random"] = Common,
            ["MoreShoes.Shoes_Bowling"] = Common,
        }, {
            "ClothingStorageFootwear",
            "ClothingStoresShoes",
            "CrateFootwearRandom",
            "WardrobeMan",
            "WardrobeRedneck",
            "WardrobeWoman",
        });

        MoreShoesStandalone:addDistributions({
            -- Boots Variants
            ["MoreShoes.Shoes_BlackBoots"] = MidRarity,
            ["MoreShoes.Shoes_RidingBoots"] = MidRarity,
        }, {
            "BandPracticeClothing",
            "BarCounterMisc",
            "CampingLockers",
            "ClothingStorageFootwear",
            "ClothingStoresBoots",
            "CrateFootwearRandom",
        });

        MoreShoesStandalone:addDistributions({
            -- Sneakers Variants
            ["MoreShoes.Shoes_BlueTrainers"] = LowRarity,
            ["MoreShoes.Shoes_RedTrainers"] = LowRarity,
            ["MoreShoes.Shoes_TrainerTINT"] = LowRarity,
        }, {

            "ClothingStorageFootwear",
            "ClothingStoresShoes",
            "GymLockers",
            "SchoolLockers",
            "SportStoreSneakers",
        });

        MoreShoesStandalone:addDistributions({
            -- Slippers and Sandals Variants
            ["MoreShoes.Shoes_Slippers"] = LowRarity,
            ["MoreShoes.Shoes_FlipFlop"] = LowRarity,
            ["MoreShoes.Shoes_Sandals"] = LowRarity,
        }, {
            "ClosetShelfGeneric",
            "ClothingStorageFootwear",
            "ClothingStoresShoes",
            "GymLockers",
            "WardrobeMan",
            "WardrobeRedneck",
            "WardrobeWoman",
        });

        MoreShoesStandalone:addDistributions({
            -- Other Variants
            ["MoreShoes.Shoes_Wellies"] = LowRarity,
            ["MoreShoes.Shoes_Fancy"] = LowRarity,
            ["MoreShoes.Shoes_Strapped"] = LowRarity,

        }, {
            "ClosetShelfGeneric",
            "ClothingStorageFootwear",
            "ClothingStoresShoes",
            "CrateFootwearRandom",
        });
    else    
        MoreShoesStandalone:addDistributions({
            --All Shoes to blank out distros, honestly probably doesn't fully work
            ["MoreShoes.Shoes_ArmyBoots"] = MidRarity,
            ["MoreShoes.Shoes_ArmyBootsDesert"] = MidRarity,
            ["MoreShoes.Shoes_ArmyBootsOlive"] = MidRarity,
            ["MoreShoes.Shoes_ArmyBootsWoodland"] = MidRarity,
            ["MoreShoes.Shoes_Black"] = Common,
            ["MoreShoes.Shoes_Brown"] = Common,
            ["MoreShoes.Shoes_Random"] = Common,
            ["MoreShoes.Shoes_Bowling"] = Common,
            ["MoreShoes.Shoes_BlackBoots"] = MidRarity,
            ["MoreShoes.Shoes_RidingBoots"] = MidRarity,
            ["MoreShoes.Shoes_BlueTrainers"] = LowRarity,
            ["MoreShoes.Shoes_RedTrainers"] = LowRarity,
            ["MoreShoes.Shoes_TrainerTINT"] = LowRarity,
            ["MoreShoes.Shoes_Slippers"] = LowRarity,
            ["MoreShoes.Shoes_FlipFlop"] = LowRarity,
            ["MoreShoes.Shoes_Sandals"] = LowRarity,
            ["MoreShoes.Shoes_Wellies"] = LowRarity,
            ["MoreShoes.Shoes_Fancy"] = LowRarity,
            ["MoreShoes.Shoes_Strapped"] = LowRarity,
        }, {
        });
    end    
end

Events.OnPreDistributionMerge.Add(updateDistributionsStandaloneMoreShoes);