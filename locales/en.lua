local Translations = {
    error = {
        no_item = 'You are missing %{item}!',
        no_coca_leaf = "You're missing Coca Leaves!",
        no_bakingsoda_amount = "You will need %{value} baking soda!",
        no_bakingsoda = "You will need baking soda!",
		no_coke_amount = "You will need %{value} cocaine!",
        no_coke = "You need raw cocaine!",
		no_coke_bag = "You need processed coke bags!",
        not_all_items = "You don't have the items you need!",
        already_processing = "Please wait before processing again!",
        too_far = "Processing was canceled because you left the area!",
        no_sulfuric_acid = "You are missing sulfuric acid!",
		no_xp = "You don't have the XP to do that!",
		no_rep = "You don't have the rep to do that!",
    },
    success = {
    
        coke = "Coca leaves successfully processed!",
        coke_cut = "Raw coke successfully cut!",
        coke_brick = "Coke brick pressed for distribution!",
		coke_break = "Coke brick broke down for distribution!",
		cook_crack = "Crack has been cooked!",
        chemicals = "Successfully collected chemicals!",
        coca_leaf = "Successfully collected coca leaves!",
        joint = "You have successfully rolled a joint!",
        baggy = "You have successfully bagged up some skunk!",
		coke_small_brick ="1/4 Coke brick pressed for distribution!",
		coke_qbreak ="Coke brick broke down for distribution!",
    },
    info = {
		Enter_CokeLab = "[E] to Enter the Coke Room",
		Exit_CokeLab = "[E] to Exit the Coke Room",
    },
    progressbar = {
        processing = "Processing...",
        packing = "Packaging...",
        collecting = "Collecting......",
        pickup_chemicals = "Pick up chemicals...",
        rolling_joint = "Rolling Joint",
        bagging_skunk = "Bagging Skunk",
		cutting = "Cutting Coke",
		cookingcrack = "Cooking Crack",
		breaking = "Breaking Brick Down",
    },
    items = {
        sulfuric_acid = "Sulfuric acid",
        coca_leaf = "Coca leaf",
    },
    menu = {
        chemMenuHeader = "Chemistry menu",
        chemicals = "x1 Chemicals",
        close = "Close",
        closetxt = "Close menu",
    },
    target = {
        talk_to_draco = "Talk to Zara",
        bagging = "Packaging",
        keypad = "Exit lab",
        cokeleafproc = "Process Coca Leaves",
        cokepowdercut = "Cut Raw Coke",
        pickCocaLeaves = "Collect Coca Leaves",
        pickSulfuric = "Collect Sulfuric Acid",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
