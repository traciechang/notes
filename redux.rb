# Redux - Fruit Stand App 1/4/17

# - React will be used for the buttons and our fruit list
# - Redux will be responsible for managing/remembering our fruit basket

# Redux
# - Store:
#     - maintains reference to our application state
#     - maintains pointer to Reducer
#     - Dispatch() method - when invoked, tells store to change our application state
#         > dispatch an action object
#         dispatch({ a })
#         action has some property called type
#         - Store will use Reducer and pass in the old state, as well as action object.
#         - Reducer takes these things and produces new state.
#         new state will update old state.
#     - getState() method
#         > use this to get new state (updated object)


# ES6 implicit return:
# const addOrange = () => ({

# })

# React components made up of 2 layers:
# - Container: interact w/ redux pieces. Talks to Store via connect function from React/Redux library
#     - generates props and pass them to Presentational layer
#     - Props include:
#         - pieces of state (ex: list of fruits)
#         - event handlers (ex: click handler like add apple)
#     - also interacts w/ action creators and dispatch actions
# - Presentational: describe how our components should look. Rarely has more than render function

# by I

# - flux/redux are not frameworks. they are philosophies (ways to do something)

# - in React, you have button where u click and install clickhandler
# - dispatch listens for actions. when it hears, it will dispatch acction to store
# - once store is updated, it notifies all views that are subscribed to it to re-render

# - flux very boilerplate > u see same structure of code duplicated alot, with minor differences. Ex: u make cat store, dog, lizard, etc.

# Redux:
# 1. Single Source of Truth:
#  > redux has one store for everything in your app. One giant hash.
# 2. State is Read Only 
#  > 
 
#  - u can think of reducer as a small step between Dispatch and Store, to prevent direct changes to the store.

 **********************************************

 - every component is a function and props is passed in as argument by default

 // 2 ways of writing React components

// "dumb" components
 // -> stateless function
   // most cases it's meant to just be pure simple DOM

const Root => (props, ...someOtherArgs) => {
  return (
    <div>
      I'm Root
    </div>
  )
}

const Root => (props) =>
  <div>
    I'm Root
  </div>




// "smart"/"stateful" components
// any state
// you require a lifecycle method

import React from 'react';

class Root extends React.Component {
  // constructor(props) => {

  // }

  renderTitle(title) => {
    <h1>{title}</h1>
  }

  render() {
    this.state;
    this.props;
    this.renderTitle();

    return (
      <div>
        I'm Root
      </div>
    )
  }
}

- stateless function: no state, no functions like didmount, etc
- if you want state, use class Something extends React.Component

// FLUX

// ACTIONS
  // is simply on object
  // i.e.
    {
      type: 'createTodo',
      payload: {
        data: ...,
        name: '',
      }
    }
  // i.e click handler
// DISPATCH
  (action) => {
    case action.type:
      when 'createTodo': (payload) => {
        catStore.createNewCat(payload);
      }
  }
  // actions gets dispatched
  // registry of callbacks based on the action that it receives
  // case statements
    // if the action is 'whistle blow'
      // do something in the store
// STORE
  // 'subscribes' to a dispatcher
  // place where your data/state is kept
  // an array
  // any data structure
  // after the store is updated, it emits a change event
    // this tells whatever views inside of the change event's callback to update themselves
class CatStore {
  this.cats = [];

  const create = (payload) => {
    this.cats.push(payload);
  }

  const all = () => {
    return cats;
  }

  const find = (id) => {
    cats.forEach((cat) => {
      if (cat.id == id) { return cat; }
    })
  }
}

CatStore = []
DogStore = []
LizardStore = []

store = {
  cats: [],
  dogs: [],
  lizards: ['norbert'],
}

// reducer
// action add new lizard
// 1. takes whatever was previously in lizard slice of the state tree
// 2. you do what want with that previous state.
// 3. you rewrite that new state to the slice of the state tree


// VIEW

// RAILS

// HTTP VERB
// DELEGATION OF CONTROLLER ACTION
// DATABASE / CONTROLLER THINGS
// VIEW / RESPONSE


