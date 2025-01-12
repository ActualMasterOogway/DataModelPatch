local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.constants);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v6 = require(l_script_FirstAncestor_0.Parent.Localization);
local v7 = require(l_script_FirstAncestor_0.Components.ChromeWindowFrame);
local v8 = require(l_script_FirstAncestor_0.Components.MarqueeScroller);
local v9 = require(l_script_FirstAncestor_0.Components.MusicIcon);
local v10 = require(l_script_FirstAncestor_0.Components.LikeButton);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagMarqueeScrollingInSongbirdWindow);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUpdateMusicLoadingState);
local v13 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUseFoundationIconButton);
local v14 = require(l_script_FirstAncestor_0.Flags.getFFlagUpdateReportModalForAudio);
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUseSmallWidthMusicIcon);
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdFixReportModalShownBehavior);
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUnverifiedMusicState);
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_createNextOrder_0 = v5.createNextOrder;
local l_useCallback_0 = v4.useCallback;
local l_useMemo_0 = v4.useMemo;
local l_useState_0 = v4.useState;
local v23 = {
    Loading = "Loading", 
    Unverified = "Unverified", 
    MeetsCriteria = "MeetsCriteria"
};
local v24 = {
    isLoading = false, 
    maxSize = Vector2.new(300, 1e999)
};
return function(v25) --[[ Line: 58 ]] --[[ Name: ChromeWindow ]]
    -- upvalues: v2 (copy), v24 (copy), l_createNextOrder_0 (copy), v3 (copy), v17 (copy), l_useMemo_0 (copy), v23 (copy), l_useLocalization_0 (copy), v12 (copy), v14 (copy), l_useCallback_0 (copy), l_useState_0 (copy), v16 (copy), v13 (copy), v4 (copy), v10 (copy), v7 (copy), v1 (copy), v15 (copy), v9 (copy), v11 (copy), v8 (copy)
    local v26 = v2.Dictionary.join(v24, v25);
    local v27 = l_createNextOrder_0();
    local v28 = v3.Hooks.useTokens().Semantic.Icon.Size[v3.Enums.IconSize.Medium];
    local v29 = if v17() then l_useMemo_0(function() --[[ Line: 66 ]]
        -- upvalues: v26 (copy), v23 (ref)
        if v26.isLoading then
            return v23.Loading;
        elseif v26.song then
            if v26.song.meetsCriteria then
                return v23.MeetsCriteria;
            else
                return v23.Unverified;
            end;
        else
            return v23.Loading;
        end;
    end, {
        v26.isLoading, 
        v26.song
    }) else nil;
    local v30 = if v17() then v29 ~= v23.MeetsCriteria else v26.isLoading or v26.song == nil;
    local v31 = l_useLocalization_0({
        windowTitle = "CoreScripts.TopBar.Music", 
        musicLoading = v12() and "CoreScripts.TopBar.MusicLoading" or nil, 
        musicUnverified = v17() and "CoreScripts.TopBar.MusicUnverified" or nil, 
        report = v14() and "CoreScripts.TopBar.Label.Report" or nil
    });
    local v32 = l_useCallback_0(function() --[[ Line: 94 ]]
        -- upvalues: v26 (copy)
        if v26.onToggleLike then
            v26.onToggleLike();
        end;
    end, {
        v26.onToggleLike
    });
    local v33 = l_useMemo_0(function() --[[ Line: 100 ]]
        -- upvalues: v26 (copy)
        if v26.song then
            return table.concat(v26.song.artists, ", ");
        else
            return nil;
        end;
    end, {
        v26.song
    });
    local v34, v35 = l_useState_0(false);
    local v37 = l_useCallback_0(function() --[[ Line: 108 ]]
        -- upvalues: v35 (copy)
        v35(function(v36) --[[ Line: 109 ]]
            return not v36;
        end);
    end, {});
    local v39 = l_useCallback_0(function(v38) --[[ Line: 115 ]]
        -- upvalues: v16 (ref), v3 (ref), v26 (copy), v37 (copy)
        if v16() then
            if v38 == v3.Enums.ControlState.Pressed then
                if v26.onReport then
                    v26.onReport();
                end;
                v37();
                return;
            end;
        elseif v26.onReport and v38 == v3.Enums.ControlState.Pressed then
            v26.onReport();
        end;
    end, {
        v26.onReport
    });
    local v40 = if v12() then if v30 then {} else {
        LikeButton = if v13() then v4.createElement(v10, {
            isFavorited = if v26.song then v26.song.isLiked else false, 
            onFavorite = v32
        }) else v4.createElement(v3.IconButton, {
            LayoutOrder = v27(), 
            icon = v26.song and v26.song.isLiked and "icons/actions/heartOn" or "icons/actions/heartOff", 
            size = v3.Enums.IconSize.Medium, 
            onActivated = v32
        })
    } else {
        LikeButton = if v30 then v4.createElement(v3.Skeleton, {
            LayoutOrder = v27(), 
            radius = v3.Enums.Radius.Medium, 
            Size = UDim2.fromOffset(32, 32)
        }) else if v13() then v4.createElement(v10, {
            isFavorited = if v26.song then v26.song.isLiked else false, 
            onFavorite = v32
        }) else v4.createElement(v3.IconButton, {
            LayoutOrder = v27(), 
            icon = v26.song and v26.song.isLiked and "icons/actions/heartOn" or "icons/actions/heartOff", 
            size = v3.Enums.IconSize.Medium, 
            onActivated = v32
        })
    };
    local v41 = {
        Menu = v4.createElement(v3.View, {
            tag = "auto-y col gap-small", 
            Size = UDim2.fromOffset(200, 0), 
            sizeConstraint = {
                MaxSize = Vector2.new(200, 1e999)
            }
        }, {
            ReportButton = v4.createElement(v3.View, {
                tag = "size-full-0 auto-y row gap-small align-y-center radius-medium", 
                onStateChanged = v39
            }, {
                Icon = v4.createElement(v3.Icon, {
                    name = "icons/actions/feedback", 
                    LayoutOrder = v27()
                }), 
                Label = v4.createElement(v3.Text, {
                    tag = "auto-xy text-title-medium content-emphasis", 
                    Text = if v14() then v31.report else "Report", 
                    LayoutOrder = v27()
                })
            })
        })
    };
    return v4.createElement(v7, {
        title = v31.windowTitle, 
        maxSize = v26.maxSize, 
        actions = v40, 
        submenu = if v16() then if v26.song then v41 else nil else v41, 
        isSubMenuOpen = v34, 
        onToggleSubMenu = v37, 
        onClose = v26.onClose
    }, {
        Body = if v12() then v4.createElement(v3.View, {
            Size = UDim2.new(1, 0, 0, v1.WINDOW_HEIGHT), 
            tag = v15() and "col auto-xy align-y-center" or "auto-xy align-y-center padding-small"
        }, {
            NoMusicFound = (if v17() then v29 == v23.Loading else v30) and v4.createElement(v3.View, {
                tag = v15() and "auto-xy row align-y-center" or "auto-xy row gap-medium align-y-center"
            }, {
                Icon = if v16() then v4.createElement(v3.View, {
                    Size = UDim2.fromOffset(v28, v28), 
                    tag = v15() and "col auto-xy align-x-center align-y-center padding-small" or "col align-x-center align-y-center"
                }, {
                    Image = v4.createElement(v3.Image, {
                        Image = "icons/common/search", 
                        Size = UDim2.fromOffset(v28, v28), 
                        LayoutOrder = v27()
                    })
                }) else v4.createElement(v3.Icon, {
                    name = "icons/common/search", 
                    size = v3.Enums.IconSize.Medium, 
                    LayoutOrder = v27()
                }), 
                Alert = v4.createElement(v3.Text, {
                    tag = "auto-xy text-body-medium content-emphasis shrink", 
                    Text = v31.musicLoading, 
                    LayoutOrder = v27()
                })
            }), 
            UnverifiedMusic = if v17() then v29 == v23.Unverified and v4.createElement(v3.View, {
                tag = v15() and "auto-xy row align-y-center" or "auto-xy row gap-medium align-y-center"
            }, {
                Icon = if v16() then v4.createElement(v3.View, {
                    Size = UDim2.fromOffset(v28, v28), 
                    tag = v15() and "col auto-xy align-x-center align-y-center padding-small" or "col align-x-center align-y-center"
                }, {
                    Image = v4.createElement(v3.Image, {
                        Image = "icons/common/search", 
                        Size = UDim2.fromOffset(v28, v28), 
                        LayoutOrder = v27()
                    })
                }) else v4.createElement(v3.Icon, {
                    name = "icons/common/search", 
                    size = v3.Enums.IconSize.Medium, 
                    LayoutOrder = v27()
                }), 
                Alert = v4.createElement(v3.Text, {
                    tag = "auto-xy text-body-medium content-emphasis shrink", 
                    Text = v31.musicUnverified, 
                    LayoutOrder = v27()
                })
            }) else nil, 
            NowPlaying = (if v17() then v29 == v23.MeetsCriteria else not v30) and v4.createElement(v3.View, {
                tag = v15() and "auto-xy row flex-between align-y-center" or "auto-xy row gap-medium flex-between align-y-center"
            }, {
                Icon = if v13() then v4.createElement(v9, {
                    layoutOrder = v27()
                }) else v4.createElement(v3.Icon, {
                    name = "icons/common/music", 
                    size = v3.Enums.IconSize.Medium, 
                    LayoutOrder = v27()
                }), 
                SongInfo = v4.createElement(v3.View, {
                    tag = "auto-xy col gap-xsmall shrink clip", 
                    LayoutOrder = v27()
                }, {
                    Title = if v11() then v4.createElement(v8, {
                        speed = v30 and 0 or nil, 
                        LayoutOrder = v27()
                    }, {
                        Label = v4.createElement(v3.Text, {
                            tag = "auto-xy shrink text-title-medium content-emphasis", 
                            Text = if v26.song then v26.song.title else ""
                        })
                    }) else v4.createElement(v3.Text, {
                        tag = "auto-xy shrink text-title-medium content-emphasis", 
                        Text = if v26.song then v26.song.title else "", 
                        LayoutOrder = v27()
                    }), 
                    Artists = v4.createElement(v3.Text, {
                        tag = "auto-xy shrink text-body-small content-default", 
                        Text = v33, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        LayoutOrder = v27()
                    })
                })
            })
        }) else v4.createElement(v3.View, {
            tag = "auto-xy row gap-medium flex-between align-y-center", 
            LayoutOrder = v27()
        }, {
            Icon = if v13() then v4.createElement(v9, {
                layoutOrder = v27()
            }) else v4.createElement(v3.Icon, {
                name = "icons/common/music", 
                size = v3.Enums.IconSize.Medium, 
                LayoutOrder = v27()
            }), 
            SongInfo = v4.createElement(v3.View, {
                tag = "auto-xy col gap-xsmall shrink clip", 
                LayoutOrder = v27()
            }, {
                Title = if v11() then v4.createElement(v8, {
                    speed = v30 and 0 or nil, 
                    LayoutOrder = v27()
                }, {
                    Label = v4.createElement(v3.Text, {
                        tag = {
                            ["shrink text-title-medium content-emphasis"] = true, 
                            ["auto-y size-full-0"] = v30, 
                            ["auto-xy"] = not v30
                        }, 
                        Text = (not v26.song or v30) and "" or v26.song.title
                    }, {
                        Loading = if v30 then v4.createElement(v3.Skeleton, {
                            Size = UDim2.fromScale(1, 1)
                        }) else nil
                    })
                }) else v4.createElement(v3.Text, {
                    tag = {
                        ["shrink text-title-medium content-emphasis"] = true, 
                        ["auto-y size-full-0"] = v30, 
                        ["auto-xy"] = not v30
                    }, 
                    Text = (not v26.song or v30) and "" or v26.song.title, 
                    LayoutOrder = v27()
                }, {
                    Loading = if v30 then v4.createElement(v3.Skeleton, {
                        LayoutOrder = v27(), 
                        Size = UDim2.fromScale(1, 1)
                    }) else nil
                }), 
                Artists = v4.createElement(v3.Text, {
                    tag = {
                        ["shrink text-body-small content-default"] = true, 
                        ["auto-y size-full-0"] = v30, 
                        ["auto-xy"] = not v30
                    }, 
                    Text = v30 and "" or v33, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    LayoutOrder = v27()
                }, {
                    Loading = if v30 then v4.createElement(v3.Skeleton, {
                        LayoutOrder = v27(), 
                        Size = UDim2.fromScale(0.5, 1)
                    }) else nil
                })
            })
        })
    });
end;