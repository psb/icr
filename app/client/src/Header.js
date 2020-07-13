import React from "react";
import logo from "./logo.png";

function Header() {
  return (
    <div className="row my-4 align-items-center">
      <div className="col-auto">
        <a href="https://www.icr.ac.uk/">
          <img src={logo} alt="ICR logo" width="300" />
        </a>
      </div>
      <div className="col text-center">
        <a href="/" className="text-body" style={{ "text-decoration": "none" }}>
          <h1 className="display-4">Cancer Genes DB</h1>
        </a>
      </div>
    </div>
  );
}

export default Header;
