switch(argument0)
{
    case 0:
        obj_text.message[0] = "*Hello World!";
        obj_text.message[1] = "*Already said it.";
        obj_text.message[2] = "*Oh."; 
        message_current = 2; //0 is the first number in our array, and the message we are currently at
        message_end = 2; //2 is the last number in our array
        message_draw = ""; //this is what we 'write' out. It's blank right now
        increase = 0.8; //the speed at which new characters are added
        characters = 0; //how many characters have already been drawn
        hold = 0; //if we hold 'Z', the text will render faster
		portrait = "none";
        font = "";
        position = "bottom";
        sound = "";
        Index = "";
        Speed = "";
        character_old = 0;
        message_length = string_length(message[message_current]); //get the number of characters in the first message
		font = fnt_normal;
        //}
        break;
    }
 
 
 

