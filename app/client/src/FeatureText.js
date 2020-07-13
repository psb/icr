import React from "react";

function FeatureText(props) {
  if (props.hasFeature) {
    return <span className="text-success"> Yes</span>;
  } else {
    return <span className="text-danger"> No</span>;
  }
}

export default FeatureText;
