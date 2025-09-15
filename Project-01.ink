/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

Project-01 The Woods

VAR visited_cabin = false
VAR hunting_rifle = false
VAR bullet = 1

-> start
== start ==
You wake up from a brief nap on top of your hunting stand. You went with your father on a hunting trip. You swear you only closed your eyes for a few minutes but it seems many hours have passed. The woods are now cloaked in darkness with your father no where to be found. To make matters worse, your hunting rifle is missing. Scared, alone, and unsure you need to find a way out of here. Your gut is telling you so. Your memory of the terrain is the greatest strength you have.
* [Descend Ladder] 

-> paths

== paths ==
You descend the ladder and find your footing on the ground. The forrest is oddly still, no bugs or noises to be heard. The small trail leading away from the stand splits into three passages. What do you decide?
+ [Left] Take the left trail -> cabin
+ [Middle] Take the middle trail -> the_clearing
+ [Right] Take the right trail -> dads_huntingstand

== the_clearing ==
You aimlessly walk down the trial until you arrive at a opening in the treeline. Its a grassy field glistening in the moonlight. You still notice how there is no forrest sounds. You decide to observe a little more.
+ [Observe] -> obeserve_clearing 

== obeserve_clearing ==
After staying still and looking closer into the field you notice something unusual. You see a herd of deer but it is off. The grass is tall in the center, too tall to see a regular deers head but yet your eyes dont lie. They must all be standing on their hind legs. Are they walking like people?
-> paths
+ [Push forward] Go deeper into the clearing -> deeper_clearing

== deeper_clearing ==
You sneak through the grass but your still making noise. The deer have already noticed you long before. They are approaching you. You must make a quick decision.
+ [Hide] Crouch in the grass -> hide
+ [Return] Flee the scene before the deer catch you. -> paths


== hide ==
You try to make yourself as small as possible but its no use. They find you. They are not deer. They walk like people, look like deer, they are hungry. You made the wrong choice.
-> END



== dads_huntingstand ==
You walk on up to where you think your father is. He is not there but his clothes are. They are neatly folded on top of the stand. You get a terrible feeling in your gut.
+ [inspect the clothes] Take a closer look at the clothes. -> dads_clothes

== dads_clothes ==
You inspect his shirt, jacket, and pants further. You notice a strange, awful smell to them but weridly enough they look clean. You wonder why your dad would fold his clothes and pressumably walk around the woods unclothed. You are left with more questions than answers.
-> paths

== cabin ==
~ temp initial_visit = not visited_cabin
~ visited_cabin = true
{initial_visit:
You walk into the abandoned living room to find your hunting rifle. Its dusty and dirty. It has one bullet in the chamber.
- else:
You have already been here. You notice dust has collected everywhere, even where your rifle was laying.
}
+ [Pick up rifle] 
~ hunting_rifle = true 
{bullet == 1:
You have **1 bullet** left in the chamber
{bullet} > 1:
There are **{bullet} bullets** left.
- else:
The rifle is emptied.
}
{hunting_rifle:
Your rifle is now with you. You feel slighlty safer
- else:
You leave the rifle where it lays.
}
-> DONE
