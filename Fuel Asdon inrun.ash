notify "ereinion";

void main() {
	int it;
	
	foreach it in get_inventory() {
		if (is_tradeable(it)) {
			if ((item_type(it) == "booze" && it.image != "martini.gif") || item_type(it) == "food") {
				if (historical_price(it) <= to_int(get_property("autoBuyPriceLimit"))) {
					print_html("<font color=088A08>Converting " + item_amount(it) + " " + ((item_amount(it) == 1)? it.name : it.plural) + ".</font>");
					#visit_url("campground.php?action=fuelconvertor&iid=" + to_int(it) + "&pwd=" + my_hash() + "&qty=" + item_amount(it));
				}
			}
		}
	}
	cli_execute("refresh inv");
}