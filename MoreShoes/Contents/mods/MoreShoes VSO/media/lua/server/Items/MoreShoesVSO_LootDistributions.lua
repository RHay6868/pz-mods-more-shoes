require "Items/ItemPicker"
require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

MoreShoesVSO = MoreShoesVSO or {};

function MoreShoesVSO:addDistributions(itemsAndChances, locations)
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

local function updateDistributionsMoreShoesVSO()

    local sVars = SandboxVars.MoreShoes or {};
    sVars.Rarity = sVars.Rarity or 5;
    sVars.Loot = sVars.Loot or 1;

    local Common = sVars.Rarity * sVars.Loot * 1.0;

    MoreShoesVSO:addDistributions({
        -- Military Boot Variants
        ["Base.Shoes_ArmyBootsOlive"] = Common,
        ["Base.Shoes_ArmyBootsWoodland"] = Common,
    }, {
        "ArmyStorageOutfit",
        "ArmySurplusFootwear",
        "BandMerchShelves",
        "CampingLockers",
        "ClothingStoresBoots",
        "HuntingLockers",
        "LockerArmyBedroom",
    });
end  
    
Events.OnPreDistributionMerge.Add(updateDistributionsMoreShoesVSO);