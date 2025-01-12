if game:DefineFastFlag("BillboardGuiUseConnect", false) then
    return (require(script.ConnectedVersion));
else
    return (require(script.LocalFunctionVersion));
end;