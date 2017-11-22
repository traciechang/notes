Javascript Intro 11/21/17

- Constructor Functions:
function NBAPlayer(name, team, pos){
    this.name = name;
    this.team = team;
    this.pos = pos;
}

const curry = new MBAPlayer();

- every function in js has a prototype property defined on it

NBAPlayer.prototype.dunk = function(){};

# method style invocation
curry.dunk(); <- how does it know it has dunk defined for curry?


curry.__proto__ === MBAPlayer.prototype

- js will first look to see if dunk is defined on curry, which it isn't. It will then look at curry's prototype, which is MBAPlayer, and see that it has dunk defined on it

- We could also do this:
    function NBAPlayer(name, team, pos){
        this.name = name;
        this.team = team;
        this.pos = pos;
        this.dunk = function(){};
    }

    however, we would be creating this function for every instance of MBAPlayer we create, which is not DRY


****************************************************
- Callbacks and Closures

callback: a function that is passed to another function as an argument that is to be used at a later time