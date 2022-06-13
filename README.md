# TheElection
We will be creating a democratic election simulator, where the user has the jurisdiction to alter parameters that influence the election outcome. The map will be a square board divided into cells that represent city blocks. These blocks will have three states: red, blue or green. The user has the option to change the parameters as follows: map size, population influence, spontaneity, and election speed, and other factors. After the initial configuration is set, the simulation will run in accordance with a set in-game timer. At this point, the user can manually influence (our artificial processes) the simulation by clicking on city blocks/clusters of city blocks, thereby influencing the political affiliations of that portion. The election will run for 100 days,  and the three voting systems represented are ranked choice, popular, and electoral (districts are 5x5 cells).

## Prototype Document
https://docs.google.com/document/d/1IMG-1jxzZRgsRCG8IJXrjXYCTqxE4GwWS1KqnZR8yFk/edit

## Compile/Run Instructions:
1. Clone the repository
2. Run the processing Folder
3. In program simulation instructions are provided

## Development Log:
### 5/23
Alvin Chen:<br/>
Created and finished the properties of tileSquares and began working on the display for the simulation
<br/>

Craig Chen:<br/>
Created skeleton of all classes needed for the simulation along with map made up of several tiles
### 5/24
Alvin Chen:<br/>
Implemented peer influence variable factor along with increase decrease function through key clicked. Loops through every tileSquare and then further loops around each tileSquare to compute red neighbors and blue neighbors. Precautions taken to make sure no index out of bounds errors.
<br/>

Craig Chen:<br/>
Set up a 2-D array of tileSquare to portray a map and made a constructor method that took in board length input to set up a map filled with randomly assigned colors (red or blue). Began natural process code skeleton, peer influence and wild factor
### 5/25
Alvin Chen:<br/>
Worked with the wild factor key clicked and variable in tileElection. Helped to debug natural processes code bugs with peer influence. Began on Direct influence code.
<br/>

Craig Chen:<br/>
Allowed for the successful execution of the wild factor method with proper probabilities and logical numeral values. Then also had to make it work alongside the peer influence implementation within the natural processes code.
### 5/26
Alvin Chen:<br/>
Created tileDistrict class and put in place variables needed for proper process and means. Debugged an issue that caused a scaling error with influence methods that caused replaced tiles to be placed at vastly different x and y coordinates from where they should have been.
<br/>

Craig Chen:<br/>
 Implemented a timer and timer mode for direct influence that could show spread over time rather than a set radius.
### 5/27
Alvin Chen:<br/>
Allowed for swapping between circle and square mode. Placed into effect an direct influence effectiveness technique for realistic purposes so that radius could spread but not everything within radius would have to be affected
<br/>

Craig Chen:
Began the administration of a more realistic influence visual and effect, a circle influence rather than one that is square. Replaced repetitive timer and operation code with a radius variable.
### 5/28
Alvin Chen:<br/>
Furthered efforts in debugging the mysterious scaling issue of the circle. First established a naive solution and placed it into function. However after further deliberate investigation into the mouse x and y calculations and distance calculations with the for loops, naive solution was able to be replaced with proper code and logical coded
<br/>

Craig Chen:<br/>
Stuck on error that caused a scalar issue with y value of circle. Moved on to implementing a direct influence speed variable that would only apply with a radius time mode. During time mode the influence radius or area of effect could increase at an increasing speed or decreasing speed now.
### 5/29
Alvin Chen:<br/>
Expanded width of display while maintaining the 750x750 display of the map. The expanded area now allocated for variable display and key display for key clicked
<br/>

Craig Chen:<br/>
Added a red count and blue count and with red and blue instance variables implemented a counting system that spanned across all mutator methods to keep track of red count and blue count without having to do a full array search and count every time
### 5/30
Alvin Chen:<br/>
Major prototype review and brushing up with evaluation of the demo code. Assisted in brainstorming for gerrymandering implementation.

<br/>

Craig Chen:<br/>
Finished the proper display of all the key clicked variables along with simulation display variables. Speculating for possibilities for mechanisms for gerrymandering code.

### 5/31
Alvin Chen:<br/>
Brainstorming ideas to implement after demo
<br/>

Craig Chen:<br/>
Tried to think of possible ways to implement gerrymandering
### 6/1
Alvin Chen:<br/>
Brainstormed idea of rank system and district system for election to implement after demo aside from just popular vote
<br/>

Craig Chen:<br/>
Continued to ponder possible ways to implement gerrymandering. Perhaps a drawing line method that could be used then with floodfill to partition districts
### 6/2
Alvin Chen:<br/>
Researched how to take input for processing program
<br/>

Craig Chen:<br/>
Contemplated how to create randomly generated districts that could be modified
### 6/3
Alvin Chen:<br/>
Questioning possibility of actually establishing gerrymandering, Triangle formulas to partition enclosed areas to establish districts.
<br/>

Craig Chen:<br/>
Decided to only take one input that being the board size. This would be done with mousepressed and mouseX coordinate
### 6/6
Alvin Chen:<br/>
Constructing a pseudo time system within the program. This would be in terms of / units of days, specifically 100

<br/>

Craig Chen:
Resolved float error and order of operations bug in circle code that became an issue again
### 6/7
Alvin Chen:<br/>
Assisted with the mechanizing of the internal time clock, utilized millis()
<br/>

Craig Chen:<br/>
Reautomated natural process to take effect every pseudo day rather than every space click. This would allow for a more natural and efficient sequence of operations
### 6/8
Alvin Chen:<br/>
“Rank System” implemented where on day 25 the least popular party is removed and then the individuals from the party change political affiliation based on last color or random
<br/>

Craig Chen:<br/>
Updated the use of millis() and incorporated new variables in order to maintain the function of the time system even with a decrease and increase natural speed function
### 6/9
Alvin Chen:<br/>
Figured out the logic of District Line and District Counter code using approximately the same backbone of code (for loops with multiples of 5)


<br/>

Craig Chen:<br/>
Finished the beginning screen with all the text boxes and proper spacing to create accurate input application.

### 6/10
Alvin Chen:<br/>
Redid the UML digram.


<br/>

Craig Chen:<br/>
Reviewed Key Pressed and added upper and lower bounds. Set up the design of the end screen

### 6/12
Alvin Chen:<br/>
Tested simulation and finishing up work on the prototype

<br/>

Craig Chen:<br/>
Tested simulation and finishing up work on the prototype
