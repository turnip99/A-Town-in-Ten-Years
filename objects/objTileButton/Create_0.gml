w = 50
h = 50
x1 = x-w/2
y1 = y-h/2
x2 = x+w/2
y2 = y+h/2
tile_type = global.args[0]
tier = global.args[1]
shortcut = global.args[2]
sprite = get_tile_sprite(tile_type)
button_name = get_tile_button_name(tile_type, tier)
selected_tile = get_selected_tile()
beneficial_neighbours = get_tile_beneficial_neighbours(tile_type)
num_beneficial_neighbours = get_num_beneficial_neighbours(selected_tile, beneficial_neighbours)
cost = get_tile_cost(selected_tile.tile_type, tile_type, selected_tile.tier)
set_tile_yields(tile_type, tier, num_beneficial_neighbours)
required_population = get_tile_required_population(tile_type, tier)
hover_steps = 0