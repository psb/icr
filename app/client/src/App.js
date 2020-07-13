import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import Header from "./Header";
import Home from "./Home";
import Gene from "./Gene";

function App() {
  return (
    <Router>
      <div className="container">
        <Header />
        <Switch>
          <Route path="/:geneId" component={Gene} />
          <Route path="/">
            <Home />
          </Route>
        </Switch>
      </div>
    </Router>
  );
}

export default App;
