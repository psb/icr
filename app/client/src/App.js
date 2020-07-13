import React from "react";
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";
// import "./App.css";
import Home from "./Home";
import Gene from "./Gene";

function App() {
  return (
    <Router>
      <div className="App">
        <Switch>
          <Route path="/gene">
            <Gene />
          </Route>
          <Route path="/">
            <Home />
          </Route>
        </Switch>
      </div>
    </Router>
  );
}

export default App;
