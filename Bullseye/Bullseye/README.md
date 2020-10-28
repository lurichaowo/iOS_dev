# Notes
## Other than the notes inside of the actual source files, this is just conceptual stuff went over in the textbook

### Model View Controller (MVC)
One of the 3 fundamental design patterns in iOS
    The other two being Delegation and target-action (connecting events like button taps to action methods)

MVC pattern states that the app can split into 3 groups
- Model Objs: contains data and any operations on data 
    - ie - like recipies in a cookbook app
    - or design of level, player score, and pos of monsters
    - operations are also called business rules or domain logic - ie - the high scores form the data model in highscore screen    
- View Obj: visual part of the app 
    - images, buttons, labels, etc
    - can draw itself and responds to user input 
    - doesnt handle app logic 
    - can be used in diff apps b/c not tied to specific data model
- Controller Objs: connects data model objs to views 
     - listens to taps on the views
     - makes data model objs so some calc in response 
     - updates the views to reflect the new state of model 
     - controller is in charge
     - called "View Controller" in iOS
##### Take a look at page 615 in Chapter 21 
View Controller has one main view accessible through its view property 
    - but can contain many subviews
    - ie - main view is UITableView and subviews are the table view cells 
        - each cell has their own subview being the text labels
View Controller handles one screen
    - multiple screens means each one is handled by its own view controller and the app can flow between them 
Mainly need to make own View Controllers
     - but iOS does come with some built in ones

##### View is obj that appears on the screen! View Controller is the bridge that works behind the scene between data model and views!

    

        
     
