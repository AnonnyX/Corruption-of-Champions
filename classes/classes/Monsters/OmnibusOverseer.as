package classes.Monsters 
{
	import classes.Cock;
	import classes.Monster;
	
	/**
	 * ...
	 * @author aimozg
	 */
	public class OmnibusOverseer extends Monster 
	{
		
		public function OmnibusOverseer(mainClassPtr:*) 
		{
			super(mainClassPtr);
			init1Names("the ", "Omnibus Overseer", "omnibusoverseer", "The 'woman' before you is clothed only in a single strip of fabric that wraps around her bountiful chest.  She has striking red eyes that contrast visibly with her blue skin and dark make-up.  Shiny black gloss encapsulates her kissable bubbly black lips.  Her most striking feature is her crotch, which appears neither male nor female.  She has a puffy wet vulva, but a cock-shaped protrusion sprouts from where a clit should be.");
			init2Male(new Cock(10,1.5),0,0,3);
			init2Female(VAGINA_WETNESS_DROOLING,VAGINA_LOOSENESS_NORMAL);
			init3BreastRows(0);

			this.temperment = 3;
			//Regular attack
			this.special1 = 11043;
			//Lust attack
			this.special2 = 11044;

			this.pronoun1 = "she";
			this.pronoun2 = "her";
			this.pronoun3 = "her";

			//Clothing/Armor
			this.armorName = "demonic skin";
			this.weaponName = "claws";
			this.weaponVerb = "claw";
			this.armorDef = 15;

			this.weaponAttack = 10;

			this.weaponValue = 150;

			//Primary stats
			this.str = 65;
			this.tou = 45;
			this.spe = 45;
			this.inte = 85;
			this.lib = 80;
			this.sens = 70;
			this.cor = 80;

			//Combat Stats
			this.bonusHP = 200;
			this.HP = eMaxHP();

			this.lust = 20;
			this.lustVuln = 0.75;

			//Level Stats
			this.level = 8;
			this.XP = totalXP();
			this.gems = rand(25)+10;

			//Appearance Variables
			//Gender 1M, 2F, 3H
			this.gender = 2;
			this.tallness = rand(9) + 70;
			this.hairColor = "purple";
			this.hairLength = 42;

			this.skinTone = "light purple";
			this.skinDesc = "skin";

			this.wingDesc = "tiny hidden";

			this.lowerBody = LOWER_BODY_TYPE_DEMONIC_HIGH_HEELS;

			this.tailType = TAIL_TYPE_DEMONIC;

			this.hipRating = 8;

			this.buttRating = 2;
			//Create succubus sex attributes
			this.ass.analLooseness = 1;
			this.ass.analWetness = 35;			
		}
		
	}

}