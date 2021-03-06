extends Node

enum raw {mine1, mine2, mine3}
enum power {power1, power2, power3}
enum science {science1, science2, science3}
enum missile {missile1, missile2, missile3}
enum laser {laser1, laser2, laser3}
enum shield {shield1, shield2, shield3}

enum territory_types {normal, resource, destroyed}
enum resource_types {raw, power, science, EXCEPTION}
# capital since used in GameBuildingButton/Map scene to instance respective scenes
enum game_buildings {Mine, PowerPlant, ScienceLab, Radar, Missile, Laser, Shield}
