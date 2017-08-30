switch(argument0)
{
    case 0:
        obj_text.message[0] = "*Hello World!";
        obj_text.message[1] = "*Already said it.";
        obj_text.message[2] = "*Oh.";
 
        message_current = 0; //0 is the first number in our array, and the message we are currently at
        message_end = 2; //2 is the last number in our array
        message_draw = ""; //this is what we 'write' out. It's blank right now
        increase = 0.8; //the speed at which new characters are added
        characters = 0; //how many characters have already been drawn
        hold = 0; //if we hold 'Z', the text will render faster
        portrait = "";
        font = "";
        position = "bottom";
        sound = "";
        Index = "";
        Speed = "";
        character_old = 0;
        message_length = string_length(message[message_current]); //get the number of characters in the first message
       
            if(message_current == 0)
            {
                font = fnt_example;
                portrait = "example";
                sound = snd_plaintext;
                Index = spr_example_talk;
                Speed = spr_example_talk;
                obj_example.image_speed = 0.5;
                if (obj_example.sprite_index = spr_example)
                {
                    obj_example.sprite_index = spr_example_talk;
                }
            }
            else if(message_current == 1)
            {
                font = fnt_player;
                portrait = "player";
                sound = snd_player;
                Index = spr_player_talk;
                Speed = spr_player_talk;
                obj_player.image_speed = 0.5;
                if (obj_player.sprite_index = spr_player)
                {
                    obj_player.sprite_index = spr_player_talk;
                }
            }
            else if(message_current == 2)
            {
                font = fnt_example;
                portrait = "example";
                sound = snd_plaintext;
                Index = spr_example_talk;
                Speed = spr_example_talk;
                obj_example.image_speed = 0.5;
                if (obj_example.sprite_index = spr_example)
                {
                    obj_example.sprite_index = spr_example_talk;
                }
            }
        //}
        break;
    }
 
 
 

