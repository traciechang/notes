Redux - Fruit Stand App 1/4/17

- React will be used for the buttons and our fruit list
- Redux will be responsible for managing/remembering our fruit basket

Redux
- Store:
    - maintains reference to our application state
    - maintains pointer to Reducer
    - Dispatch() method - when invoked, tells store to change our application state
        > dispatch an action object
        dispatch({ a })
        action has some property called type
        - Store will use Reducer and pass in the old state, as well as action object.
        - Reducer takes these things and produces new state.
        new state will update old state.
    - getState() method
        > use this to get new state (updated object)


ES6 implicit return:
const addOrange = () => ({
    
})