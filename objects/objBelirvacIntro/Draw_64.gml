event_inherited();

switch (state)
{
	case "text_1":
		text = "My " + global.player_title + ", a hooded man has entered your court uninvited. He carries an aura of authority with him, and he refused to speak with anyone but yourself."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_2":
		text = global.player_name + ", is it? A quaint little town you have you, child. Do you know who I am?"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "introduction":
		text = "I see you are either new to this land or incredibly ignorant - neither are desirable qualities. Very well, I believe an introduction is in order."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "I am Belirvac, a seeker of lost mysteries, delver of bygone places and giver of immortality. Ring any bells?"
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "no_introduction":
		text = "Perhaps you are not as ignorant as I first assumed. I'm almost pleased."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_3":
		text = "You see, child, this valley was once home to a ancient civilisation, the likes of which this continent has yet to rival. A civilisation so glorious could only fall in an equally glorious way - a phenomenon of frost, encasing the people and their homes in a thick layer of ice... preserving them perfectly."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Over the ages, earth and darkness buried this once proud civilisation, until but few remember their strength and prowess. I, however, could forget not a prize of such value."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_4":
		text = "I'll cut to the chase. I intend to liberate those that dwell beneath this valley, and your petty town sits atop my prize."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "But let no one say that Belirvac is not generous. I will give you some time to remove yourself from my path. Should you still dwell here upon my return, there shall be no mercy - at least, not for the living."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_5":
		text = "Belirvac... now that's a name I've not heard in a long while. My parents used to scare me into staying home at night by telling me that old Belirvac lurked the streets in the twilight hours, turning little children into thralls. I didn't believe he actually existed..."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		text = "Make no mistake, " + global.player_name + ", that man is a necromancer. I don't know what he wants with those preserved bodies beneath the valley, but it can't be good."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
	case "text_6":
		text = "It seems that " + global.town_name + " is the only thing in between Belirvac and his dastardly ambition. If you would heed my counsel, I say that we must stoke the fires, prepare our soldiers and strengthen our walls, if we are to stand firm against this foe."
		yText=draw_encounter_text(text, fnEncounterItalics, yText)
		break;
}