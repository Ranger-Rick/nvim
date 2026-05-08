local options = {
    'Delivery',
    'DriveThru',
    'Inventory',
    'Api',
}

local function GetRestorePath(option)
    local prefix = 'legacy/PioneerRx.Mobile.Apps/'
    local restore = ''
    if option == 'Delivery' then
        restore = prefix .. 'Delivery/Delivery.Maui/Delivery.Maui.csproj'
    end

    if option == 'DriveThru' then
        restore = prefix .. 'DriveThru/DriveThru/DriveThru.Maui/DriveThru.Maui.csproj'
    end

    if option == 'Inventory' then
        restore = prefix .. 'Inventory/Inventory/Inventory.Maui/Inventory.Maui.csproj'
    end

    if option == 'Api' then
        restore = 'legacy/PioneerRx.Mobile.Api/WebApi/WebApi.csproj'
    end

    return restore
end

function DotnetRestoreLegacyMonoRepo()
    vim.ui.select(
        options,
        { prompt = 'Select project to restore' },
        function (option)
            local restore = GetRestorePath(option)
            if restore == '' then
                return;
            end
            vim.cmd('! dotnet restore ' .. restore)
        end
    )
end
