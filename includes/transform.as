﻿public function cuntChange(cArea:Number, display:Boolean, spacingsF:Boolean = false, spacingsB:Boolean = true):Boolean {
	return player.cuntChange(cArea,display,spacingsF,spacingsB);
}
public function buttChange(cArea:Number, display:Boolean, spacingsF:Boolean = true, spacingsB:Boolean = true):Boolean {
	return player.buttChange(cArea,display,spacingsF,spacingsB);
}



//Updates the player's gender
public function genderCheck():void {
	if(player.cocks.length > 0) {
		if(player.vaginas.length > 0) player.gender = 3;
		else player.gender = 1;
	}
	else {
		if(player.vaginas.length > 0) player.gender = 2;
		else player.gender = 0;
	}
	//Fertility fixing
	if(player.hasVagina() && player.fertility < 1) player.fertility = 1;
}

//Many transformations are part of items, see items.as
public function growTits(amount:Number, rowsGrown:Number, display:Boolean, growthType:Number):void {
	player.growTits(amount,rowsGrown,display,growthType);
}
				
public function shrinkTits():void {
	var temp2:Number = 0;
	var temp3:Number = 0;
	if(player.breastRows.length == 1) {
		//Shrink if bigger than N/A cups
		if(player.breastRows[0].breastRating > 0) {
			temp = 1;
			player.breastRows[0].breastRating--;
			//Shrink again 50% chance
			if(player.breastRows[0].breastRating >= 1 && rand(2) == 0 && player.hasPerk("Big Tits") < 0) {
				temp++;
				player.breastRows[0].breastRating--;
			}
			if(player.breastRows[0].breastRating < 0) player.breastRows[0].breastRating = 0;
			//Talk about shrinkage
			if(temp == 1) outputText("\n\nYou feel a weight lifted from you, and realize your breasts have shrunk!  With a quick measure, you determine they're now " + player.breastCup(0) + "s.", false);
			if(temp == 2) outputText("\n\nYou feel significantly lighter.  Looking down, you realize your breasts are much smaller!  With a quick measure, you determine they're now " + player.breastCup(0) + "s.", false);
		}
	}
	//multiple
	if(player.breastRows.length > 1) {
		outputText("\n", false);
		//temp2 = amount changed
		//temp3 = counter
		temp = 0;
		temp2 = 0;
		temp3 = player.breastRows.length;
		while(temp3 > 0) {
			temp3--;
			if(player.breastRows[temp3].breastRating > 0) {
				player.breastRows[temp3].breastRating--;
				if(player.breastRows[temp3].breastRating < 0) player.breastRows[temp3].breastRating = 0;
				temp2++;
				outputText("\n", false);
				if(temp3 < player.breastRows.length - 1) outputText("...and y", false);
				else outputText("Y", false);
				outputText("our " + breastDescript(temp3) + " shrink, dropping to " + player.breastCup(temp3) + "s.", false);
			}
			if(player.breastRows[temp3].breastRating < 0) player.breastRows[temp3].breastRating = 0;
		}
		if(temp2 == 2) outputText("\nYou feel so much lighter after the change.", false);
		if(temp2 == 3) outputText("\nWithout the extra weight you feel particularly limber.", false);
		if(temp2 >= 4) outputText("\nIt feels as if the weight of the world has been lifted from your shoulders, or in this case, your chest.", false);
	}
}

public function lengthChange(temp2:Number, cocks:Number):void {
	//DIsplay the degree of length change.
	if(temp2 <= 1 && temp2 > 0) {
		if(player.cocks.length == 1) outputText("Your " + cockDescript(0) + " has grown slightly longer.", false);
		if(player.cocks.length > 1) {
			if(cocks == 1) outputText("One of your " + multiCockDescriptLight() + " grows slightly longer.", false);
			if(cocks > 1 && cocks < player.cocks.length) outputText("Some of your " + multiCockDescriptLight() + " grow slightly longer.", false);
			if(cocks == player.cocks.length) outputText("Your " + multiCockDescriptLight() + " seem to fill up... growing a little bit larger.", false);
		}
	}
	if(temp2 > 1 && temp2 < 3) {
		if(player.cocks.length == 1) outputText("A very pleasurable feeling spreads from your groin as your " + cockDescript(0) + " grows permanently longer - at least an inch - and leaks pre-cum from the pleasure of the change.", false);
		if(player.cocks.length > 1) {
			if(cocks == player.cocks.length) outputText("A very pleasurable feeling spreads from your groin as your " + multiCockDescriptLight() + " grow permanently longer - at least an inch - and leak plenty of pre-cum from the pleasure of the change.", false);
			if(cocks == 1) outputText("A very pleasurable feeling spreads from your groin as one of your " + multiCockDescriptLight() + " grows permanently longer, by at least an inch, and leaks plenty of pre-cum from the pleasure of the change.", false);
			if(cocks > 1 && cocks < player.cocks.length) outputText("A very pleasurable feeling spreads from your groin as " + num2Text(cocks) + " of your " + multiCockDescriptLight() + " grow permanently longer, by at least an inch, and leak plenty of pre-cum from the pleasure of the change.", false);
		}
	}
	if(temp2 >=3){
		if(player.cocks.length == 1) outputText("Your " + cockDescript(0) + " feels incredibly tight as a few more inches of length seem to pour out from your crotch.", false);
		if(player.cocks.length > 1) {
			if(cocks == 1) outputText("Your " + multiCockDescriptLight() + " feel incredibly tight as one of their number begins to grow inch after inch of length.", false);
			if(cocks > 1 && cocks < player.cocks.length) outputText("Your " + multiCockDescriptLight() + " feel incredibly number as " + num2Text(cocks) + " of them begin to grow inch after inch of added length.", false);
			if(cocks == player.cocks.length) outputText("Your " + multiCockDescriptLight() + " feel incredibly tight as inch after inch of length pour out from your groin.", false);
		}
	}
	//Display LengthChange
	if(temp2 > 0) {
		if(player.cocks[0].cockLength >= 8 && player.cocks[0].cockLength-temp2 < 8){
			if(player.cocks.length == 1) outputText("  <b>Most men would be overly proud to have a tool as long as yours.</b>", false);
			if(player.cocks.length > 1) outputText("  <b>Most men would be overly proud to have one cock as long as yours, let alone " + multiCockDescript() + ".</b>", false);
		}	
		if(player.cocks[0].cockLength >= 12 && player.cocks[0].cockLength-temp2 < 12) {
			if(player.cocks.length == 1) outputText("  <b>Your " + cockDescript(0) + " is so long it nearly swings to your knee at its full length.</b>", false);
			if(player.cocks.length > 1) outputText("  <b>Your " + multiCockDescriptLight() + " are so long they nearly reach your knee when at full length.</b>", false);
		}
		if(player.cocks[0].cockLength >= 16 && player.cocks[0].cockLength-temp2 < 16) {
			if(player.cocks.length == 1) outputText("  <b>Your " + cockDescript(0) + " would look more at home on a large horse than you.</b>", false);
			if(player.cocks.length > 1) outputText("  <b>Your " + multiCockDescriptLight() + " would look more at home on a large horse than on your body.</b>", false);
			if(player.gender == 3){
				if(player.cocks.length == 1) outputText("  You could easily stuff your " + cockDescript(0) + " between your breasts and give the self-titty-fuck of a lifetime.", false);
				if(player.cocks.length > 1) outputText("  They reach so far up your chest it would be easy to stuff a few cocks between your breasts and give yourself the tittyfuck of a lifetime.", false);
			}
			if(player.gender == 1){
				if(player.cocks.length == 1) outputText("  Your " + cockDescript(0) + " is so long it easily reaches your chest.  The possibility of autofellatio is now a foregone conclusion.", false);
				if(player.cocks.length > 1) outputText("  Your " + multiCockDescriptLight() + " are so long they easily reach your chest.  Autofellatio would be about as hard as looking down.", false);
			}
		}
		if(player.cocks[0].cockLength >= 20 && player.cocks[0].cockLength-temp2 < 20) {
			if(player.cocks.length == 1) outputText("  <b>As if the pulsing heat of your " + cockDescript(0) + " wasn't enough, the tip of your " + cockDescript(0) + " keeps poking its way into your view every time you get hard.</b>", false);
			if(player.cocks.length > 1) outputText("  <b>As if the pulsing heat of your " + multiCockDescriptLight() + " wasn't bad enough, every time you get hard, the tips of your " + multiCockDescriptLight() + " wave before you, obscuring the lower portions of your vision.</b>", false);
			if(player.cor > 40 && player.cor <= 60) {
				if(player.cocks.length > 1) outputText("  You wonder if there is a demon or beast out there that could take the full length of one of your " + multiCockDescriptLight() + "?", false);
				if(player.cocks.length ==1) outputText("  You wonder if there is a demon or beast out there that could handle your full length.", false);
			}
			if(player.cor > 60 && player.cor <= 80) {
				if(player.cocks.length > 1) outputText("  You daydream about being attacked by a massive tentacle beast, its tentacles engulfing your " + multiCockDescriptLight() + " to their hilts, milking you dry.\n\nYou smile at the pleasant thought.", false);
				if(player.cocks.length ==1) outputText("  You daydream about being attacked by a massive tentacle beast, its tentacles engulfing your " + cockDescript(0) + " to the hilt, milking it of all your cum.\n\nYou smile at the pleasant thought.", false);
			}
			if(player.cor > 80) {
				if(player.cocks.length > 1) outputText("  You find yourself fantasizing about impaling nubile young champions on your " + multiCockDescriptLight() + " in a year's time.", false);
			}
		}
	}
	//Display the degree of length loss.
	if(temp2 < 0 && temp2 >= -1) {
		if(player.cocks.length == 1) outputText("Your " + multiCockDescriptLight() + " has shrunk to a slightly shorter length.", false);
		if(player.cocks.length > 1) {
			if(cocks == player.cocks.length) outputText("Your " + multiCockDescriptLight() + " have shrunk to a slightly shorter length.", false);
			if(cocks > 1 && cocks < player.cocks.length) outputText("You feel " + num2Text(cocks) + " of your " + multiCockDescriptLight() + " have shrunk to a slightly shorter length.", false);
			if(cocks == 1) outputText("You feel " + num2Text(cocks) + " of your " + multiCockDescriptLight() + " has shrunk to a slightly shorter length.", false);
		}
	}
	if(temp2 < -1 && temp2 > -3) {
		if(player.cocks.length == 1) outputText("Your " + multiCockDescriptLight() + " shrinks smaller, flesh vanishing into your groin.", false);
		if(player.cocks.length > 1) {
			if(cocks == player.cocks.length) outputText("Your " + multiCockDescriptLight() + " shrink smaller, the flesh vanishing into your groin.", false);
			if(cocks == 1) outputText("You feel " + num2Text(cocks) + " of your " + multiCockDescriptLight() + " shrink smaller, the flesh vanishing into your groin.", false);
			if(cocks > 1 && cocks < player.cocks.length) outputText("You feel " + num2Text(cocks) + " of your " + multiCockDescriptLight() + " shrink smaller, the flesh vanishing into your groin.", false);
		}
	}
	if(temp2 <= -3) {
		if(player.cocks.length == 1) outputText("A large portion of your " + multiCockDescriptLight() + "'s length shrinks and vanishes.", false);
		if(player.cocks.length > 1) {
			if(cocks == player.cocks.length) outputText("A large portion of your " + multiCockDescriptLight() + " receeds towards your groin, receding rapidly in length.", false);
			if(cocks == 1) outputText("A single member of your " + multiCockDescriptLight() + " vanishes into your groin, receding rapidly in length.", false);
			if(cocks > 1 && player.cocks.length > cocks) outputText("Your " + multiCockDescriptLight() + " tingles as " + num2Text(cocks) + " of your members vanish into your groin, receding rapidly in length.", false);
		}
	}
}

public function demonChanges():void {
	//Change tail if already horned.
	if(player.tailType != TAIL_TYPE_DEMONIC && player.horns > 0) {
		if(player.tailType != TAIL_TYPE_NONE) {
			outputText("\n\n", false);
			if(player.tailType == TAIL_TYPE_SPIDER_ADBOMEN || player.tailType == TAIL_TYPE_BEE_ABDOMEN) outputText("You feel a tingling in your insectile abdomen as it stretches, narrowing, the exoskeleton flaking off as it transforms into a flexible demon-tail, complete with a round spaded tip.  ", false);
			else outputText("You feel a tingling in your tail.  You are amazed to discover it has shifted into a flexible demon-tail, complete with a round spaded tip.  ", false);
			outputText("<b>Your tail is now demonic in appearance.</b>", false);
		}
		else outputText("\n\nA pain builds in your backside... growing more and more pronounced.  The pressure suddenly disappears with a loud ripping and tearing noise.  <b>You realize you now have a demon tail</b>... complete with a cute little spade.", false);
		dynStats("cor", 4);
		player.tailType = TAIL_TYPE_DEMONIC;	
	}
	//grow horns!
	if(player.horns == 0 || (rand(player.horns+3) == 0)) {
		if(player.horns < 12 && (player.hornType == HORNS_NONE || player.hornType == HORNS_DEMON)) {
			outputText("\n\n", false);
			if(player.horns == 0) {
				outputText("A small pair of demon horns erupts from your forehead.  They actually look kind of cute.  <b>You have horns!</b>", false);
			}
			else outputText("Another pair of demon horns, larger than the last, forms behind the first row.", false);
			if(player.hornType == HORNS_NONE) player.hornType = HORNS_DEMON;
			player.horns++;
			player.horns++;
			dynStats("cor", 3);
		}
		//Text for shifting horns
		else if(player.hornType > HORNS_DEMON) {
			outputText("\n\n", false);
			outputText("Your horns shift, shrinking into two small demonic-looking horns.", false);
			player.horns = 2;
			player.hornType = HORNS_DEMON;
			dynStats("cor", 3);
		}		
	}
	//Nipples Turn Back:
	if(player.hasStatusAffect("Black Nipples") >= 0 && rand(3) == 0) {
		outputText("\n\nSomething invisible brushes against your " + nippleDescript(0) + ", making you twitch.  Undoing your clothes, you take a look at your chest and find that your nipples have turned back to their natural flesh colour.");
		player.removeStatusAffect("Black Nipples");
	}
	//remove fur
	if((player.faceType != FACE_HUMAN || player.skinType != SKIN_TYPE_PLAIN) && rand(3) == 0) {
		//Remove face before fur!
		if(player.faceType != FACE_HUMAN) {
			outputText("\n\n", false);
			outputText("Your visage twists painfully, returning to a more normal human shape, albeit with flawless skin.  <b>Your face is human again!</b>", false);
			player.faceType = FACE_HUMAN;
		}
		//De-fur
		else if(player.skinType != SKIN_TYPE_PLAIN) {
			outputText("\n\n", false);
			if(player.skinType == SKIN_TYPE_FUR) outputText("Your skin suddenly feels itchy as your fur begins falling out in clumps, <b>revealing inhumanly smooth skin</b> underneath.", false);
			if(player.skinType == SKIN_TYPE_SCALES) outputText("Your scales begin to itch as they begin falling out in droves, <b>revealing your inhumanly smooth " + player.skinTone + " skin</b> underneath.", false);
			player.skinType = SKIN_TYPE_PLAIN;
			player.skinDesc = "skin";
		}
	}
	//Demon tongue
	if(player.tongueType == TONUGE_SNAKE && rand(3) == 0) {
		outputText("\n\nYour snake-like tongue tingles, thickening in your mouth until it feels more like your old human tongue, at least for the first few inches.  It bunches up inside you, and when you open up your mouth to release it, roughly two feet of tongue dangles out.  You find it easy to move and control, as natural as walking.  <b>You now have a long demon-tongue.</b>", false);
		player.tongueType = TONUGE_DEMONIC;
	}
	//foot changes - requires furless
	if(player.skinType == SKIN_TYPE_PLAIN && rand(4) == 0) {
		//Males/genderless get clawed feet
		if(player.gender <= 1) {
			if(player.lowerBody != LOWER_BODY_TYPE_DEMONIC_CLAWS) {
				outputText("\n\n", false);
				outputText("Every muscle and sinew below your hip tingles and you begin to stagger. Seconds after you sit down, pain explodes in your " + player.feet() + ". Something hard breaks through your sole from the inside out as your toes splinter and curve cruelly. The pain slowly diminishes and your eyes look along a human leg that splinters at the foot into a claw with sharp black nails. When you relax, your feet grip the ground easily. <b>Your feet are now formed into demonic claws.</b>", false);
				player.lowerBody = LOWER_BODY_TYPE_DEMONIC_CLAWS;
			}
		}
		//Females/futa get high heels
		else if(player.lowerBody != LOWER_BODY_TYPE_DEMONIC_HIGH_HEELS) {
			outputText("\n\n", false);
			outputText("Every muscle and sinew below your hip tingles and you begin to stagger. Seconds after you sit down, pain explodes in your " + player.feet() + ". Something hard breaks through your sole from the inside out. The pain slowly diminishes and your eyes look along a human leg to a thin and sharp horn protruding from the heel. When you relax, your feet are pointing down and their old posture is only possible with an enormous effort. <b>Your feet are now formed into demonic high-heels.</b> Tentatively you stand up and try to take a few steps. To your surprise you feel as if you were born with this and stride vigorously forward, hips swaying.", false);	
			player.lowerBody = LOWER_BODY_TYPE_DEMONIC_HIGH_HEELS;
		}
	}
	//Grow demon wings
	if(player.wingType != WING_TYPE_BAT_LIKE_LARGE && rand(8) == 0 && player.cor >= 50) {
		//grow smalls to large
		if(player.wingType == WING_TYPE_BAT_LIKE_TINY && player.cor >= 75) {
			outputText("\n\n", false);
			outputText("Your small demonic wings stretch and grow, tingling with the pleasure of being attached to such a tainted body.  You stretch over your shoulder to stroke them as they unfurl, turning into full-sized demon-wings.  <b>Your demonic wings have grown!</b>", false);
			player.wingType = WING_TYPE_BAT_LIKE_LARGE;
			player.wingDesc = "large, bat-like";
		}
		else if(player.wingType == WING_TYPE_SHARK_FIN) {
			outputText("\n\n", false);
			outputText("The muscles around your shoulders bunch up uncomfortably, changing to support the new bat-like wings growing from your back.  You twist your head as far as you can for a look and realize your fin has changed into ", false);
			outputText("small ", false);
			player.wingType = WING_TYPE_BAT_LIKE_TINY;
			player.wingDesc = "tiny, bat-like";
			outputText("bat-like demon-wings!", false);
		}
		else if(player.wingType == WING_TYPE_BEE_LIKE_SMALL || player.wingType == WING_TYPE_BEE_LIKE_LARGE) {
			outputText("\n\n", false);
			outputText("The muscles around your shoulders bunch up uncomfortably, changing to support your wings as you feel their weight increasing.  You twist your head as far as you can for a look and realize they've changed into ", false);
			if(player.wingType == WING_TYPE_BEE_LIKE_SMALL) {
				outputText("small ", false);
				player.wingType = WING_TYPE_BAT_LIKE_TINY;
				player.wingDesc = "tiny, bat-like";
			}
			else {
				outputText("large ", false);
				player.wingType = WING_TYPE_BAT_LIKE_LARGE;
				player.wingDesc = "large, bat-like";
			}
			outputText("<b>bat-like demon-wings!</b>", false);
		}
		//No wings
		else if(player.wingType == WING_TYPE_NONE) {
			outputText("\n\n", false);
			outputText("A knot of pain forms in your shoulders as they tense up.  With a surprising force, a pair of small demonic wings sprout from your back, ripping a pair of holes in the back of your " + player.armorName + ".  <b>You now have tiny demonic wings</b>.", false);
			player.wingType = WING_TYPE_BAT_LIKE_TINY;
			player.wingDesc = "tiny, bat-like";
		}
		
	}
}

public function killCocks(deadCock:Number):void {
	//Count removal for text bits
	var removed:Number = 0;
	//Holds cock index
	var storedCock:Number = 0;
	//Less than 0 = PURGE ALL
	if(deadCock < 0) {
		deadCock = player.cocks.length;
	}
	//Double loop - outermost counts down cocks to remove, innermost counts down 
	while(deadCock > 0) {
		//Find shortest cock and prune it
		temp = player.cocks.length;
		while(temp > 0) {
			temp--;
			//If anything is out of bounds set to 0.
			if(storedCock > player.cocks.length-1) storedCock = 0;
			//If temp index is shorter than stored index, store temp to stored index.
			if(player.cocks[temp].cockLength <= player.cocks[storedCock].cockLength) storedCock = temp;
		}
		//Smallest cock should be selected, now remove it!
		player.removeCock(storedCock, 1);
		removed++;
		deadCock--;
		if(player.cocks.length == 0) deadCock = 0;
	}
	//Texts
	if(removed == 1) {
		if(player.cocks.length == 0) {
			outputText("<b>Your manhood shrinks into your body, disappearing completely.</b>", false);
			if(player.hasStatusAffect("infested") >= 0) outputText("  Like rats fleeing a sinking ship, a stream of worms squirts free from your withering member, slithering away.", false);
		}
		if(player.cocks.length == 1) {
			outputText("<b>Your smallest penis disappears, shrinking into your body and leaving you with just one " + cockDescript(0) + ".</b>", false);
		}
		if(player.cocks.length > 1) {
			outputText("<b>Your smallest penis disappears forever, leaving you with just your " + multiCockDescriptLight() + ".</b>", false);
		}
	}
	if(removed > 1) {
		if(player.cocks.length == 0) {
			outputText("<b>All your male endowments shrink smaller and smaller, disappearing one at a time.</b>", false);
			if(player.hasStatusAffect("infested") >= 0) outputText("  Like rats fleeing a sinking ship, a stream of worms squirts free from your withering member, slithering away.", false);
		}
		if(player.cocks.length == 1) {
			outputText("<b>You feel " + num2Text(removed) + " cocks disappear into your groin, leaving you with just your " + cockDescript(0) + ".", false);
		}
		if(player.cocks.length > 1) {
			outputText("<b>You feel " + num2Text(removed) + " cocks disappear into your groin, leaving you with " + multiCockDescriptLight() + ".", false);
		}
	}
	//remove infestation if cockless
	if(player.cocks.length == 0) player.removeStatusAffect("infested");
	if(player.cocks.length == 0 && player.balls > 0) {
		outputText("  <b>Your " + sackDescript() + " and " + ballsDescriptLight() + " shrink and disappear, vanishing into your groin.</b>", false);
		player.balls = 0;
		player.ballSize = 1;
	}
}
