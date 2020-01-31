#priority 30001
#loader contenttweaker
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Material;
import mods.contenttweaker.Part;
import mods.contenttweaker.PartBuilder;
import mods.contenttweaker.MaterialPart;
import mods.contenttweaker.RegisterMaterialPart;
import mods.contenttweaker.PartDataPiece;
import mods.contenttweaker.MaterialPartData;
import mods.contenttweaker.PartType;
import mods.contenttweaker.IItemColorSupplier;
import mods.contenttweaker.IBlockColorSupplier;
import scripts.grassUtils.StringHelperCot as StringHelper;
import scripts.grassUtils.LoggerCot as Logger;

zenClass MaterialSystemHelper {
    zenConstructor() {
    }
    var materialList as Material[string] = {};
    var partList as Part[string] = {};
    
    function registerMaterial(name as string,color as int) as Material {
        val id as string = StringHelper.toUpperCamelCase(name);
        var material as Material = MaterialSystem.getMaterialBuilder().setName(id).setColor(color).build();
        this.materialList[id] = material;
        return material;
    }

    function getMaterial(key as string) as Material {
        return MaterialSystem.getMaterial(key);
    }

    function getAllMaterials() as Material[string] {
        return MaterialSystem.getMaterials();
    }

    function registerNormalPart(name as string, type as string, hasOverlay as bool) as Part {
        val id as string = StringHelper.toSnakeCase(name);
        val oreDictID as string = StringHelper.toLowerCamelCase(name);
        var part as Part = MaterialSystem.getPartBuilder().setName(id).setPartType(MaterialSystem.getPartType(type)).setHasOverlay(hasOverlay).setOreDictName(oreDictID).build();
        this.partList[name] = part;
        return part;
    }

    function registerSpecialPart(name as string, hasOverlay as bool, fx as RegisterMaterialPart) as Part {
        // TODO
        return null;
    }

    function getPart(key as string) as Part {
        return MaterialSystem.getPart(key);
    }

    function getAllParts() as Part[string] {
        return MaterialSystem.getParts();
    }

    function registerAMaterialPart(materialID as string, partID as string) /* as MaterialPart */{
        /* return */this.partList[partID].registerToMaterial(this.materialList[materialID]);
    }

    function registerMaterialPartByPart(partID as string) /* as MaterialPart[] */{
        /* return */ this.partList[partID].registerToMaterials(this.materialList.values);
    }

    function registerMaterialPartByMaterial(materialID as string) /* as MaterialPart[] */{
        /* return */ this.materialList[materialID].registerParts(this.partList.values);
    }

    function registerAllMaterialParts() {
        for key in partList {
            this.registerMaterialPartByPart(key);
        }
    }
}