return function(v0) --[[ Line: 1 ]]
    return {
        Typography = {
            Title = {
                Font = Enum.Font.GothamBlack, 
                FontSize = 34 * v0, 
                LineHeight = 1.2, 
                LetterSpacing = 0
            }, 
            Header = {
                Font = Enum.Font.GothamBold, 
                FontSize = 20 * v0, 
                LineHeight = 1.4, 
                LetterSpacing = 0
            }, 
            Subheader = {
                Font = Enum.Font.GothamMedium, 
                FontSize = 16 * v0, 
                LineHeight = 1.25, 
                LetterSpacing = 0
            }, 
            Body = {
                Font = Enum.Font.Gotham, 
                FontSize = 16 * v0, 
                LineHeight = 1.25, 
                LetterSpacing = 0
            }, 
            CaptionHeader = {
                Font = Enum.Font.GothamMedium, 
                FontSize = 12 * v0, 
                LineHeight = 1.15, 
                LetterSpacing = 0
            }, 
            CaptionBody = {
                Font = Enum.Font.Gotham, 
                FontSize = 12 * v0, 
                LineHeight = 1.15, 
                LetterSpacing = 0
            }, 
            Footer = {
                Font = Enum.Font.GothamMedium, 
                FontSize = 10 * v0, 
                LineHeight = 1.2, 
                LetterSpacing = 0
            }
        }, 
        Color = {
            Background = {
                Default = {
                    Color3 = Color3.new(0.13725, 0.1451, 0.15294), 
                    Transparency = 0
                }, 
                Contrast = {
                    Color3 = Color3.new(0.09804, 0.10588, 0.11373), 
                    Transparency = 0
                }, 
                Muted = {
                    Color3 = Color3.new(0.06667, 0.07059, 0.07843), 
                    Transparency = 0
                }, 
                OnHover = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0.9
                }, 
                OnPress = {
                    Color3 = Color3.new(0, 0, 0), 
                    Transparency = 0.7
                }
            }, 
            BackgroundUi = {
                Default = {
                    Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                    Transparency = 0
                }, 
                Contrast = {
                    Color3 = Color3.new(0, 0, 0), 
                    Transparency = 0.3
                }
            }, 
            Ui = {
                Default = {
                    Color3 = Color3.new(0.39608, 0.4, 0.40784), 
                    Transparency = 0
                }, 
                Muted = {
                    Color3 = Color3.new(0.06667, 0.07059, 0.07843), 
                    Transparency = 0.2
                }, 
                Emphasis = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0.7
                }
            }, 
            Text = {
                Default = {
                    Color3 = Color3.new(0.74118, 0.7451, 0.7451), 
                    Transparency = 0
                }, 
                Muted = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0.3
                }, 
                Emphasis = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0
                }, 
                Link = {
                    Color3 = Color3.new(0.32157, 0.67843, 0.95686), 
                    Transparency = 0
                }, 
                Inverse = {
                    Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                    Transparency = 0
                }
            }, 
            Icon = {
                Default = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0.3
                }, 
                Emphasis = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0
                }, 
                OnHover = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0
                }
            }, 
            Action = {
                Primary = {
                    Background = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }, 
                    Border = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }, 
                    Content = {
                        Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                        Transparency = 0
                    }
                }, 
                PrimaryBrand = {
                    Background = {
                        Color3 = Color3.new(0, 0.70588, 0.42745), 
                        Transparency = 0
                    }, 
                    Border = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }, 
                    Content = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }
                }, 
                Secondary = {
                    Background = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }, 
                    Border = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }, 
                    Content = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }
                }, 
                Alert = {
                    Background = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }, 
                    Border = {
                        Color3 = Color3.new(0.96863, 0.29412, 0.32157), 
                        Transparency = 0
                    }, 
                    Content = {
                        Color3 = Color3.new(0.96863, 0.29412, 0.32157), 
                        Transparency = 0
                    }
                }, 
                Subtle = {
                    Background = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }, 
                    Border = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }, 
                    Content = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0
                    }
                }
            }, 
            State = {
                Standard = {
                    Default = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }, 
                    Hover = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.88
                    }, 
                    Pressed = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.8
                    }
                }, 
                Lighten = {
                    Default = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }, 
                    Hover = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.88
                    }, 
                    Pressed = {
                        Color3 = Color3.new(1, 1, 1), 
                        Transparency = 0.8
                    }
                }, 
                Inverse = {
                    Default = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }, 
                    Hover = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 0.88
                    }, 
                    Pressed = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 0.8
                    }
                }, 
                Darken = {
                    Default = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 1
                    }, 
                    Hover = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 0.88
                    }, 
                    Pressed = {
                        Color3 = Color3.new(0, 0, 0), 
                        Transparency = 0.8
                    }
                }
            }, 
            Focus = {
                Start = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0
                }, 
                End = {
                    Color3 = Color3.new(0.39608, 0.4, 0.40784), 
                    Transparency = 0
                }, 
                Gradient = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0
                }
            }, 
            Common = {
                Divider = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0.8
                }, 
                Overlay = {
                    Color3 = Color3.new(0, 0, 0), 
                    Transparency = 0.5
                }, 
                DropShadow = {
                    Color3 = Color3.new(0, 0, 0), 
                    Transparency = 0.5
                }, 
                NavigationBar = {
                    Color3 = Color3.new(0.09804, 0.10588, 0.11373), 
                    Transparency = 0
                }, 
                Badge = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0
                }, 
                BadgeContent = {
                    Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                    Transparency = 0
                }, 
                Placeholder = {
                    Color3 = Color3.new(0.22353, 0.23137, 0.23922), 
                    Transparency = 0.5
                }, 
                Online = {
                    Color3 = Color3.new(0, 0.70588, 0.42745), 
                    Transparency = 0
                }, 
                Offline = {
                    Color3 = Color3.new(1, 1, 1), 
                    Transparency = 0.3
                }, 
                Alert = {
                    Color3 = Color3.new(0.96863, 0.29412, 0.32157), 
                    Transparency = 0
                }, 
                Success = {
                    Color3 = Color3.new(0, 0.70588, 0.42745), 
                    Transparency = 0
                }
            }
        }, 
        Radius = {
            None = 0, 
            Small = 4 * v0, 
            Medium = 8 * v0, 
            Large = 12 * v0, 
            XLarge = 16 * v0, 
            Circle = 9999
        }, 
        Icon = {
            Size = {
                Small = 16 * v0, 
                Medium = 36 * v0, 
                Large = 48 * v0, 
                XLarge = 96 * v0, 
                XxLarge = 192 * v0
            }
        }, 
        Stroke = {
            Input = 1 * v0, 
            Focus = 2 * v0
        }, 
        Offset = {
            Focus = {
                Standard = 6 * v0, 
                Inset = 0
            }
        }, 
        Opacity = {
            State = {
                Lighten = {
                    Hover = 0.88, 
                    Pressed = 0.8
                }, 
                Darken = {
                    Hover = 0.88, 
                    Pressed = 0.8
                }
            }
        }
    };
end;