local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local _ = require(l_script_FirstAncestor_0.Analysis.Types);
extractAssetIdsFromInstance = function(v2) --[[ Line: 5 ]] --[[ Name: extractAssetIdsFromInstance ]]
    local v3 = {
        Package = {}, 
        Model = {}, 
        Image = {}, 
        Mesh = {}
    };
    if v2:IsA("PackageLink") and v2.PackageId ~= "" and v2.VersionNumber > 0 then
        table.insert(v3.Package, {
            id = v2.PackageId, 
            version = v2.VersionNumber
        });
        return v3;
    elseif v2:IsA("Model") and v2.SourceAssetId > 0 then
        table.insert(v3.Model, (tostring(v2.SourceAssetId)));
        return v3;
    else
        if v2:IsA("MeshPart") and v2.MeshId ~= "" then
            table.insert(v3.Mesh, v2.MeshId);
            if v2.TextureID ~= "" then
                table.insert(v3.Image, v2.TextureID);
                return v3;
            end;
        elseif (v2.ClassName == "FileMesh" or v2.ClassName == "SpecialMesh" and v2.MeshType == Enum.MeshType.FileMesh) and v2.MeshId ~= "" then
            table.insert(v3.Mesh, v2.MeshId);
            if v2.TextureId ~= "" then
                table.insert(v3.Image, v2.TextureId);
                return v3;
            end;
        elseif v2:IsA("ImageLabel") and v2.Image ~= "" then
            table.insert(v3.Image, v2.Image);
            return v3;
        elseif v2:IsA("ImageButton") then
            if v2.Image ~= "" then
                table.insert(v3.Image, v2.Image);
            end;
            if v2.HoverImage ~= "" then
                table.insert(v3.Image, v2.HoverImage);
            end;
            if v2.PressedImage ~= "" then
                table.insert(v3.Image, v2.PressedImage);
                return v3;
            end;
        elseif v2:IsA("Decal") and v2.Texture ~= "" then
            table.insert(v3.Image, v2.Texture);
            return v3;
        elseif v2:IsA("SurfaceAppearance") and v2.ColorMap ~= "" then
            table.insert(v3.Image, v2.ColorMap);
            return v3;
        else
            return nil;
        end;
        return v3;
    end;
end;
return extractAssetIdsFromInstance;