# TheElection
The is an election simulator written in Processing developed by Craig Chen and Alvin Chen. Our objective is to create a comprehensive simulation in which the user has jurisdiction over parameters that may influence election outcomes. There are two political parties, represented by the colors red and blue. Each square unit is a “population,” and each rectangular block represents a district. The user has jurisdiction over the following: map size, peer influence, wild factor (spontaneity), and other forms of election influence. This simulation should be an accurate simplification of modern-day democratic elections.
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
