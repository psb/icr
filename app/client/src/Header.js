import React from "react";
import logo from "./logo.png";

function Header() {
  return (
    <div className="row pt-4 align-items-center">
      <div className="col-auto">
        <img src={logo} alt="ICR logo" width="300" />
      </div>
      <div className="col text-center">
        <h1 className="display-4">Cancer Genes DB</h1>
      </div>
    </div>
  );
}

export default Header;
