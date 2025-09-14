data:extend(
{
   {
      type = "int-setting",
      name = "ore-unlimited-yield",
      setting_type = "startup",
      minimum_value = 100,
      default_value = 100,
      maximum_value = 10000,
      order = "a1"
   },
   {
      type = "int-setting",
      name = "ore-unlimited-normal",
      setting_type = "startup",
      minimum_value = 1,
      default_value = 10000,
      maximum_value = 10000,
      order = "a2"
   },
   {
      type = "int-setting",
      name = "ore-unlimited-yield-fluid",
      setting_type = "startup",
      minimum_value = 10,
      default_value = 100,
      maximum_value = 10000,
      order = "a3"
   },
   {
      type = "int-setting",
      name = "ore-unlimited-normal-fluid",
      setting_type = "startup",
      minimum_value = 1,
      default_value = 250,
      maximum_value = 10000,
      order = "a4"
   },
   {
      type = "bool-setting",
      name = "ore-unlimited-alternative-mode",
      setting_type = "startup",
      default_value = false,
      order = "a5"
   },
})