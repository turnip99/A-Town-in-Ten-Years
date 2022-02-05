event_inherited()

global.seasons_since_courtier_encounter	+= 1
global.seasons_since_negative_encounter += 1
global.seasons_since_positive_encounter += 1
global.seasons_since_training_encounter += 1
global.seasons_since_combat_encounter += 1

var temp_gold_mod = 0
var gold_proportion_lost = -1
with objTile
{
	temp_gold_mod += seasonal_gold
}
if temp_gold_mod < 0
{
	var gold = get_stat("Gold")
	if gold + temp_gold_mod < 0
	{
		gold_proportion_lost = gold/(-temp_gold_mod)
	}
}
var temp_goods_mod = 0
var goods_proportion_lost = -1
with objTile
{
	temp_goods_mod += seasonal_goods
}
if temp_goods_mod < 0
{
	var goods = get_stat("Goods")
	if goods + temp_goods_mod < 0
	{
		goods_proportion_lost = goods/(-temp_goods_mod)
	}
}

prestige_mod = 0
defence_mod = 0
morale_mod = 0
gold_mod = 0
goods_mod = 0

with objTile
{
	var multiplier = 1
	if seasonal_gold < 0 && gold_proportion_lost != -1
	{
		multiplier *= gold_proportion_lost
	}
	if seasonal_goods < 0 && goods_proportion_lost != -1
	{
		multiplier *= goods_proportion_lost
	}
	other.prestige_mod += multiplier*seasonal_prestige
	other.defence_mod += multiplier*seasonal_defence
	other.morale_mod += multiplier*seasonal_morale
	other.gold_mod += multiplier*seasonal_gold
	other.goods_mod += multiplier*seasonal_goods
}
prestige_mod = round_min_1(prestige_mod)
defence_mod = round_min_1(defence_mod)
morale_mod = round_min_1(morale_mod)
gold_mod = round_min_1(gold_mod)
goods_mod = round_min_1(goods_mod)

population_mod = 0
var pop_min = max(5, round(5 + global.season/2 + global.base_prestige/3))
population_mod = irandom_range(pop_min, pop_min+5)
courtier = get_courtier_button("Envoy")
if courtier.toggled && get_stat("Gold")-gold_mod-get_envoy_assassin_cost(global.season-1) >= 0
{
	population_mod*=(1+courtier.rank)
	gold_mod-=get_envoy_assassin_cost(global.season-1)
}
var pop_space = get_stat("Max Population") - get_stat("Population")
if population_mod > pop_space
	population_mod = pop_space

prestige_mod = increment("Prestige", prestige_mod)
defence_mod = increment("Defence", defence_mod)
morale_mod = increment("Morale", morale_mod)
gold_mod = increment("Gold", gold_mod)
goods_mod = increment("Goods", goods_mod)
population_mod = increment("Population", population_mod)